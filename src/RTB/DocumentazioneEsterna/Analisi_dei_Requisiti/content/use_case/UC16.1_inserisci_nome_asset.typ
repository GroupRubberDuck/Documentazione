#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci nome asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore nome asset non valido":[
    L'utente ha inserisce un nome vuoto
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
        + L'utente inserisce il nome dell'asset
    ],
    
    pre-condizioni:[
        - L'utente ha selezionato l'opzione di aggiunta o modifica di un asset
    ],
    
    post-condizioni:[
        - L'utente ha inserito il nome dell'asset
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente inserisce un nome vuoto
    ],
    
    inclusioni:none,
    
    estensioni:[
        #use-case-label(nome-etichetta: "Errore nome asset non valido")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false),
)
