#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Errore importazione file"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente", 
    
    scenario-principale:[
        + L'utente seleziona e tenta di caricare un file (Dispositivo o Asset) che presenta anomalie di struttura o contenuto.
        + Il Sistema rileva l'errore durante la validazione preliminare o di parsing e interrompe immediatamente il processo di caricamento.
        + Il Sistema scarta eventuali dati parzialmente letti.
        + L'utente visualizza un messaggio di errore specifico mostrato dal Sistema che indica la natura del problema.
    ],
    
    pre-condizioni:[
        - L'utente ha selezionato la funzionalità che prevede il caricamento di un file esterno.
        - L'utente ha selezionato un file che non rispetta i vincoli del sistema.
    ],
    
    post-condizioni:[
        - L'utente riceve e visualizza l'errore bloccante.
        - Nessun dato è stato importato o salvato nel sistema a seguito dell'azione dell'utente.
    ],
    
    trigger:[
        - L'utente cerca di caricare un file non valido.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)