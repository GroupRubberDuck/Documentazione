#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserisci descrizione di una classe di asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
scenario-principale:[
        + Il #lower(sudo) inserisce la descrizione della classe di asset
        + Il sistema memorizza il dato nella bozza della sessione in corso.
    ],
    
pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica di un modello.
        - È in corso una procedura di aggiunta o modifica di una classe di asset che richiede questo input.
    ],
    post-condizioni:[
        - Il sistema ha memorizzato la descrizione della classe di asset inserito dal #sudo
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
