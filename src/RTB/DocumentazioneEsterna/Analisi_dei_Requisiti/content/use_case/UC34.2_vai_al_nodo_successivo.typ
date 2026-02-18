#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Vai al nodo successivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il nodo successivo
    ],
    
    pre-condizioni:[
        l'utente sta visualizzando un nodo
    ],
    
    post-condizioni:[
        + L'utente visualizza il nodo successivo
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        + Nodo foglia
        + Risposta non inserita
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
