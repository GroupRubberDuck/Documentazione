#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio modello"
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
        + L'utente seleziona un modello dalla lista dei modelli
        + L'utente visualizza il codice identificativo del modello
        + L'utente visualizza il nome del modello
        + L'utente visualizza il numero di versione del modello
        + L'utente visualizza la lista di requisiti associati al modello
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista dei dispositivi
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni di uno specifico dispositivo
    ],
    
    trigger:[
        L'utente vuole visualizzare le informazioni di uno specifico dispositivo
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
