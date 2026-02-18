#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva come nuovo file"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente specifica il percorso in cui creare il file
        + Il sistema crea il nuovo file contente le informazioni
    ],
    
    pre-condizioni:[
        - L'utente ha inserito un dispositivo da verificare
    ],
    
    post-condizioni:[
        - L'utente può vedere il file sul suo file system locale
    ],
    
    trigger:[
        L'utente seleziona la funzione di salvataggio del file come nuovo file
    ],
    
    scenari-alternativi:none,
    
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
