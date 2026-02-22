#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Rimuovi dipendenza"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        - Il sistema rimuove la dipendenza selezionata
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sottosessione di modifica di un requisito
    ],
    
    post-condizioni:[
        - Il sistema ha rimosso la dipendenza selezionata dalle informazioni del requisito
    ],
    
    trigger:[
        Il #sudo seleziona una dipendenza per la rimozione
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
