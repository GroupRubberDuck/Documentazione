#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Annulla modifica alla classe asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        - Il sistema scarta le modifiche apportate
        - Il sistema chiude la sottosessione di modifica della classe di asset
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sotto-sessione di modifica per una specifica classe di asset.

    ],
    
    post-condizioni:[
        - Il sistema ritorna nello stato precedente all'apertura della sessione di modifica
        - Il sistema ha chiuso la sottosessione di modifica della classe asset
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
