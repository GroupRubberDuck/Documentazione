#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dati dispositivo su dashboard"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc: "Visualizza dashboard dispositivo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza nome dispositivo su dashboard",
    "Visualizza sistema operativo dispositivo su dashboard",
    "Visualizza descrizione dispositivo su dashboard"
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
        + L'utente visualizza il nome del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome dispositivo su dashboard")
        + L'utente visualizza il sistema operativo del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo su dashboard")
        + L'utente visualizza la descrizione del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo su dashboard")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la dashboard del dispositivo #use-case-label(nome-etichetta: "Visualizza dashboard dispositivo")
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato i dati del dispositivo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
            - #use-case-label(nome-etichetta:"Visualizza nome dispositivo su dashboard")
            - #use-case-label(nome-etichetta:"Visualizza sistema operativo dispositivo su dashboard")
            - #use-case-label(nome-etichetta:"Visualizza descrizione dispositivo su dashboard")
    ]
    ,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
