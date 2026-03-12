#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Modifica nome asset",
    "Modifica tipo asset",
    "Modifica descrizione asset",
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
        + L'utente richiede la modifica dell'asset
        + L'utente può modificare un nome per l'asset #sym.arrow #use-case-label(nome-etichetta: "Modifica nome asset")
        + L'utente può modificare un tipo per l'asset #sym.arrow #use-case-label(nome-etichetta: "Modifica tipo asset")
        + L'utente può modificare una descrizione per l'asset #sym.arrow #use-case-label(nome-etichetta: "Modifica descrizione asset")
        + L'utente conferma le modifiche inserite
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione del dispositivo
        - L'utente sta visualizzando il dettaglio del dispositivo

    ],
    
    post-condizioni:[
        - Il sistema ha aggiornato la bozza operativa con le nuove informazioni dell'asset
    ],
    
    trigger:[
        L'utente vuole modificare i dai di un asset
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Modifica nome asset")
        - #use-case-label(nome-etichetta: "Modifica tipo asset")
        - #use-case-label(nome-etichetta: "Modifica descrizione asset")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(br:false,nome-etichetta: use-case-nome),
)
