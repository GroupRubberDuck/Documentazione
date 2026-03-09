#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Rimuovi nodo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema controlla se il nodo ha figli
        + Il sistema elimina il nodo 
    ],
    
    pre-condizioni:[
        - L'utente ha selezionato un nodo per la visualizzazione nel dettaglio
    ],
    
    post-condizioni:[
        - Il nodo selezionato è stato rimosso dal sistema
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di rimozione di un nodo   ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
