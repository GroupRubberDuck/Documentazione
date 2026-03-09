#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Inserisci nome asset",
    "Seleziona tipo asset",
    "Inserisci descrizione asset",
  ),
  extends: ("Annulla modifica asset":[
    L'utente seleziona l'annullamento della modifica
  ]),
  generalizations: (),
  spacing: (1.5cm, 2cm), 
  diagram-scale: 70%,
  actor-offset: 2,
  note-offset: (-1,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente può inserire un nome per l'asset #sym.arrow #use-case-label(nome-etichetta: "Inserisci nome asset")
        + L'utente può inserire un tipo per l'asset #sym.arrow #use-case-label(nome-etichetta: "Seleziona tipo asset")
        + L'utente può inserire una descrizione per l'asset #sym.arrow #use-case-label(nome-etichetta: "Inserisci descrizione asset")
        + L'utente conferma le modifiche inserite
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione del dispositivo

    ],
    
    post-condizioni:[
        - Il sistema ha aggiornato l'asset con le nuove informazioni sulla bozza operativa
    ],
    
    trigger:[
        L'utente seleziona un asset per la modifica
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserisci nome asset")
        - #use-case-label(nome-etichetta: "Seleziona tipo asset")
        - #use-case-label(nome-etichetta: "Inserisci descrizione asset")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(br:false,nome-etichetta: use-case-nome),
)
