#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio nodo decisionale"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona un nodo decisionale attivo dal decision tree
        + L'utente visualizza il codice del requisito legato al decision tree a cui appartiene il nodo
        + L'utente visualizza il codice del nodo del decision tree selezionato
        + L'utente visualizza la domanda associata al nodo
        + L'utente visualizza la risposta associata al nodo
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il decision tree
    ],
    
    post-condizioni:[
        - L'utente visualizza il dettaglio specifico del nodo selezionato
    ],
    
    trigger:[
        L'utente vuole visualizzare il dettaglio di un nodo decisionale attivo
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
