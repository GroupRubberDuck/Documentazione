#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Errore dati dispositivo non validi"
#let depth=2
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + Il sistema esegue la validazione dei dati inseriti.
        + Il sistema rileva che uno o più campi obbligatori sono vuoti o contengono caratteri non ammessi.
        + Il sistema blocca il salvataggio delle modifiche.
        + Il sistema visualizza un messaggio di errore specificando i campi non validi.
    ],
    pre-condizioni:[
        - L'utente è in fase di modifica del dispositivo.
        - L'utente inserisce dati errati o incompleti per il dispositivo.
    ],
    post-condizioni:[
        - Messaggio d'errore visibile all'utente.
    ],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)