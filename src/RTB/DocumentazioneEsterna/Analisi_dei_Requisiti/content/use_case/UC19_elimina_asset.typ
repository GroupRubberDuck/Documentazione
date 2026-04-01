#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Elimina asset"
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
        + L'utente richiede l'eliminazione dell'asset
        + Il sistema mostra un avviso
        + L'utente conferma l'eliminazione dell'asset
        + Il sistema elimina l'asset dalla bozza operativa
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione del dispositivo
        - L'utente sta visualizzando il dettaglio di un asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio asset")
    ],
    
    post-condizioni:[
        - Il sistema ha rimosso l'asset dalla bozza operativa
    ],
    
    trigger:[
        L'utente vuole eliminare un asset
        ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome,br:false),
)
