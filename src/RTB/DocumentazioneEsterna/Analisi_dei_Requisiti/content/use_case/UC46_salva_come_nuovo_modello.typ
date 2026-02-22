#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Salva come nuovo modello"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema trascrive le modifiche apportate creando un nuovo modello sul sistema di permanenza
        ],
    
    pre-condizioni:[
        - Nel sistema è in corso una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Le modifiche apportate alla bozza vengono riportate nel sistema di permanenza come nuovo modello
        - La sessione di modifica corrente è stata chiusa
    ],
    
    trigger:[
        Il #sudo seleziona la funzionalità di salvataggio delle modifiche come nuovo modello
    ],
    
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
