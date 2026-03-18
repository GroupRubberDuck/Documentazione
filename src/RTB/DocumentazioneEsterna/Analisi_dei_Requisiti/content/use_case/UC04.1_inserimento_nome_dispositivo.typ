#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserimento nome dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Crea nuovo dispositivo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore nome dispositivo non valido":[
    L'utente inserisce un nome non valido
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
        + L'utente inserisce il nome del dispositivo
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - L'utente sta creando un nuovo dispositivo #sym.arrow #use-case-label(nome-etichetta: "Crea nuovo dispositivo")
    ],
    
    
    post-condizioni:[
        - L'utente ha inserito correttamente il nome del dispositivo inserito correttamente
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente inserisce un nome del dispositivo non valido
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore nome dispositivo non valido")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
