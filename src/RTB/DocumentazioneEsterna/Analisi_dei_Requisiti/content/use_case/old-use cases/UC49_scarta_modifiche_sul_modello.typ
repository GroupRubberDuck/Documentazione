#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo,sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Scarta modifiche sul modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema scarta la bozza di modifica del modello
        + Il sistema chiude la sessione di modifica del modello
    ],
    
    pre-condizioni:[
        + Nel sistema è in corso una sessione di modifica del modello
    ],
    
    post-condizioni:[
        + Il sistema ha chiuso la sessione di modifica del modello corrente
        + Il sistema non ha modificato rappresentazioni sul sistema di permanenza
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
