#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza contesto di una assessment unit"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema ricostruisce il contesto gerarchico all'interno dell'asset
        + L'utente visualizza il codice del requisito che sta analizzando #use-case-label(nome-etichetta: "visualizza codice del requisito")
        + L'utente visualizza il nome del requisito che sta analizzando #use-case-label(nome-etichetta: "visualizza nome del requisito")

    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un'assessment unit
    ],
    
    post-condizioni:[
        -  L'utente visualizza il contesto dell'assessment unit
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)



