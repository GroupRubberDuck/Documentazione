#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Rimuovi requisito"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il Sistema controlla le dipendenze uscenti del requisito
        + Il sistema chiede la conferma per l'eliminazione del requisito
        + Il #sudo conferma l'eliminazione del requisito
        + Il sistema elimina il requisito
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Il requisito selezionato è stato eliminato dal sistema
        - Le informazioni relative al requisito selezionato sono state eliminate
    ],
    
    trigger:[
        Il #sudo ha selezionato la funzionalità di rimozione di un requisito
    ],
    
    scenari-alternativi:[
        - Un altro requisito dipende da questo requisito
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
