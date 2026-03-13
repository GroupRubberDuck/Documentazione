#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica nome requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
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
    
    attore-principale:[Utente],
    
    scenario-principale:[
        + L'utente modifica il nome del requisito
    ],
    
    pre-condizioni:[
        - L'utente sta modificando l'anagrafica di un requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica anagrafica requisito")
    ],
    
    post-condizioni:[
        - L'utente ha modificato il nome del requisito 
    ],
    trigger:[
      L'utente vuole modificare il nome del requisito
    ],
    
    
    scenari-alternativi:[
      - L'utente inserisce un nome di requisito non valido #sym.arrow #use-case-label(nome-etichetta: "Errore modifica nome requisito non valido")
    ],
    
    inclusioni:none,
    
    estensioni:[
      - #use-case-label(nome-etichetta: "Errore modifica nome requisito non valido")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
