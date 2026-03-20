#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza decision tree requisito modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza dettaglio requisito modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza nodo decision tree modello",),
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni nodo del decsion tree:
            + L'utente visualizza le informazioni associate al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza nodo decision tree modello")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio di un dispositivo
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato la struttura del decision tree
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nodo decision tree modello")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
