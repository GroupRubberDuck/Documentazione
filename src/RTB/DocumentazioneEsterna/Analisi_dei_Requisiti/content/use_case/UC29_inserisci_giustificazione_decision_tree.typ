#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci giustificazione decision tree"
#let depth=1

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
    
attore-principale: "Utente",

    scenario-principale: [
        + L'utente seleziona la funzione di inserimento della giustificazione associata al requisito
        + L'utente inserisce il testo della giustificazione
        + L'utente conferma l'operazione
        + Il sistema salva il dato aggiornato
    ],

    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di un requisito
        - È attiva una sessione di valutazione del dispositivo
    ],
    
    post-condizioni: [
        - Il sistema memorizza il testo della giustificazione sulla bozza operativa
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
