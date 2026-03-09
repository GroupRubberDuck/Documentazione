#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza lista asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizzazione singolo elemento della lista di asset",),
    extends: (:),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%
)




#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
<<<<<<< HEAD
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni asset
            + L'utente visualizza il nome dell'asset
            + L'utente visualizza lo stato aggregato dell'asset

    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione di un dispositivo
        - L'utente ha selezionata la visualizzazione del dispositivo
    ],
    
    post-condizioni:[
        L'utente visualizza la dashboard riassuntiva dello stato del dispositivo
=======
    attore-principale: [Utente],
    
    scenario-principale: [
        + Il sistema recupera la lista degli asset associati al dispositivo.
        + L'utente visualizza la lista degli asset con le informazioni generali per ogni asset #sym.arrow #use-case-label(nome-etichetta: "Visualizzazione singolo elemento della lista di asset").
        + L'utente può selezionare un asset per visualizzarne il dettaglio #sym.arrow #use-case-label(nome-etichetta: "Visualizza dettaglio asset").
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando la dashboard del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dashboard dispositivo").
    ],
    
    post-condizioni: [
        - La lista degli asset del dispositivo è visualizzata correttamente.
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
<<<<<<< HEAD
    inclusioni:[
        - 
=======
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizzazione singolo elemento della lista di asset")
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:[
        #diagram
    ],

    figure-caption: use-case-label(nome-etichetta: use-case-nome),
)
