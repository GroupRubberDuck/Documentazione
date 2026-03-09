#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserisci nome di una classe di asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
scenario-principale:[
        + Il #lower(sudo) inserisce il nome della classe di asset.
        + Il sistema verifica l'unicità del nome inserito rispetto alle altre classi di asset già presenti all'interno del modello corrente.
        + Il sistema memorizza il dato nella bozza della sessione in corso.
    ],
    
pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica di un modello.
        - È in corso una procedura di aggiunta o modifica di una classe di asset che richiede questo input.
    ],
    post-condizioni:[
        - Il sistema ha memorizzato il nome della classe di asset inserito dal #sudo
    ],
    
    trigger:none,
    
    scenari-alternativi:[
        - *Nome non unico*: Il nome della classe di asset inserito dal #sudo non è unico all'interno del modello
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
