#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label, Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avvia sessione di modifica su modello esistente"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema avvia la sessione di modifica relativa al modello selezionato
        + Il sistema mostra l'interfaccia di modifica dello standard
    ],
    
    pre-condizioni:[
        - Il #sudo è autenticato
        - Il sistema non ha registrato altre sessioni di modifica in esecuzione
    ],
    
    post-condizioni:[
        - La sessione di modifica è attiva all'interno del sistema
    ],
    
    trigger:[
        Il #sudo ha selezionato la funzione per l'avvio di una sessione di modifica
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
