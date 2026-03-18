#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista requisiti asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc: "Visualizza dettaglio asset",
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (
        "Visualizza elemento lista requisiti asset",
    ),
    extends: (:),
    generalizations: (),
    spacing: (3.5cm, 2cm),
    diagram-scale: 80%,
    actor-offset: 0
)

#use-case-template(
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + Per ogni elemento della lista dei requisiti:
            + L'utente visualizza le informazioni generali legate al requisito di quell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza elemento lista requisiti asset") 

    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di uno specifico asset #use-case-label(nome-etichetta: "Visualizza dettaglio asset")
    ],

    post-condizioni: [
        - L'utente visualizza la lista dei requisiti nel contesto dello specifico asset
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza dettaglio asset")
    ],
    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: none,
)
