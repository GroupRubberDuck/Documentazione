#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Chiusura sessione di verifica attuale"
#let depth=1
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + L'utente richiede di uscire dalla sessione di verifica corrente.
        + Il sistema esegue il salvataggio automatico dello stato corrente (risposte date e nodi visitati).
        + Il sistema aggiorna i metadati della sessione contrassegnandola come "In corso" e aggiorna la data di ultima valutazione.

    ],
    pre-condizioni:[
        - È in corso una sessione di verifica attiva.
    ],
    post-condizioni:[
        - Lo stato della verifica è salvato in modo persistente.
        - La sessione è disponibile per essere ripresa in futuro.
    ],
    trigger:[
        L'utente esce dalla sessione di verifica attuale.
    ],
    scenari-alternativi:[
        - *Errore salvataggio*: Durante il tentativo di salvataggio automatico, si verifica un errore. Il sistema avvisa l'utente #sym.arrow  #use-case-label(nome-etichetta: "Errore durante il salvataggio automatico").
    ],
    inclusioni:none,
    estensioni:[
        - #use-case-label(nome-etichetta: "Errore durante il salvataggio automatico").
    ],
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)