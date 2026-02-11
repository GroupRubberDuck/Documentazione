#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Annulla selezione"


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
    - L'utente vuole selezionare uno o più file dal file system locale
    ],
    
    post-condizioni:[
        - L'operazione è stata annullata
        - L'utente visualizza un messaggio di annullamento
    ],
    
    trigger:[
        L'utente seleziona l'opzione di annullamento della selezione
    ]
    ,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
