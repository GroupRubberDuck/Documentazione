#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento dati dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente inserisce i dati identificativi del dispositivo invocando i sottocasi specifici:
            - Nome del dispositivo #sym.arrow  #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
            - Sistema operativo #sym.arrow  #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
            - Versione del firmware #sym.arrow  #use-case-label(nome-etichetta: "Inserimento versione firmware dispositivo")
            - Funzionalità #sym.arrow  #use-case-label(nome-etichetta: "Inserimento funzionalita dispositivo")
            - Descrizione #sym.arrow #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
            - Versione dello standard #sym.arrow #use-case-label(nome-etichetta: "Inserimento versione dello standard")
    ],
    
    pre-condizioni:[
        - La procedura di creazione dispositivo è attiva.
    ],
    
    post-condizioni:[
        - I dati identificativi del dispositivo sono inseriti e validati localmente.
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        L'utente inserisce uno o più dati non validi #sym.arrow #use-case-label(nome-etichetta: "Inserimento dati non validi")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento versione firmware dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento funzionalita dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento versione dello standard")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Inserimento dati non validi")
    ],
    
    generalizzazioni:none,
    
     path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC04.1.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)