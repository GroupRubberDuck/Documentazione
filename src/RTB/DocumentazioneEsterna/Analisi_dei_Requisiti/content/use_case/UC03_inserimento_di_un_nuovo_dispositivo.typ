#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento di un nuovo dispositivo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema chiede i dati del nuovo dispositivo
        + L'utente inserisce i dati del dispositivo
        + L'utente conferma l'avvio della procedura
        + Il sistema memorizza i dati inseriti
        + Il sistema registra il dispositivo 
        + Il sistema realizza la permanenza dei dati
        + Il sistema avvia il processo di verifica
    ],
    
    pre-condizioni:[
        - L'utente è autenticato.
        - Il sistema è attivo.
    ],
    
    post-condizioni:[
        - Il dispositivo è stato registrato nel sistema.
        - Le informazioni del dispositivo sono caricate nel sistema di permanenza
        - Il processo di verifica è in avviato.    
        - L'utente si trova nell'area utente 
        ],
    
    trigger:[
        L'utente seleziona la funzione per il caricamento di un nuovo dispositivo da verificare
    ],
    
    scenari-alternativi:[
        - Errore nel caricamento del nuovo dispositivo
        - Verifica di un'altro dispositivo già in corso
        - Annullamento dell'operazione
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Creazione di un nuovo dispositivo per la verifica")
        - #use-case-label(nome-etichetta: "Caricamento di un dispositivo per la verifica")
    ],
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
