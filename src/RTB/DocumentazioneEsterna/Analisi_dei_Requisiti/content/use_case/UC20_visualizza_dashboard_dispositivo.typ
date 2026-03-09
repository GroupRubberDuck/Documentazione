#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dashboard dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza lista asset","Visualizza stato aggregato dispositivo"),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza la lista di asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista asset")
        + L'utente visualizza lo stato aggregato del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione di un dispositivo
    ],
    
    post-condizioni:[
        L'utente visualizza la dashboard riassuntiva dello stato del dispositivo
    ],
    
    trigger:[L'utente seleziona la funzionalità di visualizzazione della dashboard],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza lista asset")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
