#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Selezione della risposta del nodo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona l'opzione di uscita del nodo, ovvero la risposta
    ],
    
    pre-condizioni:[
        - L'utente sta compilando il nodo
    ],
    
    post-condizioni:[
        - Il sistema associa la nuova risposta al nodo
    ],
    
    trigger:[
        - L'utente seleziona l'opzione di modifica della risposta del DT
    ],
    
    scenari-alternativi:[
        - Annullamento della modifica
        - Nessuna opzione selezionata
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
