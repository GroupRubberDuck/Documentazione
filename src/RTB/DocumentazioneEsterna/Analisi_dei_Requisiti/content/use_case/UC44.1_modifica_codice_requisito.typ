#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica codice requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc: "Modifica anagrafica requisito",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (
    "Errore modifica codice requisito duplicato":[
        L'utente ha inserito un codice già associato a un altro requisito
    ],
    "Errore modifica codice requisito non valido":[
        L'utente ha inserito un codice non valido
    ],
  ),
  generalizations: (),
  spacing: (1.5cm, 2cm), 
  diagram-scale: 70%,
  actor-offset:0.8,
  note-offset: (0.5,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente modifica il codice del requisito
    ],
    
    pre-condizioni:[
        - L'utente sta modificando l'anagrafica di un requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica anagrafica requisito")
    ],
    
    post-condizioni:[
        - Il sistema ha registrato la modifica del codice del requisito 
    ],
    trigger:[
      L'utente vuole modificare il codice del requisito
    ],
    
    scenari-alternativi:[
        - L'utente inserisce un codice del requisito già appartenente a un altro requisito #sym.arrow #use-case-label(nome-etichetta: "Errore modifica codice requisito duplicato")
        - L'utente ha inserito un codice del requisito di valido #sym.arrow #use-case-label(nome-etichetta: "Errore modifica codice requisito non valido")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore modifica codice requisito duplicato")
        - #use-case-label(nome-etichetta: "Errore modifica codice requisito non valido")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
