#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Aggiunta asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
"Inserisci nome asset",
"Seleziona tipo asset",
    "Inserisci descrizione asset",
  ),
  extends: ("Annulla aggiunta asset":[
    L'utente seleziona l'annullamento dell'operazione di aggiunta
  ]),
  generalizations: (),
  spacing: (3.5cm, 2cm), 
  diagram-scale: 60%,
  actor-offset: 1,
  note-offset: (-1,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce il nome dell'asset #sym.arrow #use-case-label(nome-etichetta: "Inserisci nome asset")
        + L'utente inserisce il tipo dell'asset #sym.arrow #use-case-label(nome-etichetta: "Seleziona tipo asset")
        + L'utente inserisce la descrizione dell'asset  #sym.arrow #use-case-label(nome-etichetta: "Inserisci descrizione asset")

    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sessione di valutazione di un dispositivo
        - L'utente sta visualizzando la lista degli asset #sym.arrow #use-case-label(nome-etichetta:"Visualizza lista asset")
    ],
    
    post-condizioni:[
        - Il sistema ha memorizzato le informazioni relative al nuovo asset sulla bozza operativa
        - Il sistema ha aggiunto il nuovo asset alla lista degli asset
    ],
    
    trigger:[L'utente vuole aggiungere un nuovo asset],
    
    scenari-alternativi:[
        - L'utente annulla l'aggiunta dell'asset #sym.arrow #use-case-label(nome-etichetta: "Annulla aggiunta asset")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserisci nome asset")
        - #use-case-label(nome-etichetta: "Seleziona tipo asset")
        - #use-case-label(nome-etichetta: "Inserisci descrizione asset")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Annulla aggiunta asset")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false),
)
