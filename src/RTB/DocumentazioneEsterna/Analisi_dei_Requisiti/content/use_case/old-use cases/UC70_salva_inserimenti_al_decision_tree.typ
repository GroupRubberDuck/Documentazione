#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label, sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva inserimenti al decision tree"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema applica le modifiche al decision tree
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sottosessione di gestione dei decision tree
    ],
    
    post-condizioni:[
        - Il sistema salva i dati sulla bozza operativa
        - Il sistema  chiude la sottosessione di gestione del decision tree
    ],
    
    trigger:[
        Il #sudo seleziona la funzionalità di salvataggio dei dati
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
