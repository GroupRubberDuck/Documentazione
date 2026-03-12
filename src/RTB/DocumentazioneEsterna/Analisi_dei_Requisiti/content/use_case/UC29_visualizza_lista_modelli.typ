#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista modelli"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza elemento lista modelli",
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
        + L'utente seleziona la funzione di visione della lista modelli
        + Per ogni modello registrato nel sistema:
            + L'utente visualizza i dati generali del singolo modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza elemento lista modelli")
    ],
    
    pre-condizioni:[
        + Il sistema è attivo
        + Nel sistema non sono attive sessioni di valutazioni di dispositivi
        + Nel sistema non sono attive sessioni di modifica di modelli di standard
    ],
    
    post-condizioni:[
        - L'utente visualizza la lista dei modelli 
    ],
    
    trigger:[
        L'utente vuole visualizzare la lista dei modelli
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza elemento lista modelli")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
