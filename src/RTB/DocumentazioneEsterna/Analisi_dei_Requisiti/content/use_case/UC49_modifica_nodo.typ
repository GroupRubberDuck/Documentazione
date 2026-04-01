#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica nodo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Modifica codice nodo decision tree",
    "Modifica domanda nodo decision tree"

  ),
  extends: (:),
  generalizations: (),
  spacing: (1.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 1.0,
  note-offset: (-1.0,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente modifica il codice del nodo #sym.arrow #use-case-label(nome-etichetta: "Modifica codice nodo decision tree")
        + L'utente modifica la domanda del nodo #sym.arrow #use-case-label(nome-etichetta: "Modifica domanda nodo decision tree")
        + Il sistema modifica le informazioni del nodo

    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio di un nodo del decision tree
        - L'utente ha selezionato un nodo di decisione
    ],
    
    post-condizioni:[
        - Il sistema ha modificato il nodo
    ],
    
    trigger:[
        L'utente vuole modificare il nodo di decisione
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
    - #use-case-label(nome-etichetta: "Modifica codice nodo decision tree")
    - #use-case-label(nome-etichetta: "Modifica domanda nodo decision tree")
    ]
    ,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
