#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza risposta nodo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

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

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + L'utente viasualizza la risposta associata al nodo
    ],
    
    pre-condizioni: [
         - L'utente sta visualizzando un nodo del decision tree
    ],

    post-condizioni: [
        - L'utente ha visualizzato la risposta associata al nodo del decision tree
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Il nodo non ha una risposta associata 
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
