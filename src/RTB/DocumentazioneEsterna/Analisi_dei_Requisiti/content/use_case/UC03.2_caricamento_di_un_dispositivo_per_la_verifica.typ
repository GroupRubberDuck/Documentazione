#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Caricamento di un dispositivo per la verifica"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema apre l'interfaccia per l'inserimento di un file
        + L'utente seleziona il file contente i dati del dispositivo
        + Il sistema importa il file
        + Il sistema interpreta il file
        + Il sistema memorizza tutte le informazioni contenute
            - Scheda tecnica del dispositivo
            - Asset già presenti
            - Versione dello standard usata
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
        L'utente seleziona la funzione per l'inserimento di un nuovo dispositivo da verificare
    ],
    
    scenari-alternativi:[
        - L'utente ha selezionato un file con estensione non supportata
        - L'utente ha selezionato più di un file
        - Il file ha una struttura interna non riconosciuta
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
