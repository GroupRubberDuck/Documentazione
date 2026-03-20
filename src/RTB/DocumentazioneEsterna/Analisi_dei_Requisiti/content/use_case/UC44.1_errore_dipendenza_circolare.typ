#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Errore dipendenza circolare"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc: "Aggiungi dipendenza",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza grafo dipendenze",),
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
        + Il sistema rileva una dipendenza circolare
        + Il sistema blocca l'aggiunta
        + L'utente visualizza il grafo delle dipendenze di quel requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza grafo dipendenze")
        + Il sistema annulla l'aggiunta della dipendenza
    ],
    
    pre-condizioni:[
        - L'utente sta aggiungendo una dipendenza
    ],
    
    post-condizioni:[
        - Il sistema ha bloccato l'aggiunta alle dipendenze
    ],
    
    trigger:[
        L'utente ha aggiunto un una dipendenza che crea una dipendenza circolare
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza grafo dipendenze")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
