#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza ID modello",
"Visualizza nome modello",
"Visualizza versione modello",
"Visualizza lista requisiti modello"
  ),
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
        + L'utente seleziona un modello dalla lista dei modelli
        + L'utente visualizza il codice identificativo del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza ID modello")
        + L'utente visualizza il nome del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome modello")
        + L'utente visualizza il numero di versione del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza versione modello")
        + L'utente visualizza la lista di requisiti associati al modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti modello")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista dei modelli
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni di uno specifico modello
    ],
    
    trigger:[
        L'utente vuole visualizzare le informazioni di uno specifico modello
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta:"Visualizza ID modello")
        - #use-case-label(nome-etichetta:"Visualizza nome modello")
        - #use-case-label(nome-etichetta:"Visualizza versione modello")
        - #use-case-label(nome-etichetta:"Visualizza lista requisiti modello")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
