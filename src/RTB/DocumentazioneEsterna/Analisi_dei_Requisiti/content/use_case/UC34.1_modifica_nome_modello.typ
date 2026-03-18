#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica nome modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
  parent-uc: "Modifica anagrafica modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore modifica nome modello":[
    L'utente ha inserito un nome del  modello non valido
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente modifica il nome del modello
    ],
    
    pre-condizioni:[
        - L'utente sta modificando l'anagrafica di un modello
    ],
    
    post-condizioni:[
        - L'utente ha modificato il nome del modello
    ],
    
    trigger:none,
    
    scenari-alternativi:[
      - L'utente inserisce un nome non valido #sym.arrow #use-case-label(nome-etichetta: "Errore modifica nome modello")
    ],
    
    inclusioni:none,
    
    estensioni:[
      - #use-case-label(nome-etichetta: "Errore modifica nome modello")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
