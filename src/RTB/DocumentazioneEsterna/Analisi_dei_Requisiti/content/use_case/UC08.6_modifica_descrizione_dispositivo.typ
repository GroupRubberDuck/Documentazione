#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica descrizione dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
   attore-principale:"Utente",
    scenario-principale:[
        + L'Utente modifica il testo della descrizione
        + Il Sistema memorizza il valore aggiornato
    ],
    pre-condizioni:[-  Il Sistema carica la descrizione testuale precedentemente inserita
    - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[La descrizione è aggiornata localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)