#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza riepilogo risultati"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il numero di asset valutati con esito positivo
        + L'utente visualizza gli asset valutati con esito positivo
        + L'utente visualizza il numero di asset valutati con esito negativo
        + L'utente visualizza gli asset valutati con esito negativo
        + L'utente visualizza il numero di asset la cui valutati è sospesa
        + L'utente visualizza gli asset la cui valutati è sospesa
    ],
    
    pre-condizioni:[
        - L'utente è autenticato
        - Il sistema è attivo
        - Il sistema ha caricato in memoria un dispositivo da valutare
        - L'utente ha eseguito una valutazione
    ],
    
    post-condizioni:[
        - L'utente visualizza un riepilogo dei risultati della valutazione effettuata sul dispositivo 
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di visualizzazione del riepilogo dei risultati 
    ],
    
    scenari-alternativi:[
        - Lista asset vuota
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
