#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza modello associato al dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza nome modello associato",
    "Visualizza versione modello associato",
  ),
  extends: (:),
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
        + L'utente visualizza il nome del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome modello associato")
        + L'utente visualizza la versione dello standard #sym.arrow #use-case-label(nome-etichetta: "Visualizza versione modello associato")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando i dati di uno specifico dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dati dispositivo")
    ],
    
    post-condizioni:[
        - L'utente visualizza le informazioni del modello associato
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nome modello associato")
        - #use-case-label(nome-etichetta: "Visualizza versione modello associato")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
