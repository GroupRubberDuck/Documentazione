#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica anagrafica del modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema mostra i dati anagrafici attuali del modello
        + Inserisci codice del modello
        + Inserisci nome del modello
        + Il #lower(sudo) conferma le modifiche
        + Il sistema aggiorna la bozza del modello nella sessione corrente
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica
    ],
    
    post-condizioni:[
        - Il sistema ha registrato le modifiche apportate
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
