#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Importa file asset singolo"
#let depth=1
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
    + Il sistema legge il file selezionato.
    + Il sistema identifica il formato del file.
    + Il sistema interpreta il contenuto ed estrae le informazioni dell'asset.
    + Il sistema valida la struttura dei dati estratti.
    + Il sistema salva temporaneamente le informazioni lette per il successivo merge.

    ],
    pre-condizioni:[
    - Il sistema è online.
    - Il sistema ha in memoria un dispositivo su cui eseguire le valutazioni.
    - L'utente ha selezionato l'importazione di un asset o una lista di asset.
    ],
    post-condizioni:[
         - Gli asset del singolo file sono pronti per il merge.
    ],
    trigger:[
        L'utente ha selezionato la funzionalità di importazione degli asset.
    ],
    scenari-alternativi:[
        *Errore importazione*: avviene un errore nel caricamento, il formato non è supportato o la struttura non è valida (vedi UC08).
],
    inclusioni:none,
    estensioni:[
        - UC08: Errore importazione file asset.
    ],
    generalizzazioni:[ 
    - UC07.1: Importa json.
    - UC07.2: Importa xml.
    - UC07.3: Importa csv.],
    path-immagine-diagramma:none,
    figure-caption:none,
)