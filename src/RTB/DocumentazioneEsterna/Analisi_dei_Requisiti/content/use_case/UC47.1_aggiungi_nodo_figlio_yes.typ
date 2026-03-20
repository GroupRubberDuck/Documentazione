#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiungi nodo figlio YES"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
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
        + L'utente aggiunge un nodo
        + Il sistema crea la relazione bivio logico YES tra nodo selezionato e nodo aggiunto
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio di un nodo
        - Il nodo selezionato non ha un figlio associato alla risposta YES
        - Nel sistema è attiva una sessione di modifica della struttura del modello

    ],
    
    
    post-condizioni:[
        - Il nodo selezionato ha un figlio associato alla risposta YES
    ],
    
    trigger:[
        L'utente vuole aggiungere un nodo figlio associato alla risposta YES
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
