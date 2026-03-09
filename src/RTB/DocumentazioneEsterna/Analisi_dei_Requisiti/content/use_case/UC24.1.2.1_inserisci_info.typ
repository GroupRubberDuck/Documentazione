#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci info"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: (),
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
        + L'utente inserisce facoltativamente informazioni aggiuntive per il nodo corrente.
    ],

    pre-condizioni: [
        - L'utente sta inserendo le evidenze per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Inserisci evidenze").
    ],

    post-condizioni: [
        - Le informazioni aggiuntive inserite dall'utente sono state registrate.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: none,

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma: none,

    figure-caption: none,
)
