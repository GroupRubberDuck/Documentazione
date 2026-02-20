#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica versione dello standard"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
        scenario-principale:[
        + L'Utente seleziona una nuova versione dello standard
        + Il Sistema rileva il cambiamento per l'eventuale gestione della coerenza dati
        + Il Sistema memorizza la nuova selezione
    ],
    pre-condizioni:[- Il Sistema visualizza la versione dello standard attualmente associata alla verifica
    - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[La versione dello standard è aggiornata localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)
