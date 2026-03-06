#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizzazione generale requisito"
#let depth=3

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza nome requisito", "Visualizza stato di valutazione"),
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
        + Il sistema mostra il nome del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza nome requisito").
        + Il sistema mostra lo stato di valutazione del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato di valutazione").
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista dei requisiti dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset").
    ],

    post-condizioni: [
        - Le informazioni generali del requisito sono visualizzate nella lista.
    ],

    trigger: none,

    scenari-alternativi: none,

    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza nome requisito")
        - #use-case-label(nome-etichetta: "Visualizza stato di valutazione")
    ],

    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
