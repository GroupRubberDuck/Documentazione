#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica nome dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
   attore-principale:"Utente",
    scenario-principale:[
        + L'Utente modifica il nome del dispositivo
        + Il Sistema memorizza il nuovo valore inserito
    ],
    pre-condizioni:[ - Il Sistema precompila il campo con il nome attuale del dispositivo
        - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[Il nome del dispositivo è aggiornato localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
     path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC08.1.drawio.png",
    
    figure-caption:get-use-case-code(nome-etichetta: use-case-nome),
)
)
