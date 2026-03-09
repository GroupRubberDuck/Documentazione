#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Crea nuovo modello"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo inserisce nome del modello
        + Il #sudo inserisce codice del modello
        + Il #sudo conferma la creazione
        + Il sistema genera una nuova bozza vuota in memoria associata ai dati inseriti e che funge da area di lavoro
        + Il sistema trasferisce il controllo all'interfaccia di modifica
        + Il sistema inizializza la *sessione di modifica*
    ],
    
    pre-condizioni:[
        - Il #sudo è autenticato
        - Il sistema non ha in esecuzione nessuna sessione di modifica del modello

    ],
    
    post-condizioni:[
        - Il sistema ha creato la bozza del nuovo modello
        - Il sistema ha avviato la sessione di modifica della nuova bozza
    ],
    
    trigger:[
        Il #sudo ha selezionato la funzionalità di aggiunta e compilazione manuale di un nuovo modello
    ],
    
    scenari-alternativi:[
        - Annullamento, il #sudo annulla la creazione del nuovo modello
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
