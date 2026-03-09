#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avvia modifica di un requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema avvia la sottosessione di modifica del requisito 
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Nel sistema è attiva la sottosessione di modifica relativa al requisito selezionato
    ],
    
    trigger:[
        L'utente seleziona
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
