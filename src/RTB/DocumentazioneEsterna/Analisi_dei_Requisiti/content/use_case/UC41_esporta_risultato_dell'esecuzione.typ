#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Esporta risultato dell'esecuzione"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema genera un report sui risultati
        + L'utente scarica il report sul suo file system locale
    ],
    
    pre-condizioni:[
        - L'utente ha eseguito una valutazione del dispositivo
    ],
    
    post-condizioni:[
        - L'utente può visualizzare il report sul suo file system locale
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di esportazione dei risultati
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
