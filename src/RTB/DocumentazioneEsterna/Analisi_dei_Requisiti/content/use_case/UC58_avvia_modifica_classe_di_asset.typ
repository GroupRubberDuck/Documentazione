#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avvia modifica classe di asset"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
scenario-principale:[
        + Il sistema recupera i dati correnti (anagrafica e attributi) della classe di asset selezionata dalla bozza del modello.
        + Il sistema inizializza una sotto-sessione operativa dedicata esclusivamente a tale classe.
        + Il sistema mostra l'interfaccia di dettaglio della classe precompilata con i dati correnti
    ],
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Nel sistema è attiva una sotto-sessione di modifica di una classe di asset
    ],
    
    trigger:[
        L'utente seleziona un classe di asset per la modifica
    ],
    
scenari-alternativi:[
        - Errore di recupero dati
    ],    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
