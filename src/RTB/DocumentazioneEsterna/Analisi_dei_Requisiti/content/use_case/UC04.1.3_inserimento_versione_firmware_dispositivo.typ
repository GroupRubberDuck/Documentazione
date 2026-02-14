#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento versione firmware dispositivo"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
     scenario-principale:[
        + L'Utente inserisce la versione del firmware del dispositivo nel corrispondente campo dati
        + Il Sistema memorizza il valore inserito
    ],
    pre-condizioni:[La procedura di creazione dispositivo è attiva],
    post-condizioni:[La versione firmware del dispositivo è impostata],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)

