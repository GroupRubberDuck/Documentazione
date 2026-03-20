#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: (
        "Visualizza codice requisito",
        "Visualizza nome del requisito",
        "Visualizza descrizione normativa",
        "Visualizza stato valutazione requisito",
        "Visualizza lista dipendenze requisito",
        "Visualizza decision tree",
        "Visualizza giustificazione decision tree",

    ),
    extends: (:),
    generalizations: (),
    spacing: (4.5cm, 0.5cm),
    diagram-scale: 70%, 
    actor-offset: 0
)

#use-case-template(
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + L'utente seleziona un requisito dalla lista dei requisiti dell'asset
        + L'utente visualizza il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito")
        + L'utente visualizza la descrizione normativa del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome del requisito")
        + L'utente visualizza la descrizione del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione normativa")
        + L'utente visualizza lo stato della valutazione del requisito #sym.arrow #use-case-label(nome-etichetta:"Visualizza stato valutazione requisito" )
        + L'utente visualizza le dipendenze del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista dipendenze requisito")
        + L'utente visualizza il decision tree associato al requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza decision tree")
        + L'utente visualizza la giustificazione associata al nodo del decsion tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza giustificazione decision tree")
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista dei requisiti dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset")
    ],

    post-condizioni: [
        - L'utente ha visualizzato il dettaglio del requisito
        - L'utente ha visualizzato il decision tree
    ],

    trigger: [
        Vuole visualizzare il dettaglio di un requisito nel contesto dell'asset
    ],

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza codice requisito")
        - #use-case-label(nome-etichetta: "Visualizza nome del requisito")
        - #use-case-label(nome-etichetta: "Visualizza descrizione normativa")
        - #use-case-label(nome-etichetta: "Visualizza stato valutazione requisito" )
        - #use-case-label(nome-etichetta: "Visualizza lista dipendenze requisito")
        - #use-case-label(nome-etichetta: "Visualizza decision tree")
        - #use-case-label(nome-etichetta: "Visualizza giustificazione decision tree")
    ],
    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: none,
)
