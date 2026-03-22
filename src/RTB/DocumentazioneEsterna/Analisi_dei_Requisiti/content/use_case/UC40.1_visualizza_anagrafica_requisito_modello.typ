#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza anagrafica requisito modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza dettaglio requisito modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza codice requisito modello",
    "Visualizza nome del requisito modello",
    "Visualizza descrizione modello"
  ),
  extends: (:),
  generalizations: (),
  spacing: (3.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:[Utente],
    
    scenario-principale:[
        + L'utente visualizza il codice del requisito #sym.arrow #use-case-label(nome-etichetta:"Visualizza codice requisito modello" )
        + L'utente visualizza il nome del requisito #sym.arrow #use-case-label(nome-etichetta:"Visualizza nome del requisito modello" )
        + L'utente visualizza la descrizione del requisito #sym.arrow #use-case-label(nome-etichetta:"Visualizza descrizione modello" )
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio del requisito
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato l'anagrafica del requisito
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta:"Visualizza codice requisito modello" )
        - #use-case-label(nome-etichetta:"Visualizza nome del requisito modello" )
        - #use-case-label(nome-etichetta:"Visualizza descrizione modello" )
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
