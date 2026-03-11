#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza riepilogo importazione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Visualizza nome dispositivo",
"Visualizza sistema operativo dispositivo",
"Visualizza descrizione dispositivo",
"Visualizza lista asset importati"
  ),
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
        + L'utente visualizza il nome del dispositivo
        + L'utente visualizza il sistema operativo del dispositivo
        + L'utente visualizza la descrizione del dispositivo
        + L'utente visualizza la lista degli asset importati
    ],
    
    pre-condizioni:[
        - L'utente sta inserendo un nuovo dispositivo tramite importazione di un file
        - L'utente ha selezionato un file valido per l'importazione
    ],
    
    post-condizioni:[
        - L'utente ha visualizzato le informazioni relative al dispositivo importato
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza nome dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza sistema operativo dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza descrizione dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza lista asset")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:none,
)
