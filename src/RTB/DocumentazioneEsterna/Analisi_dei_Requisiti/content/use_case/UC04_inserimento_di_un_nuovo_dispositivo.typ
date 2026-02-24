#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento di un nuovo dispositivo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce il dispositivo
        + L'utente conferma l'avvio della procedura
        + Il sistema valida e memorizza i dati inseriti
    ],
    
    pre-condizioni:[
        - Il sistema è attivo.
        - L'utente visualizza la funzione inserimento di un nuovo dispositivo
        - L'utente si trova nell'area personale.
    ],
    
    post-condizioni:[
        - Il dispositivo è stato registrato nel sistema.
        - Le informazioni del dispositivo sono caricate nel sistema di permanenza. 
        ],
    
    trigger:[
        L'utente seleziona la funzione per il caricamento di un nuovo dispositivo da valutare
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Creazione di un nuovo dispositivo per la valutazione")
        - #use-case-label(nome-etichetta: "Caricamento di un dispositivo per la valutazione")
    ],
    
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC3.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)
