#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica domanda nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
        parent-uc: "Modifica nodo",

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ( "Errore modifica domanda vuota":[
    L'utente inserisce una domanda vuota
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
        + L'utente inserisce la domanda collegata al nodo di decisione
    ],
    
    pre-condizioni:[
        - L'utente sta modificando un nodo di decisione
    ],
    
    post-condizioni:[
        - Il sistema ha registrato l'inserimento della domanda relativa al nodo
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente inserisce una domanda vuota per il nodo #sym.arrow #use-case-label(nome-etichetta: "Errore modifica domanda vuota")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore modifica domanda vuota")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
