#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci risposta nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Seleziona Yes",
"Seleziona No"
  ),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
  top-padding: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],

    scenario-principale: [
        + L'utente seleziona una risposta per il nodo corrente
    ],

    pre-condizioni: [
        - L'utente sta valutando un nodo specifico
    ],

    post-condizioni: [
        - La risposta selezionata dall'utente è stata associata al nodo
        - Il sistema ha salvato la risposta al nodo sulla bozza operativa
    ],

    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
            - #use-case-label(nome-etichetta: "Seleziona Yes")
            - #use-case-label(nome-etichetta: "Seleziona No")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
