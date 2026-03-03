#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserimento nuovo dispositivo"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: ("Valutazione dispositivo in corso":[Nel sistema è già in corso la valutazine di un dispositivo],
  "Annullamento inserimento dispositivo":[L'utente annulla l'inserimento del dispositivo]
  ),
  generalizations: ("Crea nuovo dispositivo","Importa dispositivo"),
  spacing: (0.3cm, 0.8cm), 
  diagram-scale: 70%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente inserisce un dispositivo
        + Il sistema carica in memoria le informazioni del dispositivo
        + Il sistema avvia la sessione di valutazione del dispositivo
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
    ],
    
    post-condizioni:[
        - Nel sistema è attiva una sessione di valutazione del dispositivo
    ],
    
    trigger:[
        L'utente seleziona la funzionalità per l'inserimento di un dispositivo
    ],
    
    scenari-alternativi:[
        - Nel sistema è già attiva una sessione di valutazione del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Valutazione dispositivo in corso")
        - L'utente annulla l'inserimento del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Annullamento inserimento dispositivo")
    ],
    
    inclusioni:none,
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Valutazione dispositivo in corso")
        - #use-case-label(nome-etichetta: "Annullamento inserimento dispositivo")
    ],
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Crea nuovo dispositivo")
        - #use-case-label(nome-etichetta: "Importa dispositivo")
    ],
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:[
        #use-case-label(nome-etichetta: use-case-nome)
    ],
)
