#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label, Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva modifiche sul modello"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema trascrive le modifiche apportate alla bozza sulla rappresentazione del modello all'interno del sistema di permanenza 
        + Il sistema chiude la sessione di modifica
    ],
    
    pre-condizioni:[
        - Nel sistema è in corso una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Le modifiche apportate alla bozza vengono riportate sulla rappresentazione del modello all'interno del sistema di permanenza
        - La sessione di modifica corrente è stata chiusa
    ],
    
    trigger:[
        Il #sudo seleziona la funzionalità di salvataggio delle modifiche 
    ],
    
    scenari-alternativi:[
        - Il modello non ha una rappresentazione sul sistema di permanenza
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
