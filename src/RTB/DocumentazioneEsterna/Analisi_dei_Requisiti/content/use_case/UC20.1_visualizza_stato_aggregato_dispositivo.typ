#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza stato aggregato dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
      system-name: "Sistema",  // Il nome che va nell'angolo del recinto
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
    
<<<<<<< HEAD
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema aggrega gli stati degli asset del dispositivo
        + L'utente visualizza lo stato aggregato della valutazione de dispositivo
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
        + Il sistema verifica lo stato di valutazione di tutti i requisiti degli asset del dispositivo.
        + Il sistema calcola lo stato aggregato del dispositivo:
          - Conforme: tutti gli asset sono conformi allop standard.
          - Non conforme: almeno un asset non è conforme.
          - In corso: almeno un asset non è ancora stato valutato.
        + Il sistema mostra lo stato aggregato all'utente.
    ],
    
    pre-condizioni: [
        - L'utente sta visualizzando la dashboard del dispositivo #sym.arrow #use-case-label(nome-etichetta: "Visualizza dashboard dispositivo").
    ],
    
    post-condizioni: [
        - Lo stato di conformità aggregato del dispositivo è visualizzato.
>>>>>>> e72271b8386d7312aa100be667ee32eba6646742
    ],
    
    trigger: none,
    
    scenari-alternativi: none,
    
    inclusioni: none,
    
    estensioni: none,
    
    generalizzazioni: none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
