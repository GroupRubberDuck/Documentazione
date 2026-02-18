#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva sul file corrente"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema sovrascrive le informazioni precedenti
    ],
    
    pre-condizioni:[
        - L'utente ha inserito un dispositivo da verificare
    ],
    
    post-condizioni:[
        - L'utente può vedere il file sul suo file system locale
    ],
    
    trigger:[
        L'utente seleziona la funzione di salvataggio sul file corrente 
    ],
    
    scenari-alternativi:[
        - Non è stato specificato un percorso sul file system locale
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
