#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi dipendenza"
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona il requisito da aggiungere alle dipendenze
        + Il sistema aggiorna la lista delle dipendenze
        + Il sistema aggiorna la lista delle non dipendenze
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista non dipendenze
        - Nel sistema è in corso una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Il requisito selezionato è stato aggiunto all'elenco delle dipendenze
        - Il requisito selezionato è stato rimosso dall'elenco delle non dipendenze

    ],
    
    trigger:[
        L'utente vuole aggiungere un requisito alle dipendenze 
    ],
    
    scenari-alternativi:[
        - L'utente aggiunge un requisito che crea una dipendenza circolare
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
