#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza stato della valutazione assessment unit"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:[
        Utente
    ],
    
    scenario-principale:[
        + Il sistema esegue il decision tree associato
        + L'utente visualizza lo stato della valutazione dell'assessment unit
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un'assessment unit o un decision tree a essa associato
    ],
    
    post-condizioni:[
        - L'utente visualizza lo stato della valutazione dell'assessment unit

    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
