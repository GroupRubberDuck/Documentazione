#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserisci nome del modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo inserisce il nome del modello
        + Il sistema controlla l'unicità del nome del modello
    ],
    
    pre-condizioni:[
        - Il sistema sta mostrando un modulo di inserimento dei dati anagrafici
    ],
    
    post-condizioni:[
        - Il sistema ha registrato l'inserimento del nome del modello
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - Nome del modello non unico
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
