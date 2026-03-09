#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza graficamente il decision tree
        + Per ogni nodo del decision tree attraversato dal percorso selezionato
            + L'utente visualizza il nodo
        + L'utente visualizza lo stato della valutazione
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un'assessment unit
    ],
    
    post-condizioni:[
        - L'utente può compilare un qualsiasi nodo del decision tree 
    ],
    
    trigger:[
        L'utente seleziona la funzionalità visualizza decision tree
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
