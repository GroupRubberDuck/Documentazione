#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio nodo decisione modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc:"Visualizza dettaglio nodo modello decision tree" ,
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza dettaglio codice requisito padre modello",
"Visualizza dettaglio codice nodo modello",
"Visualizza dettaglio domanda nodo modello"
  ),
  extends: (:),
  generalizations: (),
  spacing: (3.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",


    scenario-principale:[
        + L'utente visualizza il codice del requisito a cui il decision tree è associato #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio codice requisito padre modello")
        + L'utente visualizza il codice del nodo del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio codice nodo modello")
        + L'utente visualizza la domanda associata al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio domanda nodo modello")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio di un nodo
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni legate a uno specifico nodo decisionale
    ],
    
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza dettaglio codice requisito padre modello")
        - #use-case-label(nome-etichetta: "Visualizza dettaglio codice nodo modello")
        - #use-case-label(nome-etichetta: "Visualizza dettaglio domanda nodo modello")
    ],    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
