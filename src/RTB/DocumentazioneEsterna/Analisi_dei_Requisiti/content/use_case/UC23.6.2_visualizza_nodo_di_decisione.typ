#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza nodo di decisione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza nodo decision tree",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
"Visualizza codice requisito DT",
"Visualizza codice nodo",
"Visualizza domanda nodo",
"Visualizza risposta nodo",
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
        + L'utente visualizza il codice del requisito a cui è associato il DT #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito DT") 
        + L'utente visualizza il codice del nodo del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice nodo")
        + L'utente visualizza la domanda associata al nodo del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza domanda nodo")
        + L'utente visualizza la risposta associata al nodo del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza risposta nodo")
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando il decision tree
    ],
    
    post-condizioni: [
        - L'utente ha visualizzato le informazioni del nodo di decisione
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
                        - #use-case-label(nome-etichetta: "Visualizza codice requisito DT")
                        - #use-case-label(nome-etichetta: "Visualizza codice nodo")
                        - #use-case-label(nome-etichetta: "Visualizza domanda nodo")
                        - #use-case-label(nome-etichetta: "Visualizza risposta nodo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
