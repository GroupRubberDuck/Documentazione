#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva valutazione"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema salva l'attuale stato della valutazione
    ],
    
    pre-condizioni:[
        - L'utente ha inserito un dispositivo per la valutazione
    ],
    
    post-condizioni:[
        - L'utente può vedere il nuovo file sul suo file system locale
    ],
    
    trigger:[
        L'utente ha selezionato la funzionalità di salvataggio dei dati
    ],
    
    scenari-alternativi:[
        - Errore nel salvataggio dei dati
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Salva sul file corrente")
        - #use-case-label(nome-etichetta: "Salva come nuovo file")
    ],
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
