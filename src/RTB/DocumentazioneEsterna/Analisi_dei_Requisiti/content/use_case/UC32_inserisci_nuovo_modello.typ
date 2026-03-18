#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci nuovo modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Annulla inserimento modello":[
    L'utente annulla l'inserimento del modello
  ]),
  generalizations: (
    "Crea nuovo modello",
    "Importa nuovo modello",
  ),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
  note-offset: (0.8,0.5)


)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce un nuovo modello
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista dei dispositivi
    ],
    
    post-condizioni:[
        - Il sistema ha inserito un nuovo modello
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - L'utente annulla l'inserimento del nuovo modello #sym.arrow #use-case-label(nome-etichetta: "Annulla inserimento modello")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Annulla inserimento modello")
    ],
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Crea nuovo modello")
        - #use-case-label(nome-etichetta: "Importa nuovo modello")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
