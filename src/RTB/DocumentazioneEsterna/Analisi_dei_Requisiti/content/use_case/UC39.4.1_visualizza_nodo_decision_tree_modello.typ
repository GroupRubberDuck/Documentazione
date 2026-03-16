#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza nodo decision tree modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Visualizza nodo decisione modello",
    "Visualizza nodo foglia modello"
  ),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
  top-padding: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza le informazioni associate al nodo
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il un decision tree sul modello  
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni legate al nodo 
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Visualizza nodo decisione modello")
        - #use-case-label(nome-etichetta: "Visualizza nodo foglia modello")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
