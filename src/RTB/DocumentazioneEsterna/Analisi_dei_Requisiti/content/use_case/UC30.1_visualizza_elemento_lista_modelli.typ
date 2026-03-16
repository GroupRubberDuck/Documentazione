#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza elemento lista modelli"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza nome modello da lista modelli",
"Visualizza versione modello da lista modelli"
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il nome del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome modello da lista modelli")
        + L'utente visualizza la versione del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza versione modello da lista modelli")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista dei modelli registrati
    ],
    
    post-condizioni:[
        - L'utente visualizza i dati generali relativi al singolo modello 
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nome modello da lista modelli")
        - #use-case-label(nome-etichetta: "Visualizza versione modello da lista modelli")
    ]
    ,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
