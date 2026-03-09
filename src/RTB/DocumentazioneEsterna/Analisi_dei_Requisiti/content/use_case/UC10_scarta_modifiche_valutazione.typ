#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Scarta modifiche valutazione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Annulla scarto modifiche":[
    L'utente non conferma lo scarto delle modifiche
  ]),
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
        + L'utente visualizza un avviso
        + L'utente conferma di voler scartare le modifiche apportate durante la valutazione
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sessione di valutazione del dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha chiuso la sessione di valutazione del dispositivo
        - Le modifiche alla valutazione non sono salvate
    ],
    
    trigger:[
        L'utente seleziona la funzionalità per lo scarto delle modifiche e chiusura della sessione di valutazione
    ],
    
    scenari-alternativi:[
        - Annullamento scarto delle informazioni #sym.arrow #use-case-label(nome-etichetta: "Annulla scarto modifiche")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "annulla scarto modifiche")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:[
        #deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false)
    ],
)
