#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza stato valutazione requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
                    "Visualizza stato PASS requisito ",
                    "Visualizza stato FAIL requisito ",
                    "Visualizza stato NA requisito ",
                    "Visualizza stato In corso requisito ",
  ),
  spacing: (0.1cm, 2cm), 
  diagram-scale: 50%,
  actor-offset: 12
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],

    scenario-principale: [
        + L'utente visualizza lo stato di valutazione del requisito
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di un requisito nel contesto di un asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio requisito")
    ],

    post-condizioni: [
        - L'utente ha visualizzato lo stato di valutazione del requisito nel contesto dell'asset 
    ],
    
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
                    - #use-case-label(nome-etichetta: "Visualizza stato PASS requisito ")
                    - #use-case-label(nome-etichetta: "Visualizza stato FAIL requisito ")
                    - #use-case-label(nome-etichetta: "Visualizza stato NA requisito ")
                    - #use-case-label(nome-etichetta: "Visualizza stato In corso requisito ")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
