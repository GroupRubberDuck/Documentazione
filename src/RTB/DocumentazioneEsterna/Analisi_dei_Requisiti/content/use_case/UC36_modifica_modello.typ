#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica modello"
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
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente attiva la funzione per la modifica del modello
        + Il sistema avvia la sessione di modifica della struttura del modello
        + L'utente può aggiungere requisiti #sym.arrow #use-case-label(nome-etichetta: "Aggiungi requisito")
        + L'utente può selezionare un requisito 
            + L'utente può modificare l'anagrafica del requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica anagrafica requisito")
            + L'utente può aggiungere una dipendenza #sym.arrow #use-case-label(nome-etichetta: "Aggiungi dipendenza")
            + L'utente può rimuovere una dipendenza #sym.arrow #use-case-label(nome-etichetta: "Rimuovi dipendenza")
            + L'utente può appendere un nodo al decision tree #sym.arrow #use-case-label(nome-etichetta: "Aggiungi nodo figlio")
            + L'utente può modificare un nodo al decision tree #sym.arrow #use-case-label(nome-etichetta: "Modifica nodo")
            + L'utente può rimuovere un nodo al decision tree #sym.arrow #use-case-label(nome-etichetta: "Rimuovi nodo")
        + L'utente salva le modifiche alla struttura del modello #sym.arrow #use-case-label(nome-etichetta: "Salva modifica modello")

    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio del modello
    ],
    
    post-condizioni:[
        -Il sistema ha registrato la modifica della struttura del modello
    ],
    
    trigger:[
        L'utente vuole modificare il modello
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case/diagrammi-attivita/images/modifica-struttura-modello.drawio.png",
    
    figure-caption:none,
)
