#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento dati non validi"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente ha compilato uno o più campi con dati nulli, formato errato o caratteri non ammessi
    ],
    
    pre-condizioni:[
        - L'Utente sta interagendo con un form di inserimento o modifica.
        - L'Utente ha tentato di salvare dati che violano i vincoli di validazione.
    ],
    
    post-condizioni:[
        - Le modifiche o i nuovi dati non sono stati salvati nel sistema.
        - Il Sistema visualizza un messaggio di errore esplicativo.
        - L'interfaccia di inserimento rimane aperta permettendo la correzione.
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)