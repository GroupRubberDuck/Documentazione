#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Inserisci evidenze"
#let depth=3

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Inserisci info", "Inserisci just"),
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
        + L'utente inserisce facoltativamente evidenze aggiuntive per il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Inserisci info"), #use-case-label(nome-etichetta: "Inserisci just").
    ],
    pre-condizioni: [
        - L'utente sta compilando il nodo corrente #sym.arrow #use-case-label(nome-etichetta: "Compilazione nodo").
    ],
    post-condizioni: [
        - Le eventuali evidenze inserite dall'utente sono state registrate.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Inserisci info")
        - #use-case-label(nome-etichetta: "Inserisci just")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
