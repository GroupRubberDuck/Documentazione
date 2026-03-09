#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci codice requisito"
#let depth=3

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (
    "Errore codice requisito duplicato":[
    L'utente ha inserito un codice del requisito già esistente
  ],    "Errore codice requisito vuoto":[
    L'utente ha inserito un codice del requisito vuoto
  ],
  ),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 70%,
  actor-offset: 0.5,
  note-offset: (0.5,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce il nome del requisito
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
        - Nel sistema è in corso la modifica del requisito
    ],
    
    post-condizioni:[
        - L'utente ha inserito il codice del requisito
    ],
    trigger:none,
    
    scenari-alternativi:[
        - L'utente inserisce un codice del requisito già appartenente a un altro requisito
        - L'utente ha inserito un codice del requisito di lunghezza non valida
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore codice requisito duplicato")
        - #use-case-label(nome-etichetta: "Errore codice requisito vuoto")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
