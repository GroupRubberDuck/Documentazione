#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza descrizione asset"
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
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],
    
    scenario-principale: [
        + Il sistema mostra la descrizione dell'asset.
    ],
    
    pre-condizioni: [
        - Il dettaglio dell'asset è stato aperto.
    ],
    
    post-condizioni: [
        - La descrizione dell'asset è visualizzata.
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: none,

    estensioni: none,

    generalizzazioni: none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
