#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento sistema operativo dispositivo"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente inserisce il nome del sistema operativo nel campo dati corrispondente
        + Il Sistema memorizza il valore inserito
    ],
    pre-condizioni:[La procedura di creazione dispositivo è attiva],
    post-condizioni:[Il sistema operativo del dispositivo è impostato],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)