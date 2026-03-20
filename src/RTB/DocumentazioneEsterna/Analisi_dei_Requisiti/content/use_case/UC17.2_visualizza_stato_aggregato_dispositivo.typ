#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza stato aggregato dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],
    
    scenario-principale: [
        + Il sistema calcola lo stato aggregato del dispositivo
        + L'utente visualizza lo stato aggregato del dispositivo
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando la dashboard del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dashboard dispositivo")
    ],
    
    post-condizioni: [
        - L'utente ha visualizzato lo stato aggregato della valutazione del dispositivo
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: none,
    
    estensioni: none,
    
    generalizzazioni: none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
