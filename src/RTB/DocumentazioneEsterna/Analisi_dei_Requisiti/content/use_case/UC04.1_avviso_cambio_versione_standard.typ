#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avviso cambio versione standard"
#let depth=2


#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + Il sistema rileva che la versione dello standard selezionata è diversa da quella precedentemente salvata.
        + Il sistema mostra un messaggio di avviso indicando che la modifica potrebbe invalidare le verifiche già effettuate.
        + Il sistema richiede una conferma per procedere.
    ],
    pre-condizioni:[
        - L'utente è in fase di modifica del dispositivo.
        - L'utente ha modificato il campo "Versione dello standard".
    ],
    post-condizioni:[
        - L'utente ha preso visione del rischio di perdita di consistenza dei dati di verifica.
    ],
    trigger: none,

    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)