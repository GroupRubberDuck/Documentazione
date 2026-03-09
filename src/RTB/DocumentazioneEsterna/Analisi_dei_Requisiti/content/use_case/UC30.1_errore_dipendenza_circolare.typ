#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Errore dipendenza circolare"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema rileva una dipendenza circolare
        + Il sistema blocca l'aggiunta
        + L'utente visualizza il grafo delle dipendenze di quel requisito
        + Il sistema annulla l'aggiunta della dipendenza
    ],
    
    pre-condizioni:[
        - L'utente ha aggiunto un una dipendenza che crea una dipendenza circolare
    ],
    
    post-condizioni:[
        - Il sistema blocca l'aggiunta alle dipendenze
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[Visualizza grafo dipendenza],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
