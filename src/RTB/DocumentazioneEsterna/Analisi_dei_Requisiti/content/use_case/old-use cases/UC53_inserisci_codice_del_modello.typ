#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserisci codice del modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo inserisce il codice del modello
        + Il sistema verifica la validità del codice
    ],
    
    pre-condizioni:[
        - Il #sudo sta creando o modificando un modello
    ],
    
    post-condizioni:[
        - Il sistema ha registrato l'inserimento del codice del modello
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Codice del modello non unico
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
