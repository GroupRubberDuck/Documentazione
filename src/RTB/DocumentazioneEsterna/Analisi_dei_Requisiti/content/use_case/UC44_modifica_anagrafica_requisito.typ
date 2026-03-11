#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica anagrafica requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Inserisci codice requisito",
    "Inserisci nome requisito",
    "Inserisci descrizione requisito",
  ),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
      + L'utente ha selezionato la funzionalità di modifica dell'anagrafica del requisito
      + L'utente inserisce il codice del requisito 
      + L'utente inserisce il nome del requisito #use-case-label(nome-etichetta: "Inserisci nome requisito")
      + L'utente inserisce la descrizione normativa del requisito #use-case-label(nome-etichetta: "Inserisci descrizione requisito")
    ],
    
    pre-condizioni:[
      - L'utente sta visualizzando il dettaglio del requisito
    ],
    
    post-condizioni:[
      - L'utente ha modificato l'anagrafica del requisito
    ],
    
    trigger:[
      L'utente vuole modifcare l'anagrafica del requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
      - #use-case-label(nome-etichetta: "Inserisci codice requisito")
      - #use-case-label(nome-etichetta: "Inserisci nome requisito")
      - #use-case-label(nome-etichetta: "Inserisci descrizione requisito")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
