#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista requisiti asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizzazione generale requisito"),
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
        + Il sistema recupera i requisiti applicabili all'asset.
        + Per ogni requisito il sistema mostra le informazioni generali #sym.arrow #use-case-label(nome-etichetta: "Visualizzazione generale requisito").
        + L'utente può selezionare un requisito per visualizzarne il dettaglio #sym.arrow #use-case-label(nome-etichetta: "Visualizzazione in dettaglio requisito").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio asset").
        - L'asset ha almeno un requisito applicabile.
    ],

    post-condizioni: [
        - La lista dei requisiti applicabili all'asset è visualizzata.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizzazione generale requisito")
    ],
    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
