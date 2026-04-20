#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi nodo di decisione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Aggiungi nodo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Inserisci codice nodo decision tree",
            "Inserisci domanda nodo decision tree"),
  extends: (:),
  generalizations: (),
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
        + L'utente inserisce il codice del nodo #sym.arrow #use-case-label(nome-etichetta: "Inserisci codice nodo decision tree")
        + L'utente inserisce la domanda del nodo #sym.arrow #use-case-label(nome-etichetta: "Inserisci domanda nodo decision tree")
    ],
    
    pre-condizioni:[
        - L'utente sta aggiungendo un nodo figlio
    ],
    
    post-condizioni:[
        - Il sistema ha aggiunto un nodo di decisione
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserisci codice nodo decision tree")
        - #use-case-label(nome-etichetta: "Inserisci domanda nodo decision tree")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
