#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Sospendi inserimento dei dati"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema salva le informazioni inserite fino a quel momento
    ],
    
    pre-condizioni:[
        - L'utente ha apportato modifiche all'asset
        - Il sistema rileva dati incompleti o non validi 
        ],
    
    post-condizioni:[
        - Il sistema mantiene le modifiche apportate
        - Il sistema associa all'asset lo stato verifica in sospeso
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
