#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Elimina dispositivo con back up"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-expansion

#let diagram=diagram-type(
parent-uc: "Elimina dispositivo",
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (
    "Elimina dispositivo con back up JSON",
    "Elimina dispositivo con back up XML",
    "Elimina dispositivo con back up CSV",
  ),
  spacing: (0.2cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 6,
  top-padding: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente seleziona la funzione di eliminazione del dispositivo
        + Il sistema mostra un messaggio di avviso
        + L'utente scarica un file contenente i dati del dispositivo sul proprio file system
        + L'utente conferma l'eliminazione
        + Il sistema elimina il dispositivo dal sistema di permanenza interno
    ],
    
    pre-condizioni:[
        - Nel sistema non sono attive sessioni di valutazione del dispositivo
        - L'utente sta visualizzando uno specifico dispositivo
    ],
    
    post-condizioni:[
        - Il sistema ha rimosso il dispositivo dal proprio sistema di permanenza interno
    ],
    
    trigger:[
        - L'utente vuole eliminare le informazioni sul dispositivo
        - L'utente ha scaricato un file contenente i dati del dispositivo


    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:[
        - #use-case-label(nome-etichetta: "Elimina dispositivo con back up JSON")
        - #use-case-label(nome-etichetta: "Elimina dispositivo con back up XML")
        - #use-case-label(nome-etichetta: "Elimina dispositivo con back up CSV")
    ],
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
