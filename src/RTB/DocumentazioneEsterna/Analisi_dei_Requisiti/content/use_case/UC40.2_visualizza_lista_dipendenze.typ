#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista dipendenze"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza dettaglio requisito modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza codice dipendenze",),
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
        + Il sistema controlla le dipendenze del requisito
        + Il sistema genera una lista contente gli altri requisiti da cui dipende il requisito corrente
            + Per ogni elemento della lista, l'utente visualizza il codice del singolo requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice dipendenze")
    ],
    
    pre-condizioni:[
        - L'utente ha selezionato un requisito
    ],
    
    post-condizioni:[
        - L'utente h visualizzato la lista delle dipendenze
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di visualizzazione della lista delle dipendenze
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza codice dipendenze")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
