#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Aggiunta asset tramite interfaccia"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce il nome dell'asset
        + L'utente inserisce il tipo dell'asset
        + L'utente inserisce la descrizione dell'asset
        + L'utente visualizza un messaggio di inserimento avvenuto con successo
    ],
    
    pre-condizioni:[
        - L'utente è autenticato
        - Il sistema ha avviato la sessione di valutazione su un dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha registrato il nuovo asset
        - L'utente può inserire un altro asset
        - L'utente può iniziare la valutazione dell'asset
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
