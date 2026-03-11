#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Vai al nodo successivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (),
    extends: (
        "Nodo senza risposta selezionata": [L'utente tenta di procedere al nodo successivo senza aver selezionato una risposta],
    ),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%
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
        - L'utente sta visualizzando il dettaglio di un nodo di decisione
    ],

    post-condizioni: [
        - L'utente visualizza il nodo di decisione successore all'interno del decision tree
    ],

    trigger: [
        L'utente vuole visualizzare il nodo successivo
    ],

    scenari-alternativi: [
    + L'utente tenta di procedere senza aver selezionato una risposta per il nodo corrente
    + Il nodo successore è un nodo foglia
    ],

    inclusioni: none,

    estensioni: [

    ],

    generalizzazioni: none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
