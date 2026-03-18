#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Scarta modifiche valutazione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (1.5cm, 4cm), 
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
        + L'utente seleziona la funzione di scarto delle modifiche
        + Il sistema mostra un avviso
        + L'utente conferma di voler scartare le modifiche apportate durante la valutazione
        + Il sistema chiude la sessione di valutazione del dispositivo
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sessione di valutazione del dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha chiuso la sessione di valutazione del dispositivo
        - Le modifiche non salvate sono scartate
    ],
    
    trigger:[
        L'utente vuole scartare le modifiche scarto delle modifiche apportate
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:[
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:[
        #deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false)
    ],
)
