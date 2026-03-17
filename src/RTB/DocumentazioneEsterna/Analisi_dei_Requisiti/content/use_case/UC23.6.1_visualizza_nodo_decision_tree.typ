#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: ("Visualizza stato attività",),
    extends: (:),
    generalizations: (
        "Visualizza nodo di decisione",
        "Visualizza nodo foglia",

    ),
    spacing: (1.5cm, 2cm),
    diagram-scale: 70%,
    actor-offset: 0,
    top-padding: 1
)


#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],
    
    scenario-principale: [
        + L'utente visualizza lo stato di attività del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato attività")
        + L'utente visualizza le informazioni legate al nodo
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando il decision tree
    ],
    
    post-condizioni: [
        - L'utente ha visualizzato le informazioni del nodo
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza stato attività")
    ],
    
    estensioni: none,

    generalizzazioni: [
                        - #use-case-label(nome-etichetta: "Visualizza nodo di decisione")
                        - #use-case-label(nome-etichetta: "Visualizza nodo foglia")
    ],
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption:none,
)
