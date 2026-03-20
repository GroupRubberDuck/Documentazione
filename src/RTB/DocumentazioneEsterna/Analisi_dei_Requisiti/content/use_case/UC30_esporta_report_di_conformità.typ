#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Esporta report di conformità"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: ("Esporta report in pdf",),
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
        + L'utente scarica il report della valutazione sul proprio file system 
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la dashboard del dispositivo
        - Nel sistema è in corso una sessione di valutazione del dispositivo
    ],
    
    post-condizioni:[
        - L'utente ha scaricato il report sul proprio file system locale
    ],
    
    trigger:[
        L'utente vuole generare un report rappresentativo della valutazione del dispositivo
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        #use-case-label(nome-etichetta: "Esporta report in pdf")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
