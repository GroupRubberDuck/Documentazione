#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza elemento lista dispositivi"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc:"Visualizza lista dispositivi", 
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza nome dispositivo su lista dispositivi",),
  extends: (:),
  generalizations: (),
  spacing: (3.5cm, 2cm), 
  diagram-scale: 80%,
    actor-offset: 0,
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il nome del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome dispositivo su lista dispositivi")
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Non sono attive sessioni di modifica del modello
        - Non sono attive sessioni di valutazione
        - L'utente sta visualizzando la lista dei dispositivi #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista dispositivi")
    ],
    
    post-condizioni:[
        - L'utente visualizza le informazioni del singolo elemento della lista di dispositivi
    ],
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        #use-case-label(nome-etichetta: "Visualizza nome dispositivo su lista dispositivi")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
