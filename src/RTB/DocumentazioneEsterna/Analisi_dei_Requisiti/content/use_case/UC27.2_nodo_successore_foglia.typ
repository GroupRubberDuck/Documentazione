#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Nodo successore foglia"
#let depth=2

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
        + Il sistema rileva che il nodo successore è un nodo foglia
        + Il sistema notifica all'utente il completamento del percorso decisionale
        + Il sistema interrompe la navigazione passo-passo e reindirizza l'utente alla schermata di dettaglio del requisito 
    ],

    pre-condizioni: [
        - L'utente sta tentando la navigazione al nodo successore
        - Il nodo successore è un nodo foglia
    ],
    
    post-condizioni: [
        - L'utente ha ricevuto conferma visiva del raggiungimento dell'esito
        - L'utente visualizza il requisito associato al DT di appartenenza del nodo nodo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
