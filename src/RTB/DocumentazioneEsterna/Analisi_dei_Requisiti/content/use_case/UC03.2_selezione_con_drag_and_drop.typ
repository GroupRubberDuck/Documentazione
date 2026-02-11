#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Selezione con drag and drop"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
    + Il sistema mostra una drop zone
    + L'utente seleziona uno o più file dal file system locale
    + L'utente trascina i file selezionati sulla drop zone
    + Il sistema acquisisce il percorso assoluto dei file
    ],
    
    pre-condizioni:[
    - Il sistema è online
    - L'utente vuole selezionare uno o più file dal file system locale
    - Il drag and drop è supportato
],
    
    post-condizioni:[
    - L'utente ha selezionato uno o più file dal file system locale
    - Il sistema ha memorizzato i path dei file selezionati
] ,
    
    trigger:[
        L'utente seleziona la funzionalità importa file con drag and drop
    ],
    
    scenari-alternativi:[
        - L'utente rilascia il file fuori drop zone 
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
