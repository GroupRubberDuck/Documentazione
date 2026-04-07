#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Valuta nodo di decisione"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    target-uc: use-case-nome,
    actors: ("Utente",),
    includes: ("Inserisci risposta nodo decision tree",),
    extends: (

    ),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%,
    actor-offset: 0
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale: [Utente],
    
    scenario-principale: [
        + L'utente inserisce la risposta alla domanda del nodo #sym.arrow #use-case-label(nome-etichetta:"Inserisci risposta nodo decision tree")
        + Il sistema aggiorna lo stato di attività dei nodi successori
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando il dettaglio di uno specifico nodo decisionale del decision tree #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio nodo decisionale")
    ],
    
    post-condizioni: [
        - Il sistema ha registrato la risposta 
        - Il sistema ha aggiornato il nodo successore
        - Il sistema ha aggiornato opportunamente lo stato di attività dei nodi successori
    ],
    
    trigger: [
        L'utente vuole valutare un nodo di decisione
    ],
    
    scenari-alternativi: none,
    
    inclusioni: [
        - #use-case-label(nome-etichetta:"Inserisci risposta nodo decision tree")
    ],
    
    estensioni: none,
    
    generalizzazioni: none,
    
    path-immagine-diagramma:diagram,
    
    figure-caption:none,
)
