#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Errore nella selezione"

#use-case-template(
    
    nome:use-case-nome,
    
    livello-intestazione:2+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema annulla l'operazione
    ],
    
    pre-condizioni:[
    - Il sistema è online
    - I file selezionati non possono essere letti dal sistema
],
    
    post-condizioni:[
    - L'operazione viene annullata
    - L'utente visualizza un messaggio di errore
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
