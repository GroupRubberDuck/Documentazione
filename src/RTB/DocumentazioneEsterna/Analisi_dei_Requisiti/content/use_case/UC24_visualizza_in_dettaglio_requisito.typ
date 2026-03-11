#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza in dettaglio requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: use-case-nome,
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
        + L'utente seleziona un requisito dalla lista dei requisiti dell'asset
        + L'utente visualizza il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "Visualizza codice requisito")
        + L'utente visualizza la descrizione normativa del requisito #sym.arrow 
        + L'utente visualizza le dipendenze del requisito #sym.arrow 
        + L'utente visualizza il decision tree associato al requisito #sym.arrow 
    ],

    pre-condizioni: [
        - L'utente sta visualizzando la lista dei requisiti dell'asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista requisiti asset").
    ],

    post-condizioni: [
        - L'utente ha visualizzato il dettaglio del requisito
        - L'utente ha visualizzato il decision tree
    ],

    trigger: [
        Vuole visualizzare il dettaglio di un requisito nel contesto dell'asset
    ],

    scenari-alternativi: none,

    inclusioni: [

    ],
    estensioni: none,

    generalizzazioni: none,

    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
