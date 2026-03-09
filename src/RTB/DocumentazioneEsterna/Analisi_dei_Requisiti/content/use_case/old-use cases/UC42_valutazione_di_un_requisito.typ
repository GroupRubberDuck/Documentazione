#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Valutazione di un requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni assessment unit oggetto del requisito
            + Il sistema valuta la conformità delle assessment unit
        + Il sistema aggrega gli stati di vallutazione @nota-aggregazione
        + L'utente visualizza lo stato aggregato
        ],
    
    pre-condizioni:[
        L'utente sta visualizzando un requisito
    ],
    
    post-condizioni:
    [
        - L'utente visualizza lo stato della valutazione del requisito
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di valutazione di un requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
