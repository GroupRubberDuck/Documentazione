#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza evidenze del nodo"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza l'evidenza associata al nodo
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un nodo del decision tree
    ],
    
    post-condizioni:[
        - L'utente visualizza l'evidenza associata al nodo
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Nessuna evidenza inserita
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "visualizza info")
        - #use-case-label(nome-etichetta: "visualizza just")
    ],
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
