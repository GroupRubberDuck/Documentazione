#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Errore durante il salvataggio automatico"
#let depth=2
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + Il sistema rileva un fallimento critico durante il salvataggio dei dati.
        + Il sistema visualizza un messaggio di avviso indicando che i dati non possono essere salvati.
        + Il sistema richiede all'utente la conferma per chiudere la sessione perdendo le modifiche recenti.
    ],
    pre-condizioni:[
        - Il sistema sta tentando di eseguire il salvataggio automatico.
        - Si valuta un'eccezione tecnica che impedisce la scrittura dei dati.
    ],
    post-condizioni:[
        - La sessione viene chiusa.
        - Le modifiche della sessione corrente non sono state mantenute.
    ],
    trigger:[
        Il sistema richiede conferma prima di chiudere la sessione senza salvataggio riuscito.
    ],
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)