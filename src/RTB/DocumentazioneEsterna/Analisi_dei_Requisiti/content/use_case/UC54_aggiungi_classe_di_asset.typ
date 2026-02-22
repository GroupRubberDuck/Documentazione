#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Aggiungi classe di asset"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
+ Il sistema presenta il modulo di inserimento per la nuova classe di asset.
        + Il #lower(sudo) compila i campi anagrafici.
            + Il #lower(sudo) inserisce il nome della classe di asset
            + Il #lower(sudo) inserisce il nome della codice di asset
            + Il #lower(sudo) inserisce il nome della descrizione di asset
        + Il #lower(sudo) conferma l'aggiunta della classe.
        + Il sistema verifica che il Codice e il Nome siano univoci all'interno del modello normativo corrente.
        + Il sistema memorizza temporaneamente i dati descrittivi nella bozza del modello.
        + Il sistema avvia automaticamente una "Sessione di gestione attributi" per la classe appena creata e trasferisce il controllo alla relativa interfaccia.
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una Sessione di Modifica del modello.    ],
    
    post-condizioni:[
        - I dati anagrafici della nuova classe di asset sono aggiunti alla bozza del modello.
        - È attiva una sotto-sessione per la configurazione degli attributi ammissibili della classe.
    ],
    
    trigger:[
    Il #lower(sudo) seleziona la funzionalità per aggiungere una nuova classe di asset dall'interfaccia del modello.    ],
    
    scenari-alternativi:[
    - *Annullamento:* Il #lower(sudo) annulla l'operazione prima della conferma; il sistema scarta i dati inseriti e chiude il modulo.
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
