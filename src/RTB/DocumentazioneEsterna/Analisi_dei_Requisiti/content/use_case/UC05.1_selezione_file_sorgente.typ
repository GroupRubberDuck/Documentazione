#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Selezione file sorgente"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema apre la finestra di dialogo per la navigazione nel file system locale
        + L'utente naviga tra le directory del dispositivo
        + L'utente individua il file contenente i dati del dispositivo o degli asset
        + L'utente seleziona il file desiderato
        + L'utente conferma la selezione
        + Il sistema acquisisce il percorso del file selezionato
    ],
    
    pre-condizioni:[
        - L'utente ha avviato la procedura di caricamento dispositivo o asset.
        - L'interfaccia di selezione file è attiva.
    ],
    
    post-condizioni:[
        - Il file è stato selezionato ed è pronto per la fase di validazione e parsing.
    ],
    
    trigger:[
        Il sistema richiede l'inserimento di un file sorgente durante l'importazione.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Selezione file JSON")
        - #use-case-label(nome-etichetta: "Selezione file CSV")
        - #use-case-label(nome-etichetta: "Selezione file XML")
    ],
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC05.1.drawio.png",
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)