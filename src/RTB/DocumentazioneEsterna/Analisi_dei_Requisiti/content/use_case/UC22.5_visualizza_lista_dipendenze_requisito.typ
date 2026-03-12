#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista dipendenze requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza sintesi dipendenza",
  ),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%, actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + Il sistema controlla le dipendenze del requisito
        + Per ogni elemento della lista delle dipendenze del requisito
            + L'utente visualizza la sintesi della dipendenza #sym.arrow #use-case-label(nome-etichetta: "Visualizza sintesi dipendenza")

    ],
    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di un requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio requisito")
    ],
    post-condizioni: [
        - L'utente ha visualizzato le dipendenze del requisito
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza sintesi dipendenza")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
