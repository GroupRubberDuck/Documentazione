#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio nodo decisionale"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza codice requisito a dettaglio",
    "Visualizza codice nodo a dettaglio",
    "Visualizza domanda nodo a dettaglio",
    "Visualizza risposta nodo a dettaglio",

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
        + L'utente seleziona un nodo decisionale attivo dal decision tree
        + L'utente visualizza il codice del requisito legato al decision tree a cui appartiene il nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito a dettaglio")
        + L'utente visualizza il codice del nodo del decision tree selezionato #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice nodo a dettaglio")
        + L'utente visualizza la domanda associata al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza domanda nodo a dettaglio")
        + L'utente visualizza la risposta associata al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza risposta nodo a dettaglio")
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
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza codice requisito a dettaglio")
        - #use-case-label(nome-etichetta: "Visualizza codice nodo a dettaglio")
        - #use-case-label(nome-etichetta: "Visualizza domanda nodo a dettaglio")
        - #use-case-label(nome-etichetta: "Visualizza risposta nodo a dettaglio")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
