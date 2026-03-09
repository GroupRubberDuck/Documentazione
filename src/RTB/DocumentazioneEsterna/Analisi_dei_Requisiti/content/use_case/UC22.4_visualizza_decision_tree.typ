#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

Mostra altro
12:42
typst
#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza generale nodo decision tree"),
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
        + Il sistema recupera il decision tree associato al requisito.
        + Il sistema mostra graficamente i nodi e i collegamenti del decision tree.
        + Il sistema mostra le informazioni generali di ogni nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza generale nodo decision tree").
        + L'utente può selezionare un nodo per visualizzarne il dettaglio #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decision tree").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizzazione in dettaglio requisito").
        - Il decision tree associato al requisito è disponibile nel sistema.
    ],

    post-condizioni: [
        - Il decision tree del requisito è visualizzato graficamente.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza generale nodo decision tree")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
