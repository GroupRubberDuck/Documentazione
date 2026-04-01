#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista non dipendenze"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Visualizza dettaglio requisito modello",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza codice non dipendenze",),
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
        + Il sistema genera una lista contenente i requisiti da cui non dipende il requisito corrente
            + Per ogni elemento della lista, l'utente visualizza il singolo elemento #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice non dipendenze")
    ],
    
    pre-condizioni:[
        - L'utente ha selezionato un requisito
        - Nel sistema è in corso la modifica del requisito
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato la lista dei requisiti da cui non dipende il requisito
    ],
    
    trigger:[
        L'utente vuole visualizzare la lista delle dipendenze del requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza codice non dipendenze")

    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
