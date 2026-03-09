#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Vai al nodo precedente"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: (),
    extends: (
        "Errore nodo corrente è root": [L'utente tenta di tornare indietro dal nodo radice],
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
        + L'utente seleziona l'opzione per tornare al nodo precedente.
    ],

    pre-condizioni: [
        - L'utente sta navigando il decision tree:#use-case-label(nome-etichetta: "Navigazione del DT").
    ],

    post-condizioni: [
        - Il sistema mostra il nodo precedente del decision tree.
    ],

    trigger: none,

    scenari-alternativi:[
    + L'utente tenta di tornare indietro dal nodo radice: #use-case-label(nome-etichetta: "Errore nodo corrente è root").
    ],

    inclusioni: none,

    estensioni: [
        - #use-case-label(nome-etichetta: "Errore nodo corrente è root")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
