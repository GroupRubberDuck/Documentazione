#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica sistema operativo dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
  attore-principale:"Utente",
    scenario-principale:[
        + L'Utente seleziona il nuovo sistema operativo
        + Il Sistema memorizza il nuovo valore
    ],
    pre-condizioni:[- Il Sistema carica il sistema operativo precedentemente inserito nel rispettivo campo La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[Il sistema operativo è aggiornato localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)