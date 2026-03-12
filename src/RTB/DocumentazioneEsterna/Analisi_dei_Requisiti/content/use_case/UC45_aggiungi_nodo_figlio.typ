#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi nodo figlio"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Aggiungi nodo",),
  extends: (:),
  generalizations: (
    "Aggiungi nodo figlio sinistro",
"Aggiungi nodo figlio destro",
  ),
  spacing: (0.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente aggiunge un nodo #sym.arrow #use-case-label(nome-etichetta: "Aggiungi nodo figlio")
        + Il sistema crea la relazione parent-child tra i nodi 
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio di un nodo
        - Il nodo selezionato non ha uno o più figli
        - Nel sistema è attiva una sessione di modifica della struttura del modello
    ],
    
    post-condizioni:[
        - Il sistema aggiunge in nodo alla struttura del decision tree
    ],
    
    trigger:[
        L'utente vuole aggiungere un nodo figlio a un nodo del decision tree
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Aggiungi nodo")
    ],
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Aggiungi nodo figlio sinistro")
        - #use-case-label(nome-etichetta: "Aggiungi nodo figlio destro")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
