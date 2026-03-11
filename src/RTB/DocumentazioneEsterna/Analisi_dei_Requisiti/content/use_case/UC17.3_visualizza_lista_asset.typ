#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista asset"
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
        + Il sistema recupera la lista degli asset associati al dispositivo.
        + Per ogni asset della lista di asset
            + L'utente visualizza le informazioni generali dello specifico asset
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando la dashboard del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dashboard dispositivo")
    ],
    
    post-condizioni: [
        - L'utente visualizza la lista degli asset
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: [

    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
