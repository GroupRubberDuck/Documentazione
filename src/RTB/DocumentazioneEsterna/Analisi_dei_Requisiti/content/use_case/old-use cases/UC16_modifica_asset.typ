#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce le informazioni per la modifica
        + L'utente conferma le modifiche
        + Il sistema registra le modifiche
    ],
    
    pre-condizioni:[
        - L'utente è autenticato
        - Il sistema è attivo
        - Il sistema ha avviato una sessione di valutazione
        - L'utente sta visualizzando un asset
    ],
    
    post-condizioni:[
        - Le informazioni dell'asset sono state eliminate dal sistema
    ],
    
    trigger:[L'utente seleziona la funzionalità di modifica dell'asset],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
