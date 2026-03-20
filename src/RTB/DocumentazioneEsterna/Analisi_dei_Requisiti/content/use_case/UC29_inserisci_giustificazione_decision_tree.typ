#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci giustificazione decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(

  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
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
    
attore-principale: "Utente",

    scenario-principale: [
        + L'utente seleziona la funzione di inserimento della giustificazione associata al requisito
        + L'utente inserisce la giustificazione 
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di un requisito #use-case-label(nome-etichetta: "Visualizza dettaglio requisito")
        - È attiva una sessione di valutazione del dispositivo
    ],
    
    post-condizioni: [
        - Il sistema ha memorizzato la giustificazione sulla bozza operativa
        - Lo stato di valutazione del requisito è stato aggiornato sulla bozza operativa
    ],
    
    trigger: [
        L'utente vuole inserire o rettificare il testo della giustificazione
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
