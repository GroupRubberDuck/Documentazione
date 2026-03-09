#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Modifica anagrafica"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema recupera i dati attuali (Nome, Codice, Descrizione) associati alla classe di asset dalla bozza operativa.
        + Il sistema presenta un modulo precompilato con i dati letti.
        + Inserisci nuovo nome
        + Inserisci nuovo codice
        + Inserisci nuova descrizione
        + Il #lower(sudo) conferma il salvataggio dei dati.
        + Il sistema convalida le modifiche e aggiorna i dati anagrafici della classe di asset  all'interno della bozza operativa.
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sotto-sessione di modifica per la specifica classe di asset.    ],
    
post-condizioni:[
        - La bozza operativa è aggiornata con i nuovi dati anagrafici della classe.
        - I requisiti che hanno come Target una classe di asset continuano ad avere target validi.
    ],
    
    trigger:[
        Il #sudo seleziona la funzionalità di modifica dell'anagrafica
        ],
    
    scenari-alternativi:[
        - Modifica della chiave identificativa dell'asset 
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
