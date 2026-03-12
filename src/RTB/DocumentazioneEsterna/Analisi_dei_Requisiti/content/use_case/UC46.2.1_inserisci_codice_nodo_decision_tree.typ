#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci codice nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (
    "Errore codice nodo non valido":[L'utente inserisce un codice non valido],
    "Errore codice nodo già esistente":[L'utente inserisce un codice già associato ad un altro nodo del DT],
    ),
  generalizations: (),
  spacing: (1.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 1,
  note-offset: (0.5,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce il codice del nodo
    ],
    
    pre-condizioni:[
        - L'utente sta aggiungendo un nodo di decisione
    ],
    
    post-condizioni:[
        - L'utente ha inserito il codice di un nodo
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente inserisce un codice non valido per il nodo #sym.arrow #use-case-label(nome-etichetta: "Errore codice nodo non valido")
        - L'utente inserisce un codice già associato ad un altro nodo del decision tree #sym.arrow #use-case-label(nome-etichetta: "Errore codice nodo già esistente")

    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore codice nodo non valido")
        - #use-case-label(nome-etichetta: "Errore codice nodo già esistente")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
