#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dettaglio nodo decision tree"
#let depth=5

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza codice nodo", "Visualizza domanda nodo", "Visualizza risposta nodo", "Visualizza evidenze nodo"),
    extends: (:),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%
)


#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],
    
    scenario-principale: [
        + L'utente seleziona un nodo del decision tree.
        + Il sistema mostra le informazioni generali del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice nodo"), #use-case-label(nome-etichetta: "Visualizza domanda nodo"), #use-case-label(nome-etichetta: "Visualizza risposta nodo").
        + Il sistema mostra inoltre le evidenze associate al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza evidenze nodo").
    ],
    
    pre-condizioni: [
        - Il decision tree è visualizzato #sym.arrow #use-case-label(nome-etichetta: "Visualizza decision tree").
    ],
    
    post-condizioni: [
        - I dettagli del nodo sono visualizzati.
    ],
    
    trigger: [
        L'utente seleziona un nodo del decision tree per visualizzarne il dettaglio.
    ],
    
    scenari-alternativi: none,
    
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza codice nodo")
        - #use-case-label(nome-etichetta: "Visualizza domanda nodo")
        - #use-case-label(nome-etichetta: "Visualizza risposta nodo")
        - #use-case-label(nome-etichetta: "Visualizza evidenze nodo")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),

)
