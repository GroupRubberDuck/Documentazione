#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Importa dispositivo"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Selezione file sorgente",),
  extends: ("Errore nella lettura del file":[
    L'utente ha selezionato un file con formato, dimensioni o struttura non validi
  ]),
  generalizations: (),
  actor-offset: 0,
  spacing: (4.5cm, 4cm), 
  note-offset: (0.6,0.6),
  diagram-scale: 80%
)
// Errore nella lettura del file
// Errore nella struttura del file



#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona un file da importare #sym.arrow #use-case-label(nome-etichetta: "Selezione file sorgente")
        + Il sistema legge le informazioni del dispositivo
        + Il sistema importa la lista degli asset
        + Il sistema importa le informazioni per la valutazione già salvate sul file
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
        L'utente seleziona la funzionalità di inserimento del dispositivo tramite importazione di un file
    ],
    
    scenari-alternativi:[
        - Errore nella lettura del file #sym.arrow #use-case-label(nome-etichetta: "Errore nella lettura del file")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Selezione file sorgente")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:none,
)
