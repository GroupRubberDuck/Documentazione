#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio nodo modello decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
  ),
  extends: (:),
  generalizations: (
    "Visualizza dettaglio nodo decisione modello",
    "Visualizza dettaglio nodo foglia modello",
  ),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza le informazioni collegate al nodo
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il decision tree
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni legate a uno specifico nodo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisione modello")
        - #use-case-label(nome-etichetta: "Visualizza dettaglio nodo foglia modello")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
