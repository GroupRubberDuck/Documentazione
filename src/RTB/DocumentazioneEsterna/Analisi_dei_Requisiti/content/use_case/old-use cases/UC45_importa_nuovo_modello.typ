#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Importa nuovo modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo seleziona il file da importare dal suo file system locale
        + Il sistema controlla i metadati del file
        + Il sistema interpreta il contenuto del file
        + Il sistema valida le informazioni estratte
        + Il sistema aggiunge al suo sistema di persistenza il modello di standard importato
    ],
    
    pre-condizioni:[
        - Il #sudo è autenticato
        - Il sistema non ha in esecuzione nessuna sessione di modifica del modello
    ],

    post-condizioni:[
        + Il sistema ha aggiunto al proprio sistema di persistenza il modello importato
    ],
    
    trigger:[
        Il #sudo seleziona la funzionalità di importazione di un nuovo modello di standard
    ],
    
    scenari-alternativi:[
        - Metadati non validi
        - Struttura del file non valida 
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
