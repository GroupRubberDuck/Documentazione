#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Crea nuovo dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Inserimento nuovo dispositivo",
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
        + Il sistema associa al dispositivo il modello di standard di default

    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - Nel sistema non sono attive sessioni di valutazione
        - Esiste un modello di standard di default
    ],
    
    post-condizioni:[
        - Il sistema ha registrato il nuovo dispositivo
        - Il sistema ha associato il nuovo dispositivo al modello di default
        - Il sistema ha aggiunto il nuovo dispositivo alla lista dei dispositivi
    ],
    
    
    trigger:[
        L'utente seleziona la funzionalità di creazione manuale di un nuovo dispositivo 
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
