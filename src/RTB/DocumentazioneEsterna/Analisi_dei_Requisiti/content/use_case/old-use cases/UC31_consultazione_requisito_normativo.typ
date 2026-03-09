#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Consultazione requisito normativo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'utente visualizza la descrizione del requisito  #sym.arrow #use-case-label(nome-etichetta:  "Visualizza descrizione del requisito")
        + Visualizza razionale del requisito #sym.arrow #use-case-label(nome-etichetta:  "Visualizza razionale del requisito")
        + Visualizza linea guida #sym.arrow #use-case-label(nome-etichetta:  "Visualizza guida")
    ],
    
    pre-condizioni:[
        - L'utente sta visualizzando un requisito
    ],
    
    post-condizioni:[
        - L'utente visualizza i dettagli normativi associati al requisito
        - L'utente può tornare alla visualizzazione del requisito su cui si trovava precedentemente
    ],
    
    trigger:[
        L'utente seleziona la funzionalità per la visione del contesto normativo di un requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:[
            - #use-case-label(nome-etichetta:  "Visualizza descrizione del requisito")
            - #use-case-label(nome-etichetta:  "Visualizza razionale del requisito")
            - #use-case-label(nome-etichetta:  "Visualizza guida")
    ],
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
