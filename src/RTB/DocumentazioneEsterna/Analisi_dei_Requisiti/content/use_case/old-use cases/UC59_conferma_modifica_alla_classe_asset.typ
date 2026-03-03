#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label, Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Conferma modifica alla classe asset"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema salva le modifiche sulla bozza operativa
        + Il sistema chiude la sottosessione di modifica della classe di asset
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sottosessione di modifica della classe di asset
    ],
    
    post-condizioni:[
        - Il sistema ha salvato le modifiche apportate dall'utente sulla bozza operativa
        - Il sistema ha chiuso la sottosessione di modifica della classe di asset
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di salvataggio delle modifiche della classe di asset
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
