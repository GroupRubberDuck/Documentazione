#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Gestione della valutazione del DT"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:[
        Utente
    ],
    
    scenario-principale:[
        + Per ogni nodo del DT
            + Compila il nodo del decision tree #use-case-label(nome-etichetta: "compilazione nodo")
    ],
    
    pre-condizioni:[L'utente sta visualizzando un'assessment unit],
    
    post-condizioni:[
        - L'utente ha compilato il nodo
        - L'utente può navigare il DT
    ],
    
    trigger:[
        L'utente ha selezionato la funzionalità di gestione della valutazione del decision tree
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
