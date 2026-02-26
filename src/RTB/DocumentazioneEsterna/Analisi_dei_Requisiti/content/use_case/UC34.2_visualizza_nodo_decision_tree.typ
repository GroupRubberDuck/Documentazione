#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza nodo decision tree"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza graficamente la posizione del nodo nel DT #use-case-label(nome-etichetta: "Visualizza decision tree graficamente")
        + L'utente visualizza il codice relativo nodo #use-case-label(nome-etichetta: "Visualizza codice del nodo")
        + L'utente visualizza la domanda relativa al nodo #use-case-label(nome-etichetta: "Visualizza domanda del nodo")
        + L'utente visualizza la risposta associata al nodo #use-case-label(nome-etichetta: "Visualizza risposta del nodo")
        + L'utente visualizza l'informazioni allegate alla risposta #use-case-label(nome-etichetta: "Visualizza evidenze del nodo")

    ],
    
    pre-condizioni:[
        - L'utente sta navigando il decision tree
        - L'utente è arrivato su uno specifico nodo tramite la navigazione
    ],
    
    post-condizioni:[
        - L'utente può modifcare il contenuto del nodo
        - L'utente può passare alla visualizzazione del nodo successivo
        - L'utente può passare alla visualizzazione del nodo precedente
    ],
    
    trigger:[
        + L'utente ha selezionato un nodo per la visualizzazione dettagliata
    ],
    
    scenari-alternativi:[
        - Nodo non ancora compilato
        - Nodo foglia
        - Nodo root
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
