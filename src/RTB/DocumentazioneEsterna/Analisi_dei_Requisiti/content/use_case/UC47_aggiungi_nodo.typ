#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi nodo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: ("Aggiungi nodo foglia",
"Aggiungi nodo di decisione"),
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
        + L'utente inserisce le informazioni del nodo
    ],
    
    pre-condizioni:[
        - L'utente sta aggiungendo un nodo figlio
        - Nel sistema è attiva una sessione di modifica della struttura del modello

    ],
    
    post-condizioni:[
        - L'utente ha aggiunto un nodo allo scheletro del decision tree associato al modello
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Aggiungi nodo foglia")
        - #use-case-label(nome-etichetta: "Aggiungi nodo di decisione")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
