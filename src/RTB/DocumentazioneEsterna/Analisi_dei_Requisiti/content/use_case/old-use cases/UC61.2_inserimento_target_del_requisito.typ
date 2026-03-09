#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento target del requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo inserisce il target del requisito
    ],
    
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
        - Nel sistema è in corso l'aggiunta o la modifica di un requisito
    ],
    
    
    post-condizioni:[
        - Il #sudo ha inserito un target valido per il requisito
    ],
    
    
    trigger:none,
    
    scenari-alternativi:[
        - Target non valido
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
