#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza singolo elemento lista requisiti modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza lista requisiti modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza codice requisito da lista requisiti modello",
    "Visualizza nome requisito da lista requisiti modello",
  ),
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
    
    attore-principale:[Utente],
    
    scenario-principale:[
        + L'utente visualizza il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito da lista requisiti modello")
        + L'utente visualizza il nome del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome requisito da lista requisiti modello")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un requisito dalla lista dei requisiti associata al modello
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni generali legate al requisito della lista dei requisiti del modello
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza codice requisito da lista requisiti modello")
        - #use-case-label(nome-etichetta: "Visualizza nome requisito da lista requisiti modello")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
