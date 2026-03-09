#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Compilazione nodo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Selezione risposta del nodo", "Inserisci evidenze"),
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
        + Il sistema mostra il nodo corrente del decision tree.
        + L'utente seleziona una risposta per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Selezione risposta del nodo").
        + L'utente inserisce facoltativamente le evidenze per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Inserisci evidenze").
    ],

    pre-condizioni: [
        - L'utente sta compilando il decision tree #sym.arrow #use-case-label(nome-etichetta: "Compila decision tree").
    ],

    post-condizioni: [
        - La risposta al nodo corrente è stata registrata.
        - Le eventuali evidenze inserite dall'utente sono state registrate.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Selezione risposta del nodo")
        - #use-case-label(nome-etichetta: "Inserisci evidenze")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
