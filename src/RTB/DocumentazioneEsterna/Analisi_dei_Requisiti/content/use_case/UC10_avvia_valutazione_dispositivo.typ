#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Avvia valutazione dispositivo"
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
        + L'utente seleziona la funzionalità di avvio della sessione di valutazione
        + Il sistema avvia la sessione di valutazione del dispositivo selezionato
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di valutazione del dispositivo attive
        - Nel sistema non sono attive sessioni di modifica del modello attive
        - L'utente sta visualizzando le informazioni di uno specifico dispositivo #use-case-label(nome-etichetta: "Visualizza dati dispositivo")
        - Nel sistema è registrato almeno un dispositivo
        - Il modello di riferimento esiste nel sistema
    ],
    
    post-condizioni:[
        - Nel sistema è stata avviata la sessione di valutazione del dispositivo
    ],
    
    trigger:[
        L'utente vuole avviare la sessione di valutazione di un dispositivo
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
