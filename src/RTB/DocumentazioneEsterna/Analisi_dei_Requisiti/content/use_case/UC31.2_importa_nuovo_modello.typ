#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Importa nuovo modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore modello esistente":[
    Il modello importato esiste già all'interno del sistema
  ]),
  generalizations: (
    "Importa modello file xml",
"Importa modello file json"
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona un file da importare 
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un la lista dei modelli
    ],
    
    post-condizioni:[
        - L'utente ha importato un nuovo modello
    ],
    
    trigger:[
        L'utente seleziona l'importazione di un nuovo file
    ],
    
    scenari-alternativi:[
        - Il modello importato esiste già all'interno del sistema #sym.arrow #use-case-label(nome-etichetta: "Errore modello esistente")

    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore modello esistente")

    ],
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Importa modello file xml")
        - #use-case-label(nome-etichetta: "Importa modello file json")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
