#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Errore importazione file"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Sistema", 
    
    scenario-principale:[
        + Il Sistema rileva un'anomalia nel file selezionato dall'utente durante la fase di validazione preliminare o di parsing
        + Il Sistema interrompe immediatamente la procedura di caricamento
        + Il Sistema scarta i dati parzialmente letti (se presenti)
        + Il Sistema mostra un messaggio di errore specifico all'utente indicando la natura del problema
    ],
    
    pre-condizioni:[
        - L'utente ha avviato il caricamento di un file (Dispositivo o Asset).
        - Il file selezionato non rispetta i vincoli di sistema.
    ],
    
    post-condizioni:[
        - Nessun dato è stato importato nel sistema.
        - Viene visualizzato l'errore bloccante.
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
