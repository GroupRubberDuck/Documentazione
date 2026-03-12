#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Salva modifica modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore struttura non valida per il salvataggio":[
    Il sistema rileva uno o più incoerenze logiche nella struttura del modello
  ]),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
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
        - Il sistema rileva uno o più incoerenze logiche nella struttura del modello #sym.arrow #use-case-label(nome-etichetta: "Errore struttura non valida per il salvataggio")
    ],
    
    trigger:[
        L'utente vuole salvare le modifiche apportate alla struttura del modello
    ],

    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore struttura non valida per il salvataggio")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
