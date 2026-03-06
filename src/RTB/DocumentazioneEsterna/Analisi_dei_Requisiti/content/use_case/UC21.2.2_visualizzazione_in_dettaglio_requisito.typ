#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizzazione in dettaglio requisito"
#let depth=3

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza codice requisito", "Visualizza descrizione normativa", "Visualizza dipendenze requisito", "Visualizza decision tree"),
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
        + Il sistema mostra il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito").
        + Il sistema mostra la descrizione normativa del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione normativa").
        + Il sistema mostra le dipendenze del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza dipendenze requisito").
        + Il sistema mostra il decision tree associato al requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza decision tree").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista dei requisiti dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset").
    ],

    post-condizioni: [
        - Il dettaglio del requisito è visualizzato con il decision tree associato.
    ],

    trigger: [L'utente seleziona un requisito dalla lista per visualizzarne il dettaglio.],

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza codice requisito")
        - #use-case-label(nome-etichetta: "Visualizza descrizione normativa")
        - #use-case-label(nome-etichetta: "Visualizza dipendenze requisito")
        - #use-case-label(nome-etichetta: "Visualizza decision tree")
    ],
    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
