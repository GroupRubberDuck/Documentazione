#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Modifica anagrafica requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: (
    "Modifica codice requisito",
    "Modifica nome requisito",
    "Modifica descrizione requisito",
  ),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 1
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente attiva la funzione di modifica di un nuovo requisito
        + L'utente modifica il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica codice requisito")
        + L'utente modifica il nome del requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica nome requisito")
        + L'utente modifica la descrizione del requisito #sym.arrow #use-case-label(nome-etichetta: "Modifica descrizione requisito")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando il dettaglio del modello #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio requisito modello")
    ],
    
    post-condizioni:[
        - Il sistema ha modificato l'anagrafica di un requisito
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:[
        - #use-case-label(nome-etichetta: "Modifica codice requisito")
        - #use-case-label(nome-etichetta: "Modifica nome requisito")
        - #use-case-label(nome-etichetta: "Modifica descrizione requisito")
    ],
    
    
    estensioni:none,
    
    
    generalizzazioni:none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:deps.use-case-link-extended-label(nome-etichetta: use-case-nome),
)
