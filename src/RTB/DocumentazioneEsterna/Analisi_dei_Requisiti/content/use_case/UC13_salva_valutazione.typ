#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Salva valutazione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Errore salvataggio valutazione":[
    Si verifica un errore nel salvataggio dei dati
  ]),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema salva le modifiche alla valutazione del dispositivo sul sistema di permanenza
    ],
    
    pre-condizioni:[
        - Nel sistema è in corso la valutazione di un dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha aggiornato la rappresentazione del dispositivo sul sistema di permanenza
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Errore nel salvataggio della valutazione #sym.arrow #use-case-label(nome-etichetta: "Errore salvataggio valutazione")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore salvataggio valutazione")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false),
)
