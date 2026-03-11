#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dati dispositivo su dashboard"
#let depth=2

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il nome del dispositivo
        + L'utente visualizza il sistema operativo del dispositivo
        + L'utente visualizza la descrizione del dispositivo
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la dashboard del dispositivo
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato i dati del dispositivo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[

    ]
    ,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
