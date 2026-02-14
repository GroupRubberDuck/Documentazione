#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Eliminazione di un asset"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema elimina le informazioni dell'asset
        + L'utente visualizza un messaggio di conferma dell'eliminazione
    ],
    
    pre-condizioni:[
        - L'utente è autenticato
        - Il sistema è attivo
        - Il sistema ha avviato una sessione di verifica
        - L'utente sta visualizzando un asset
    ],
    
    post-condizioni:[
        - Le informazioni dell'asset sono state eliminate dal sistema
    ]
    ,
    
    trigger:[L'utente seleziona la funzionalità di eliminazione  dell'asset],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
