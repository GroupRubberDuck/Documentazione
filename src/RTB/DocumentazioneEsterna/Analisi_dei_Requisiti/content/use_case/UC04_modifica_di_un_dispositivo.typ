#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica di un dispositivo"
#let depth=1
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + L'utente seleziona la funzionalità di modifica dei dati del dispositivo.
        + Il sistema mostra l'interfaccia con i dati attuali del dispositivo (Scheda tecnica e Versione dello standard).
        + L'utente modifica le informazioni desiderate.
        + L'utente conferma le modifiche.
        + Il sistema valida i nuovi dati inseriti.
        + Il sistema aggiorna le informazioni del dispositivo.
        + Il sistema conferma l'avvenuto aggiornamento all'utente.
    ],
    pre-condizioni:[
        - L'utente è autenticato.
        - Il sistema è attivo.
        - Esiste almeno un dispositivo registrato nel sistema.
        - L'utente ha selezionato il dispositivo di cui vuole modificare i dati.
    ],
    post-condizioni:[
        - Le informazioni aggiornate del dispositivo sono registrate nel sistema.
        - La permanenza dei dati è aggiornata.
    ],
    trigger:[
       L'utente seleziona la funzionalità di modifica del dispositivo
    ],
    scenari-alternativi:[
        - *Cambio versione standard*: Se l'utente modifica la versione dello standard, il sistema richiede una conferma esplicita (Vedi UC04.1).
        - *Dati non validi*: L'utente inserisce dati errati o incompleti (Vedi UC04.2).
    ],
    inclusioni:none,
    estensioni:[
        - UC04.1: Avviso cambio versione standard.
        - UC04.2: Errore dati dispositivo non validi.
    ],
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)