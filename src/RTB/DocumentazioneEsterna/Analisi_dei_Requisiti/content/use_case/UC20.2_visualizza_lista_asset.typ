#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

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
        + Per ogni asset
            + L'utente visualizza il nome dell'asset
            + L'utente visualizza lo stato aggregato dell'asset

    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione di un dispositivo
        - L'utente ha selezionata la visualizzazione del dispositivo
    ],
    
    post-condizioni:[
        L'utente visualizza la dashboard riassuntiva dello stato del dispositivo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - 
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
