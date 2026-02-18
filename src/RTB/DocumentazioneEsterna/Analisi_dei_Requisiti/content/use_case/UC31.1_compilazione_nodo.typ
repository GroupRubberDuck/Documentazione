#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Compilazione nodo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il nodo #use-case-label(nome-etichetta: "visualizza nodo decision tree")
        + L'utente seleziona una risposta alla domanda #sym.arrow #use-case-label(nome-etichetta: "Selezione della risposta del nodo")
        + L'utente inserisce una giustificazione a una domanda #sym.arrow #use-case-label(nome-etichetta: "Aggiungi just")
        + Il sistema registra le informazioni inserite
        + Il sistema aggiorna il path disponibile
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un nodo
    ],
    
    post-condizioni:[
        - L'utente può ricompilare il nodo
        - Il nodo assume lo stato compilato
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente annulla la compilazione del nodo
        - L'utente sospende la compilazione
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Aggiungi just")
        - #use-case-label(nome-etichetta: "Aggiungi info")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
