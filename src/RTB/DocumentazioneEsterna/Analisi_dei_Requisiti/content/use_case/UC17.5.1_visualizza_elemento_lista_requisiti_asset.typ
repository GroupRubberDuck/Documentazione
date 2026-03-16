#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza elemento lista requisiti asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (
        "Visualizza codice requisito da lista requisiti",
        "Visualizza stato valutazione requisito da lista requisiti"
    ),
    extends: (:),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%,
    actor-offset: 0
)

#use-case-template(
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + L'utente visualizza il nome del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito da lista requisiti")
        + L'utente visualizza lo stato di valutazione del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato valutazione requisito da lista requisiti")
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista dei requisiti dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset")
    ],

    post-condizioni: [
        - L'utente visualizza le informazioni generali legate al singolo requisito nel contesto dell'asset
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza codice requisito da lista requisiti")
        - #use-case-label(nome-etichetta: "Visualizza stato valutazione requisito da lista requisiti")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: none,
)
