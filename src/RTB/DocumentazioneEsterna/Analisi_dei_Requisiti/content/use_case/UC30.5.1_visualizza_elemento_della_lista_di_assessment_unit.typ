#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza elemento della lista di assessment unit"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza il codice dell'assessment unit  #sym.arrow #use-case-label(nome-etichetta: "visualizza codice di una assessment unit")
        + L'utente visualizza il nome dell'assessment unit #sym.arrow #use-case-label(nome-etichetta: "visualizza nome di una assessment unit")
        + L'utente visualizza lo stato della valutazione #sym.arrow #use-case-label(nome-etichetta: "Visualizza stato della valutazione assessment unit")

    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un requisito

    ],
    
    post-condizioni:[
        - L'utente vede le informazioni generiche dell'elemento della lista
        - L'utente può visualizzare il dettaglio dell'assessment unit
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
