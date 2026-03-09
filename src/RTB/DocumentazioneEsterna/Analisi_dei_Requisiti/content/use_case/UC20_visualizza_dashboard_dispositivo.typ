#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dashboard dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
<<<<<<< HEAD
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
  target-uc: use-case-nome,
  actors: ("Utente",),
  includes: ("Visualizza lista asset","Visualizza stato aggregato dispositivo"),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 0,
=======
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza dati dispositivo", "Visualizza stato aggregato dispositivo", "Visualizza lista asset"),
    extends: (:),
    generalizations: (),
    spacing: (2.5cm, 2cm),
    diagram-scale: 80%
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
)


#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione: depth+2,
    
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    
<<<<<<< HEAD
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza la lista di asset #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista asset")
        + L'utente visualizza lo stato aggregato del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di valutazione di un dispositivo
    ],
    
    post-condizioni:[
        L'utente visualizza la dashboard riassuntiva dello stato del dispositivo
    ],
    
    trigger:[L'utente seleziona la funzionalità di visualizzazione della dashboard],
=======
    attore-principale: [Utente],
    
    scenario-principale: [
        + L'utente ha caricato o creato un dispositivo.
        + Il sistema recupera e mostra i dati del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dati dispositivo").
        + Il sistema calcola e mostra lo stato di conformità aggregato del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo").
        + Il sistema recupera e mostra la lista degli asset associati al dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista asset").
    ],
    
    pre-condizioni: [
        - Un dispositivo è stato creato o caricato nel sistema.
    ],
    
    post-condizioni: [
        - La dashboard del dispositivo è visualizzata correttamente con i dati aggiornati.
    ],
    
    trigger: [
        L'utente ha completato il caricamento o la creazione di un dispositivo e vuole vederne le informazioni.
    ],
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    
    scenari-alternativi: none,
    
<<<<<<< HEAD
    inclusioni:[
        - #use-case-label(nome-etichetta: "Visualizza lista asset")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
=======
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza dati dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza lista asset")
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    ],
    
    estensioni: none,
    
    generalizzazioni: none,
    
<<<<<<< HEAD
    path-immagine-diagramma:diagram,
=======
    path-immagine-diagramma:[
        #diagram
    ],
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    
    figure-caption:use-case-label(nome-etichetta:use-case-nome),
)
