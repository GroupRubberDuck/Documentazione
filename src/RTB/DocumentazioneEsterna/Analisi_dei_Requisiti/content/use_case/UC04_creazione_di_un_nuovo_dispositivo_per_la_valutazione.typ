#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Creazione di un nuovo dispositivo per la valutazione"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente seleziona la funzionalità di creazione di un nuovo dispositivo
        + L'Utente compila i campi relativi ai dati identificativi del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Inserimento dati dispositivo")
        + L'Utente conferma l'operazione
        + Il Sistema registra le informazioni del dispositivo
        + Il Sistema avvia il processo di valutazione
    ],
    
    pre-condizioni:[
        - L'utente è autenticato.
        - Il sistema si trova nell'area di gestione dispositivi.
    ],
    
    post-condizioni:[
        - Il nuovo dispositivo è creato e salvato nel sistema con i dati inseriti.
    ],
    
    trigger:[
        L'Utente preme il pulsante per la creazione manuale di un dispositivo.
    ],
    
    scenari-alternativi:[
        - L'Utente annulla la creazione del dispositivo  #sym.arrow #use-case-label(nome-etichetta: "Annullamento creazione dispositivo")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserimento dati dispositivo")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Annullamento creazione dispositivo")
    ],
    
    generalizzazioni:none,
    
     path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC04.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)