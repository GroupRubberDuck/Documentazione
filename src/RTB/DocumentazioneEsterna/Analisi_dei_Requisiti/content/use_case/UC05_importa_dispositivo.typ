#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Importa dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(

  target-uc: use-case-nome,
  parent-uc: "Inserimento nuovo dispositivo",
  actors: ("Utente",),
  includes: ("Selezione file sorgente",),
  extends: ("Errore file dispositivo non valido":[
    L'utente ha selezionato un file con formato, dimensioni non validi o con un modello associato inesistente sul sistema
  ]),
  generalizations: (),
  actor-offset: 0,
  spacing: (4.5cm, 4cm), 
  note-offset: (0.7,0),
  diagram-scale: 80%,
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
        + Il sistema importa le informazioni per la valutazione già presenti sul file

    ],
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - Nel sistema non sono attive sessioni di valutazione
    ],
    
    post-condizioni:[
        - Il sistema ha registrato il nuovo dispositivo
        - Il sistema ha aggiunto il dispositivo alla lista dei dispositivi
    ],
    
    
    trigger:[
        L'utente seleziona la funzionalità di inserimento del dispositivo tramite importazione di un file
    ],
    
    scenari-alternativi:[
        - Errore nella lettura del file #sym.arrow #use-case-label(nome-etichetta: "Errore file dispositivo non valido")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Selezione file sorgente")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore file dispositivo non valido")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:[ #deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false)],
)
