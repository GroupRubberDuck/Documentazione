#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva inserimenti del requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema salva le modifiche apportate al requisito sulla bozza operativa
        + Il sistema chiude la sottosessione di modifica del requisito

    ]
    ,
    
    pre-condizioni:[
        - Nel sistema è attiva una sottosessione di modifica di un requisito
    ],
    
    post-condizioni:[
        - Il sistema ha registrato le modifiche apportate dal #sudo
        - Nel sistema non è più attiva la sottosessione di modifica del requisito
    ],
    
    trigger:[
        L'utente ha selezionato la funzionalità di salvataggio delle modifiche del requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
