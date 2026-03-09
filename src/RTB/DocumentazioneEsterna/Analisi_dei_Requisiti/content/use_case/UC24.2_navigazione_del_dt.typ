#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Navigazione del dt"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Vai al nodo successivo", "Vai al nodo precedente"),
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
        + L'utente vuole navigare tra i nodi  e può selezionare l'opzione per procedere al nodo successivo #sym.arrow #use-case-label(nome-etichetta: "Vai al nodo successivo") e l'opzione per tornare al nodo precedente #sym.arrow - #use-case-label(nome-etichetta: "Vai al nodo precedente")
    ],

    pre-condizioni: [
        - L'utente sta compilando il decision tree: #use-case-label(nome-etichetta: "Compila decision tree").
    ],

    post-condizioni: [
        - Il sistema mostra il nodo successivo o precedente del decision tree.
    ],

    trigger: none,

    scenari-alternativi: none,
    
    inclusioni: [
    - #use-case-label(nome-etichetta: "Vai al nodo successivo")
    - #use-case-label(nome-etichetta: "Vai al nodo precedente")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
