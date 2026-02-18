#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza riepilogo requisiti"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni requisito associato all'asset
            + L'utente visualizza le informazioni generiche del requisito
            + L'utente visualizza lo stato della valutazione

    ],
    
    pre-condizioni:[
        - Il sistema è attivo 
        - Il sistema ha avviato il processo di valutazione di un dispositivo
        - L'utente è autenticato
        - Il sistema ha in memoria le informazioni dell'asset
    ],
    
    post-condizioni:[
        - L'utente può selezionare l'asset per la visualizzazione nel dettaglio
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
