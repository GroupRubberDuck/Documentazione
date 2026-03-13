#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza sintesi dipendenza"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza codice dipendenza",
    "Visualizza stato dipendenza"
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
    
    attore-principale:"utente",
    
    scenario-principale:[
        + L'utente visualizza il codice del requisito da cui il requisito corrente dipende #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice dipendenza") 
        + L'utente visualizza lo stato del requisito da cui il requisito corrente dipende #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato dipendenza") 
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando la lista delle dipendenze del requisito nel contesto di un asset specifico
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni legate alla singola dipendenza del requisito in esame nel contesto dell'asset
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
            - #use-case-label(nome-etichetta: "Visualizza codice dipendenza")
            - #use-case-label(nome-etichetta: "Visualizza stato dipendenza")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
