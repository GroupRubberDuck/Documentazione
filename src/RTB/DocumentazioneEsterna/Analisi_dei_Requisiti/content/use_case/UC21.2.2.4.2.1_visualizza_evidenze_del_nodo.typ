#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza evidenze del nodo"
#let depth=6

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza info", "Visualizza just"),
    extends: (:),
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
        + Il sistema mostra le evidenze associate al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza info"), #use-case-label(nome-etichetta: "Visualizza just").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decision tree").
    ],

    post-condizioni: [
        - Le evidenze del nodo sono visualizzate.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza info")
        - #use-case-label(nome-etichetta: "Visualizza just")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)