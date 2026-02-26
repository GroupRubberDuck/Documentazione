#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica ambiente operativo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
 attore-principale:"Utente",
    scenario-principale:[
        + Il Sistema mostra la descrizione dell'ambiente operativo target attuale
        + L'Utente modifica i dettagli relativi all'ambiente di installazione
        + Il Sistema memorizza il nuovo valore
    ],
    pre-condizioni:[-  + Il Sistema mostra la descrizione dell'ambiente operativo target attuale
    - La procedura di modifica dati del dispositivo è attiva],
    post-condizioni:[L'ambiente operativo è aggiornato localmente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)