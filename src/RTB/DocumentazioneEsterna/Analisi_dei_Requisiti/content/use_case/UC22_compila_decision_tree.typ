#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code
#import "/scripts/use_case_generator/uc-deps.typ" as deps

#let use-case-nome="Compila decision tree"
#let depth=1

#let diagram-type=deps.draw-uc-diagram

#let diagram=diagram-type(
    system-name: "Sistema",
    target-uc: "",
    actors: ("Utente",),
    includes: ("Compilazione nodo", "Navigazione del DT"),
    extends: (
        "Errore giustificazione mancante": [L'esito del nodo terminale è NA e la giustificazione non è stata inserita],
    ),
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
        + L'utente avvia la compilazione del decision tree associato a un requisito.
        + Il sistema mostra il nodo radice del decision tree.
        + L'utente compila il nodo corrente selezionando una risposta #sym.arrow #use-case-label(nome-etichetta: "Compilazione nodo").
        + Il sistema naviga al nodo successivo #sym.arrow #use-case-label(nome-etichetta: "Navigazione del DT").
        + I passi 3 e 4 si ripetono fino al raggiungimento di un nodo foglia.
        + Il sistema mostra il verdetto finale (Pass, Fail o NA).
    ],
    
    pre-condizioni: [
        - L'utente ha selezionato un requisito dalla lista e sta visualizzandone il decision tree.
        - Il decision tree associato al requisito è disponibile nel sistema.
    ],
    
    post-condizioni: [
        - Il verdetto finale del requisito è stato registrato nel sistema.
        - Lo stato del requisito è aggiornato a Pass, Fail o NA.
    ],
    
    trigger: [
        L'utente vuole compilare il decision tree associato a un requisito.
    ],
    
    scenari-alternativi: [
        + Il sistema raggiunge un nodo terminale con esito NA e l'utente non ha inserito una giustificazione (just) #sym.arrow #use-case-label(nome-etichetta: "Errore giustificazione mancante").
    ],
    
    inclusioni: [
        - #use-case-label(nome-etichetta: "Compilazione nodo")
        - #use-case-label(nome-etichetta: "Navigazione del DT")
    ],
    
    estensioni: [
        - #use-case-label(nome-etichetta: "Errore giustificazione mancante")
    ],
    
    generalizzazioni: none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
