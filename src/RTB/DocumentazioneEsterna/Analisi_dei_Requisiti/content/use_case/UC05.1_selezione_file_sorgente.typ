#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Selezione file sorgente"
#let depth=2

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc:"Importa dispositivo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (
    "Errore nella lettura del file":[Il file non può essere letto],
    "Errore nella struttura del file":[Il file contiene dati non coerenti con la struttura del modello dello standard],
    ),
  generalizations: (
    "Selezione file JSON",
    "Selezione file XML",
    "Selezione file CSV",
    ),
  spacing: (0.3cm, 3cm), 
  diagram-scale: 70%,
  top-padding:0.5
  )




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona il file da importare dal suo filesystem locale
    ],
    
    pre-condizioni:[
        - Il sistema è attivo
        - Nel sistema non sono attive sessioni di modifica del modello
        - L'utente ha selezionato la funzionalità di inserimento del dispositivo tramite file
    ],
    post-condizioni:[
        - Le informazioni contenute nel file vengono interpretate e salvate nel sistema
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Errore nella lettura del file #sym.arrow #use-case-label(nome-etichetta: "Errore nella lettura del file")
        - Errore struttura file non valida #sym.arrow #use-case-label(nome-etichetta: "Errore nella struttura del file")
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta:"Selezione file JSON",)
        - #use-case-label(nome-etichetta:"Selezione file XML",)
        - #use-case-label(nome-etichetta:"Selezione file CSV",)
    ],
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:none,
)
