#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza lista di assessment unit"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema legge il target del requisito
        + Il sistema estrae le assessment unit corrispondenti dall'asset
        + Il sistema organizza le assessment unit in una lista
        + Per ogni assessment unit nella lista
            + L'utente visualizza un riepilogo dell'assessment unit #use-case-label(nome-etichetta: "Visualizza elemento della lista di assessment unit")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un requisito
    ],
    
    post-condizioni:[
        - L'utente visualizza la lista di assessment unit
        - L'utente può selezionare un'assessment unit per la visualizzazione in dettaglio
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Il target del requisito è l'asset
        - Lista di assessment unit vuota
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
