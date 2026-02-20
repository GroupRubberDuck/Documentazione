#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica versione firmware dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
   attore-principale:"Utente",
     scenario-principale:[
        + L'Utente aggiorna la stringa della versione firmware
        + Il Sistema memorizza il nuovo valore
    ],
    pre-condizioni:[- Il Sistema mostra la versione firmware attuale nel campo modificabile
    - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[La versione firmware è aggiornata localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)