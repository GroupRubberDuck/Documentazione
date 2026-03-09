#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza generale nodo decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza codice nodo", "Visualizza domanda nodo", "Visualizza risposta nodo"),
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
        + Il sistema mostra il codice del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice nodo").
        + Il sistema mostra la domanda del nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza domanda nodo").
        + Il sistema mostra la risposta data al nodo #sym.arrow #use-case-label(nome-etichetta: "Visualizza risposta nodo").
    ],
    
    pre-condizioni: [
        - Il decision tree è visualizzato.
    ],
    
    post-condizioni: [
        - Le informazioni generali del nodo sono visualizzate.
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza codice nodo")
        - #use-case-label(nome-etichetta: "Visualizza domanda nodo")
        - #use-case-label(nome-etichetta: "Visualizza risposta nodo")
    ],
    
    estensioni: none,

    generalizzazioni: none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
