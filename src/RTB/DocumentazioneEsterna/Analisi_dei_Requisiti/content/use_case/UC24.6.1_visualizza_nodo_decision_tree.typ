#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: ("Visualizza codice nodo", "Visualizza domanda nodo", "Visualizza risposta nodo"),
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
    
    inclusioni: none,
    
    estensioni: none,

    generalizzazioni: [
        - Nodo di decisione
        - Nodo foglia
    ],
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
