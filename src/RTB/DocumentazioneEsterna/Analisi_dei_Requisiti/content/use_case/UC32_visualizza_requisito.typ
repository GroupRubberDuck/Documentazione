#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza requisito"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza le informazioni identificative dell'asset in valutazione  #sym.arrow #use-case-label(nome-etichetta: "visualizza l'asset di appartenenza")
        + L'utente visualizza il codice del requisito #sym.arrow #use-case-label(nome-etichetta: "visualizza codice del requisito")
        + L'utente visualizza il nome del requisito #sym.arrow #use-case-label(nome-etichetta: "visualizza nome del requisito")
        + L'utente visualizza lo stato aggregato del requisito #sym.arrow #use-case-label(nome-etichetta: "visualizza stato aggregato del requisito")
        + Visualizza la lista delle assessment unit #sym.arrow #use-case-label(nome-etichetta: "Visualizza lista di assessment unit")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un asset
    ],
    
    post-condizioni:[
        - L'utente visualizza il requisito e le informazioni associate
        - L'utente può visualizzare il contesto normativo
    ],
    
    trigger:[
        L'utente ha selezionato un requisito per la visualizzazione
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
