#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza singolo elemento lista asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: ("Visualizza nome asset", "Visualizza tipo asset", "Visualizza stato aggregato asset"),
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
        + L'utente visualizza il nome dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome asset")
        + L'utente visualizza il tipo dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza tipo asset")
        + L'utente visualizza lo stato aggregato dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato aggregato asset")
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista degli asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista asset")
    ],

    post-condizioni: [
        - L'utente ha visualizzato le informazioni generali relative all'asset
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza nome asset")
        - #use-case-label(nome-etichetta: "Visualizza tipo asset")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato asset")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
