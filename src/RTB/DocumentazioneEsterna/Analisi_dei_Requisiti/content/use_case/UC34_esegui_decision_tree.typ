#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Esegui decision tree"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema esegue il decision tree
        + L'utente vede il risultato dell'elaborazione
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un decision tree
    ],
    
    post-condizioni:[
        - L'utente vede il risultato della nuova valutazione decision tree
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Il decision tree non è stato compilato fino ad un nodo foglia
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
