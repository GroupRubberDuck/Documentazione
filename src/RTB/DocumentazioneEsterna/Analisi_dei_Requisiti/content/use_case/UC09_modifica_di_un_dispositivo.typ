#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica di un dispositivo"
#let depth=1
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
   attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona la funzionalità di modifica dei dati di un dispositivo esistente.
        + Il sistema recupera e mostra i dati attuali nelle caselle di testo modificabili.
        + L'utente aggiorna una o più informazioni del dispositivo:
            - Nome #sym.arrow #use-case-label(nome-etichetta: "Modifica nome dispositivo")
            - Sistema Operativo #sym.arrow #use-case-label(nome-etichetta: "Modifica sistema operativo dispositivo")
            - Versione Firmware #sym.arrow #use-case-label(nome-etichetta: "Modifica versione firmware dispositivo")
            - Funzionalità prevista #sym.arrow #use-case-label(nome-etichetta: "Modifica funzionalita dispositivo")
            - Ambiente operativo #sym.arrow #use-case-label(nome-etichetta: "Modifica ambiente operativo")
            - Versione dello standard #sym.arrow #use-case-label(nome-etichetta: "Modifica versione dello standard")
            - Descrizione #sym.arrow #use-case-label(nome-etichetta: "Modifica descrizione dispositivo")
        + L'utente conferma le modifiche.
        + Il sistema valida i nuovi dati inseriti.
    ],
    
    pre-condizioni:[
        - Il sistema è attivo.
        - Esiste almeno un dispositivo registrato nel sistema.
        - L'utente ha selezionato il dispositivo di cui vuole modificare i dati.
    ],
    
    post-condizioni:[
        - Le informazioni aggiornate del dispositivo sono registrate nel sistema di permanenza.
    ],
    
    trigger:[
       L'utente preme il pulsante di modifica nella scheda di dettaglio del dispositivo.
    ],
    
    scenari-alternativi:[
       - *Annullamento:* L'utente decide di non salvare le modifiche #sym.arrow #use-case-label(nome-etichetta: "Annullamento modifica dati dispositivo")
        - *Dati non validi:* L'utente inserisce dati errati o incompleti #sym.arrow #use-case-label(nome-etichetta: "Inserimento dati non validi")
        - *Cambio versione standard:* L'utente modifica la versione dello standard, richiedendo una conferma esplicita #sym.arrow #use-case-label(nome-etichetta: "Avviso cambio versione standard")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Modifica nome dispositivo")
        - #use-case-label(nome-etichetta: "Modifica sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Modifica versione firmware dispositivo")
        - #use-case-label(nome-etichetta: "Modifica funzionalita dispositivo")
        - #use-case-label(nome-etichetta: "Modifica ambiente operativo")
        - #use-case-label(nome-etichetta: "Modifica versione dello standard")
        - #use-case-label(nome-etichetta: "Modifica descrizione dispositivo")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Inserimento dati non validi")
        - #use-case-label(nome-etichetta: "Avviso cambio versione standard")
        - #use-case-label(nome-etichetta: "Annullamento modifica dati dispositivo")
    ],
    
    generalizzazioni:none,
    
     path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC08.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)