#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Selezione file sorgente"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
    parent-uc: "Importa dispositivo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Selezione file JSON",
    "Selezione file XML",
    "Selezione file CSV",
    ),
  spacing: (0.3cm, 3cm), 
  diagram-scale: 70%,
  top-padding:1
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
        - L'utente sta inserendo un dispositivo tramite importazione di un file esterno #sym.arrow #use-case-label(nome-etichetta: "Importa dispositivo")
    ],
    post-condizioni:[
        - Il sistema memorizza un riferimento al file selezionato dall'utente 
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
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
