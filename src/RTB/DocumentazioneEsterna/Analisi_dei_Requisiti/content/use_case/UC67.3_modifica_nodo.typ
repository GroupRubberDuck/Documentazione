#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica nodo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo può inserire la domanda del nodo
        + Il #sudo può inserire il la descrizione dell'evidenza del nodo
        + Il sistema avvia la sottosessione per la gestione dei nodi del decision tree
        + Il sistema apre l'interfaccia per la gestione dei nodi
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sottosessione di modifica di un requisito
    ],
    
    post-condizioni:[
        - Sono state apportate le modifiche al decision tree
        - Il sistema avvia la sottosessione di gestione dei decision tree
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Il codice è usato
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
