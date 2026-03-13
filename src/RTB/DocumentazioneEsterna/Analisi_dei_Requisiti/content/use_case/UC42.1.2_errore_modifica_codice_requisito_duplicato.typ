#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Errore modifica codice requisito duplicato"
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
    
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza un messaggio di errore
    ],
    
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
        - Nel sistema è in corso la modifica dell'anagrafica di un requisito
        - L'utente ha inserito il codice del requisito
        - Il codice del requisito è già associato a un altro requisito
    ],
    
    
    post-condizioni:[
        - L'utente ha visualizzato un messagio di errore esplicativo
        - L'utente può ritentare l'inserimento del codice del requisito
    ],
 
    
    trigger:[
              L'utente ha inserito un codice del requisito già esistente e associato a un altro requisito

    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
