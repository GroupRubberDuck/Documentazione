#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Visualizza dashboard dispositivo"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Visualizza dati dispositivo", "Visualizza stato aggregato dispositivo", "Visualizza lista asset"),
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
    
    scenari-alternativi: none,
    
    inclusioni: [
        - #use-case-label(nome-etichetta: "Visualizza dati dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza stato aggregato dispositivo")
        - #use-case-label(nome-etichetta: "Visualizza lista asset")
    ],
    
    estensioni: none,
    
    generalizzazioni: none,
    
    path-immagine-diagramma:[
        #diagram
    ],
    
    figure-caption:use-case-label(nome-etichetta:use-case-nome),
)
