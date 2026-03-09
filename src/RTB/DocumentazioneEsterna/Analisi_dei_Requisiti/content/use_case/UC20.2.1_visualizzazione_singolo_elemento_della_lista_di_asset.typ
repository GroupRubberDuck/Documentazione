#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizzazione singolo elemento della lista di asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
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
        + Il sistema mostra il nome dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome asset").
        + Il sistema mostra il tipo dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza tipo asset").
        + Il sistema mostra lo stato aggregato dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato aggregato asset").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista degli asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista asset").
    ],

    post-condizioni: [
        - Le informazioni generali dell'asset sono visualizzate nella lista.
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
