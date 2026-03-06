#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Selezione risposta del nodo"
#let depth=3

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: (),
    extends: (:),
    generalizations: ("Seleziona Yes", "Seleziona No"),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%
)

#use-case-template(
    nome: use-case-nome,

    livello-intestazione: depth+2,

    codice: get-use-case-code(nome-etichetta: use-case-nome),

    attore-principale: [Utente],

    scenario-principale: [
        + Il sistema mostra le opzioni di risposta per il nodo corrente.
        + L'utente seleziona una risposta per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Seleziona Yes") oppure #use-case-label(nome-etichetta: "Seleziona No").
    ],

    pre-condizioni: [
        - L'utente sta compilando il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Compilazione nodo").
    ],

    post-condizioni: [
        - La risposta selezionata dall'utente è stata registrata.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: none,

    estensioni: none,

    generalizzazioni: [
    - #use-case-label(nome-etichetta: "Seleziona Yes")
    - #use-case-label(nome-etichetta: "Seleziona No")
    ],

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)