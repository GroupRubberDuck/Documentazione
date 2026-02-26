#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica funzionalita dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
  attore-principale:"Utente",
    scenario-principale:[
        + L'Utente modifica o arricchisce la descrizione delle funzionalità previste
        + Il Sistema memorizza il nuovo valore
    ],
    pre-condizioni:[- Il Sistema carica la descrizione delle funzionalità precedentemente inserita
    - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[Le funzionalità sono aggiornate localmente],
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)