#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: ("Visualizza nodo decision tree",),
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
        + Il sistema legge le informazioni legate al decision tree dello specifico requisito nel contesto dell'asset
        + Il sistema inserisce le risposte alle domande dei nodi salvate in memoria
        + Per ogni nodo del decision tree:
            + L'utente visualizza le informazioni legate al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza nodo decision tree")
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio del requisito nel contesto dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio requisito").

    ],

    post-condizioni: [
        - L'utente visualizza il decision tree legato al requisito nel contesto dell'asset
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza nodo decision tree")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: none,
)
