#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza dati del dispositivo"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona la funzionalità di visualizzazione in dettaglio dei dati del dispositivo
        + Il sistema recupera le informazioni memorizzate
        + Il sistema mostra i dati del dispositivo invocando le visualizzazioni specifiche:
            - Nome del dispositivo #sym.arrow  #use-case-label(nome-etichetta: "Visualizza nome dispositivo")
            - Sistema operativo #sym.arrow #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo")
            - Versione firmware #sym.arrow #use-case-label(nome-etichetta: "Visualizza versione firmware dispositivo")
            - Funzionalità #sym.arrow #use-case-label(nome-etichetta: "Visualizza funzionalita dispositivo")
            - Descrizione #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo")
    ],
    pre-condizioni:[
        - L'utente ha creato o caricato un dispositivo nel sistema.
        - Il dispositivo è attualmente selezionato.
    ],
    
    post-condizioni:[
        - Il sistema mostra i dati completi del dispositivo in modalità lettura.
    ],
    
    trigger:[
        L'utente accede alla scheda di dettaglio del dispositivo.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nome dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza versione firmware dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza funzionalita dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
   path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC07.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)