#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,sudo,Sudo
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Definisci attributo della classe"
#let depth=2
#use-case-template(
    nome: use-case-nome,
    livello-intestazione: depth+2,
    codice: get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale: Sudo,
    
    scenario-principale:[
        + Il sistema presenta il modulo per la definizione di un nuovo attributo per la classe di asset corrente.
        + Il #lower(sudo) inserisce il codice identificativo.
        + Il #lower(sudo) inserisce il nome.
        + Il #lower(sudo) seleziona il tipo di dato.
        + Il #lower(sudo) definisce l'obbligatorietà del campo in fase di creazione dell'asset concreto
        + Il #lower(sudo) seleziona un altro attributo esistente come "Padre" (per creare una gerarchia).
        + Il #lower(sudo) conferma la creazione.
        + Il sistema verifica che il Codice inserito sia univoco tra gli attributi di questa specifica classe.
        + Il sistema salva il nuovo attributo nella bozza operativa della classe di asset e aggiorna l'albero visivo degli attributi.
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva la sotto-sessione di modifica per una specifica classe di asset.
    ],
    
    post-condizioni:[
        - Un nuovo attributo ammissibile è stato aggiunto alla definizione della classe di asset nella bozza corrente.
    ],
    
    trigger:[
        Il #lower(sudo) seleziona l'opzione "Aggiungi nuovo attributo" nell'editor della classe di asset.
    ],
    
    scenari-alternativi:[
        - *Codice attributo non univoco:* Al passo 7, il sistema rileva che il Codice è già in uso per un altro attributo di questa classe. Il sistema blocca il salvataggio e richiede l'inserimento di un Codice differente.
        - *Annullamento:* Il #lower(sudo) scarta l'inserimento prima della conferma; il sistema chiude il modulo senza alterare la bozza.
    ],
    
    inclusioni: none,
    
    estensioni: none,
    
    generalizzazioni: none,
    
    path-immagine-diagramma: none,
    
    figure-caption: none,
)