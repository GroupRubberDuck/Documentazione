#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Salva modifica major"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset:0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
scenario-principale: [
        + L'utente richiede il salvataggio definitivo della bozza operativa
        + Il sistema verifica la validità e l'integrità strutturale del modello
        + Il sistema consolida la bozza creando un nuovo modello
        + Il sistema aggiorna la versione del modello applicando le regole di versionamento semantico
        + Il sistema chiude la sessione di modifica della struttura del modello
    ],
    
    pre-condizioni: [
        - Nel sistema è attiva una sessione di modifica della struttura del modello
    ],
    
    post-condizioni: [
        - Le modifiche sono state registrate nel sistema
        - Il numero di versione del modello risulta aggiornato in conformità con l'entità delle modifiche
        - Nel sistema è ancora disponibile il modello di standard precedente nella versione precedente alle modifiche
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
