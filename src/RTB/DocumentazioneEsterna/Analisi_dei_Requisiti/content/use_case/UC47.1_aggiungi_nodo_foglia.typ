#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi nodo foglia"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Aggiungi nodo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Aggiungi nodo PASS",
"Aggiungi nodo FAIL",
"Aggiungi nodo NA"
  ),
  spacing: (1.5cm, 2cm), 
  diagram-scale: 70%,
  actor-offset: 0,
  top-padding:1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente aggiunge un nodo foglia
    ],
    
    pre-condizioni:[
        - L'utente sta aggiungendo un nodo figlio
    ],
    
    post-condizioni:[
        - L'utente ha aggiunto un nodo foglia
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
            - #use-case-label(nome-etichetta: "Aggiungi nodo PASS")
            - #use-case-label(nome-etichetta: "Aggiungi nodo FAIL")
            - #use-case-label(nome-etichetta: "Aggiungi nodo NA")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
