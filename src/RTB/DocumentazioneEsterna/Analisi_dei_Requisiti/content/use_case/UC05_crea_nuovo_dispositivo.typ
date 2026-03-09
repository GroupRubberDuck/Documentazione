#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Crea nuovo dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (     "Inserimento nome dispositivo",
        "Inserimento sistema operativo dispositivo",
        "Inserimento descrizione dispositivo"),
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
        + L'utente inserisce il nome del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
        + L'utente inserisce il sistema operativo del dispositivo #sym.arrow          #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
        + L'utente inserisce la descrizione del dispositivo #sym.arrow        #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
        + Il sistema avvia la sessione di valutazione del dispositivo

    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - Nel sistema non sono attive sessioni di valutazione
    ],
    
    post-condizioni:[
        - Il sistema ha aggiunto il dispositivo alla lista dei dispositivi
    ],
    
    
    
    trigger:[
        L'utente seleziona la funzionalità di creazione di un nuovo dispositivo 
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta:use-case-nome,br:false),
)
