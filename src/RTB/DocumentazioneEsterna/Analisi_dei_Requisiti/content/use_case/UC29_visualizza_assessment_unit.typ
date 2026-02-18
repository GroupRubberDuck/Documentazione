#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza assessment unit"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza l'asset di appartenenza  #use-case-label(nome-etichetta: "Visualizza contesto di una assessment unit")
        + L'utente visualizza l'asset di appartenenza  #use-case-label(nome-etichetta: "visualizza l'asset di appartenenza")
        + L'utente visualizza il codice dell'assessment unit #use-case-label(nome-etichetta: "visualizza codice di una assessment unit")
        + L'utente visualizza il tipo dell'assessment unit #use-case-label(nome-etichetta: "visualizza tipo di una assessment unit")
        + L'utente visualizza la descrizione dell'assessment unit #use-case-label(nome-etichetta: "visualizza nome di una assessment unit")
        + L'utente visualizza lo stato della valutazione #use-case-label(nome-etichetta: "visualizza stato della valutazione assessment unit")
        + L'utente visualizza graficamente il decision tree associato #use-case-label(nome-etichetta: "Visualizza decision tree graficamente")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un requisito
    ],
    
    post-condizioni:[
        - L'utente può gestire la valutazione del decision tree associato
    ],
    
    trigger:[
        L'utente ha selezionato la funzionalità di visualizzazione di un assessment unit
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
