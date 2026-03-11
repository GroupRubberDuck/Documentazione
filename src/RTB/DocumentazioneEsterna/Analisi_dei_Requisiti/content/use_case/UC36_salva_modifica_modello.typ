#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Salva modifica modello"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
scenario-principale: [
        + L'utente richiede il salvataggio definitivo della bozza operativa.
        + Il sistema verifica la validità e l'integrità strutturale del modello.
        + Il sistema consolida la bozza e aggiorna la versione del modello applicando le regole di versionamento semantico (BR-11).
        + Il sistema chiude la bozza operativa e ripristina la visualizzazione in sola lettura.
    ],
    
    pre-condizioni: [
        - Nel sistema è attiva una sessione di modifica della struttura del modello
    ],
    
    post-condizioni: [
        - Le modifiche sono state registrate a sistema in via definitiva
        - Il numero di versione del modello risulta aggiornato in conformità con l'entità delle modifiche
        - La struttura della versione originale rimane disponibile nel sistema
    ],
    
    scenari-alternativi: [
        - *Struttura non valida per il salvataggio:*il sistema rileva un'incoerenza logica
    ],
    
    trigger:[
        L'utente vuole salvare le modifiche apportate alla struttura del modello
    ],

    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
