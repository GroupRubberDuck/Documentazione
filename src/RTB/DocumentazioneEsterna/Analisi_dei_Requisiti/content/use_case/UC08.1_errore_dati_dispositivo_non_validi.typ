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
        + L'Utente modifica uno o più campi obbligatori del dispositivo inserendo campi vuoti o caratteri non ammessi
    ],
    pre-condizioni:[
        - Il sistema è attivo.
        - Esiste almeno un dispositivo registrato nel sistema.
        - L'utente ha selezionato il dispositivo di cui vuole modificare i dati.
        - L'utente è in fase di modifica del dispositivo.
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