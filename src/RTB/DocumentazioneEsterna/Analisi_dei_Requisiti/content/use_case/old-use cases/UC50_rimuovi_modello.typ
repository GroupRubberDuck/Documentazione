#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Rimuovi modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema rimuove il modello dal sistema di permanenza
    ],
    
    pre-condizioni:[
        - Il sistema non ha in attivo sessioni di modifica del modello o di valutazione
    ],
    
    post-condizioni:[
        - Il modello è stato eliminato dal sistema di permanenza
    ],
    
    trigger:[
        Il #sudo Seleziona un modello per la rimozione
    ]
    ,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
