#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza nome asset", "Visualizza tipo asset", "Visualizza stato aggregato asset", "Visualizza descrizione asset", "Visualizza lista requisiti asset"),
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
        + L'utente seleziona un asset dalla lista.
        + Il sistema mostra il nome dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome asset").
        + Il sistema mostra il tipo dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza tipo asset").
        + Il sistema mostra la descrizione dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione asset").
        + Il sistema mostra la lista dei requisiti applicabili all'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista degli asset #sym.arrow  #use-case-label(nome-etichetta: "Visualizza lista asset").
    ],

    post-condizioni: [
        - Il dettaglio dell'asset è visualizzato con la lista dei requisiti applicabili.
    ],

    trigger: [
        L'utente seleziona un asset dalla lista per visualizzarne il dettaglio.
    ],

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza nome asset")
        - #use-case-label(nome-etichetta: "Visualizza tipo asset")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato asset")
        - #use-case-label(nome-etichetta: "Visualizza descrizione asset")
        - #use-case-label(nome-etichetta: "Visualizza lista requisiti asset")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
