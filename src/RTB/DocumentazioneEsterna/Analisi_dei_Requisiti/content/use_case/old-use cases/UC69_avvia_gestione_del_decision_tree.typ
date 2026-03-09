#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label, Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avvia gestione del decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema avvia la sottosessione di modifica del decision tree
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sottosessione di modifica di un requisito
    ],
    
    post-condizioni:[
        - Il sistema ha avviato la sessione di modifica del decision tree
    ],
    
    trigger:[
        L'utente seleziona la funzione di gestione del decision tree 
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
