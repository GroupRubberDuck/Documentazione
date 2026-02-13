#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Creazione di un nuovo dispositivo per la verifica"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema mostra l'interfaccia di inserimento dei dati
        + L'utente compila la scheda tecnica
        + L'utente seleziona la versione dello standard da usare per la verifica
        + L'utente conferma i dati inseriti
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
        L'utente seleziona la funzione per la creazione di un nuovo dispositivo da verificare
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
