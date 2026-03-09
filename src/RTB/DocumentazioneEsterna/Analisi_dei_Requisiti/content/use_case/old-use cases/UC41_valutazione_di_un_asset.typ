#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Valutazione di un asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni requisito applicabile associato all'asset
            + Il sistema valuta la conformità al requisito
        + Il sistema aggrega gli stati di vallutazione @nota-aggregazione
        + L'utente visualizza lo stato aggregato
        

    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un'asset
    ],
    
    post-condizioni:[
        - L'utente visualizza lo stato aggregato della valutazione dell'asset
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di valutazione di un'asset
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
