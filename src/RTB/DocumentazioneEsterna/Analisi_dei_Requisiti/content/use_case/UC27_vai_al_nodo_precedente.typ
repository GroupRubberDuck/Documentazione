#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Vai al nodo precedente"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (),
    extends: (
        "Nodo corrente root":[
            L'utente cerca di passare al nodo predecessore della root
        ]
    ),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%,
    actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

attore-principale: "Utente",

    scenario-principale: [
        + L'utente seleziona l'opzione per tornare al nodo precedente.
        + Il sistema identifica il nodo predecessore
        + Il sistema reindirizza l'utente al nodo predecessore
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di un nodo decisionale all'interno di una valutazione
    ],

    post-condizioni: [
        - L'utente visualizza correttamente il dettaglio del nodo predecessore
    ],
    
    trigger: [
        L'utente vuole navigare al nodo precedente
    ],

    scenari-alternativi:[
    + L'utente tenta di tornare indietro dal nodo root #sym.arrow #use-case-label(nome-etichetta: "nodo corrente root")
    ],

    inclusioni: none,

    estensioni: [
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: none,
)
