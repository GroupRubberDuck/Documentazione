#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Nodo senza risposta selezionata"
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
        + Il sistema rileva l'assenza di una risposta valida fornita per il nodo corrente
        + Il sistema interrompe l'elaborazione del passaggio al nodo successivo
        + Il sistema notifica all'utente l'obbligo di inserire una risposta per poter procedere
    ],

    pre-condizioni: [
        - L'utente ha innescato il comando di navigazione verso il nodo successivo
        - Il nodo di decisione correntemente visualizzato è privo di risposta
    ],
    
    post-condizioni: [
        - L'avanzamento lungo l'albero decisionale è bloccato
        - L'utente ha ricevuto la notifica del blocco
        - L'utente continua a visualizzare il dettaglio del nodo corrente
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
