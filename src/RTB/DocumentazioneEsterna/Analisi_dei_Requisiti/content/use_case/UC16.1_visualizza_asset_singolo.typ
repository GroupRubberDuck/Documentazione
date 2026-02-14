#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza asset singolo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        - L'utente visualizza il tipo di asset 
        - L'utente visualizza i requisiti associati
        - L'utente visualizza lo stato della verifica degli asset
        - L'utente visualizza il nome dell'asset
        - L'utente visualizza il tipo dell'asset (security, network)
        - L'utente visualizza la descrizione dell'asset
    ],
    
    pre-condizioni:[
        - Il sistema è attivo 
        - Il sistema ha avviato il processo di verifica di un dispositivo
        - L'utente è autenticato
        - Il sistema ha in memoria le informazioni dell'asset
    ],
    
    post-condizioni:[
        - L'utente visualizza le informazioni dell'asset
        - L'utente può selezionare l'asset per la visualizzazione nel dettaglio
        - L'utente può selezionare l'asset per la modifica
        - L'utente può selezionare l'asset per l'eliminazione
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
