#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Aggiungi nodo fail"
#let depth=4
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
   
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema aggiunge un nodo foglia con valore FAIL
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sottosessione di gestione del decision tree a cui aggiungere 
        - L'utente ha selezionato un nodo per la visualizzazione nel dettaglio
        ],
    
    post-condizioni:[
        - Nel decision tree è stato aggiunto un nodo foglia con valore FAIL
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di aggiunta di un nodo foglia con valore FAIL
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
