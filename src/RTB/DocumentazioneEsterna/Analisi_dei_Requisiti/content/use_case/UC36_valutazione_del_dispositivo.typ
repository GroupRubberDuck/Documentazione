#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Valutazione del dispositivo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:[Utente],
    
    scenario-principale:[
        + Per ogni asset associato al dispositivo
            + Il sistema valuta l'asset
        + Il sistema aggrega gli stati di vallutazione #footnote()[
            - Se vi è almeno un "fail", lo stato aggregato è "fail"
            - Se non vi sono "fail" e vi è almeno uno "in corso", lo stato aggregato è "in corso"
            - Se non vi sono "fail" e non vi sono "in corso", lo stato aggregato è "pass"
            ] <nota-aggregazione>
        + L'utente visualizza lo stato aggregato
    ],
    
    pre-condizioni:[
        - L'utente ha inserito un dispositivo per la verifica

    ],
    
    post-condizioni:[
        - L'utente visualizza lo stato aggregato della valutazione
    ],
    
    trigger:[
        L'utente seleziona la funzione di valutazione del dispositivo
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
