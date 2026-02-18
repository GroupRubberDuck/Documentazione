#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Navigazione del decision tree"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
            + L'utente visualizza un nuovo nodo del decision tree
        ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un nodo del DT
    ],
    
    post-condizioni:[
        - L'utente visualizza un nuovo nodo del decision tree
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di navigazione dei nodi del decision tree 
    ],
    
    scenari-alternativi:[
        - Nodo da compilare
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
