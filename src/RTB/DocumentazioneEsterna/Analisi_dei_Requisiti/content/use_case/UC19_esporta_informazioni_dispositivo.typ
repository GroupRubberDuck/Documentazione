#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Esporta informazioni dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Esporta in xml",
    "Esporta in json",
    "Esporta in csv",
    ),
  spacing: (0.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 2
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente scarica il file contente le informazioni del dispositivo
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
    ],
    
    post-condizioni:[
        - L'utente ha scaricato il file sul suo file system locale 
    ],
    
    trigger:[L'utente seleziona un dispositivo per l'esportazione],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Esporta in xml")
        - #use-case-label(nome-etichetta: "Esporta in json")
        - #use-case-label(nome-etichetta: "Esporta in csv")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
