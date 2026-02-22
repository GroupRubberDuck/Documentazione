#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Elimina dispositivo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente seleziona il bottone di eliminazione del dispositivo
        + Il Sistema elimina i dati del dispositivo e degli asset già associati ad esso
        + Il Sistema riporta l'Utente allo stato iniziale 
    ],
    
    pre-condizioni:[
        - L'Utente ha importato o creato almeno un dispositivo nel sistema.
        - L'Utente ha selezionato il dispositivo da rimuovere.
    ],
    
    post-condizioni:[
        - Il Sistema ha effettuato l'eliminazione del dispositivo
    ],
    
    trigger:[
        L'Utente preme il pulsante di eliminazione del dispositivo.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)