#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dati dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza nome dispositivo",
  "Visualizza sistema operativo dispositivo",
  "Visualizza descrizione dispositivo"),
  extends: (:),
  generalizations: (),
  spacing: (4.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona un dispositivo dalla lista dei dispositivi
        + L'utente visualizza il nome del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome dispositivo")
        + L'utente visualizza il sistema operativo del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo")
        + L'utente visualizza la descrizione del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo")
        + Visualizza modello associato al dispositivo
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - L'utente sta visualizzando la lista dei dispositivi
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni del dispositivo
    ],
    
    trigger:[
        L'utente vuole visualizzare le informazioni generali di un dispositivo
        ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nome dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:none,
)
