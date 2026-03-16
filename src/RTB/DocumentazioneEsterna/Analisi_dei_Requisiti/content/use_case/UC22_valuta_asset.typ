#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Valuta asset"
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
  actor-offset:0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
      + L'utente visualizza il dettaglio del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio requisito")
        + L'utente può selezionare un nodo decisionale attivo
          + L'utente visualizza il dettaglio del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisionale")
          + L'utente valuta il nodo di decisione #sym.arrow #use-case-label(nome-etichetta: "Valuta nodo di decisione")
          + L'utente può andare al nodo successore #sym.arrow #use-case-label(nome-etichetta: "Vai al nodo successivo")
          + L'utente può andare al nodo predecessore #sym.arrow #use-case-label(nome-etichetta: "Vai al nodo precedente")

        + L'utente inserisce una giustificazione per i decision tree #sym.arrow #use-case-label(nome-etichetta: "Inserisci giustificazione decision tree")

    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione del dispositivo 
        - L'utente sta visualizzando il dettaglio dell'asset 

    ],
    
    post-condizioni:[
      - L'utente ha valutato l'asset
    ],
    
    trigger:[
      L'utente vuole valutare un asset
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/use_case/diagrammi-attivita/images/valuta-asset.drawio.png",
    
    figure-caption:none,
)
