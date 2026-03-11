#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Inserimento nome dispositivo",
"Inserimento sistema operativo dispositivo",
"Inserimento descrizione dispositivo"
  ),
  extends: ("Annulla modifiche dispositivo":[L'utente annulla la modifica delle informazioni del dispositivo]),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 70%,
  actor-offset: 1,
  note-offset: (-0.6,0.5)
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona la funzionalità di modifica del dispositivo attualmente selezionato
        + L'utente può inserire il nome del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
        + L'utente può inserire il sistema operativo del dispositivo #sym.arrow          #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
        + L'utente può inserire la descrizione del dispositivo #sym.arrow        #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
        + L'utente conferma la modifica
        + Il sistema applica le modifiche ai dati

    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - L'utente sta visualizzando uno specifico dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha aggiornato le informazioni del dispositivo
    ],
    
    
    trigger:[
        L'utente vuole modificare le informazioni del dispositivo
    ],
    
    scenari-alternativi:[
        - L'utente annulla la modifica dei dati del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Annulla modifiche dispositivo")
    ],
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Inserimento nome dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Inserimento descrizione dispositivo")
    ],
    
    estensioni:[
        - #use-case-label(nome-etichetta: "Annulla modifiche dispositivo")
    ],
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
