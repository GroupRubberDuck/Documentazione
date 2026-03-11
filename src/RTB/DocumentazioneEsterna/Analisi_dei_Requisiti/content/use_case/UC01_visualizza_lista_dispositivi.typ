#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista dispositivi"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza elemento lista dispositivi",),
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
        + Per ogni dispositivo registrato
            + L'utente visualizza il singolo elemento della lista dei dispositivi #sym.arrow #use-case-label(nome-etichetta: "Visualizza elemento lista dispositivi")
        
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Non sono attive sessioni di modifica del modello
        - Non sono attive sessioni di valutazione
    ],
    
    post-condizioni:[
        - L'utente visualizza la lista dei dispositivi registrati
    ],
    
    trigger:[
        L'utente vuole vedere la lista dei dispositivi caricati
    ],
    
    scenari-alternativi:[
        - La lista dei dispositivi è vuota
    ],
    
    inclusioni:[
        #use-case-label(nome-etichetta: "Visualizza elemento lista dispositivi")
    ],
    
    estensioni:[
        #use-case-label(nome-etichetta: "Lista dispositivi vuota")

    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
