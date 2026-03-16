#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Vai al nodo successivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (),
    extends: (
        "Nodo senza risposta selezionata": [L'utente tenta di procedere al nodo successivo senza aver selezionato una risposta],
        "Nodo successore foglia":[
            L'utente tenta di procede al nodo di decisione successivo ma il nodo successore è un nodo foglia
        ]
    ),
    generalizations: (),
    spacing: (0.5cm, 2cm),
    diagram-scale: 70%,
    actor-offset: 2,
    note-offset:(0.8,0.5)
)



#use-case-template(
    
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + L'utente seleziona l'opzione per procedere al nodo successivo
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di uno specifico nodo decisionale del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisionale")
    ],
    

    post-condizioni: [
        - L'utente visualizza il nodo di decisione successore all'interno del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisionale")
    ],

    trigger: [
        L'utente vuole visualizzare il nodo successivo
    ],

    scenari-alternativi: [
    - L'utente tenta di procedere senza aver selezionato una risposta per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Nodo senza risposta selezionata")
    - Il nodo successore è un nodo foglia #sym.arrow #use-case-label(nome-etichetta: "Nodo successore foglia")
    ],

    inclusioni: none,

    estensioni: [
    - #use-case-label(nome-etichetta: "Nodo senza risposta selezionata")
    - #use-case-label(nome-etichetta: "Nodo successore foglia")        
    ],

    generalizzazioni: none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption: none,
)
