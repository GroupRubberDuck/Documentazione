#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza lista asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Per ogni asset del dispositivo
            + L'utente vede le informazioni dell'asset #sym.arrow Vedi #use-case-label(nome-etichetta: "Visualizza asset singolo")
        + L'utente vede un riepilogo dei requisiti legati agli asset 
    ],
    
    pre-condizioni:[
        - Il sistema è attivo 
        - Il sistema ha avviato il processo di valutazione di un dispositivo
        - L'utente è autenticato
        ],
    
    post-condizioni:[
        - L'utente visualizza la lista degli asset
        - L'utente può selezionare un asset per la modifica
        - L'utente può selezionare un asset per l'eliminazione
        - L'utente può aggiungere un'asset
    ],
    
    trigger:[
        - L'utente seleziona la visualizzazione della lista degli asset
    ],
    
    scenari-alternativi:[
        - Lista vuota
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
