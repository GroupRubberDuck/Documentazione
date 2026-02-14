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
        + L'utente seleziona la funzionalità di importazione dispositivo.
        + Il sistema richiede la selezione del file sorgente #sym.arrow #use-case-label(nome-etichetta: "Selezione file sorgente") .  
    ],
    pre-condizioni:[
        - l'Utente visualizza pulsante per l'importazione del dispositivo.
    ],
    post-condizioni:[
        - Il dispositivo è caricato nel sistema.
        - Gli asset associati sono stati estratti e registrati.
    ],
    trigger:[L'utente clicca il pulsante di caricamento dispositivo],
    scenari-alternativi:none,
    inclusioni:[
        - #use-case-label(nome-etichetta: "Selezione file sorgente")
    ],
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore importazione file")
    ],
    generalizzazioni:none,
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC05.drawio.png",
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)