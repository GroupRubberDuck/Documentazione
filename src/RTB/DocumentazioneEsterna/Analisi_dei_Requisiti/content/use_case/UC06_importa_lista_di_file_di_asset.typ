#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Importa lista di file di asset"
#let depth=1
#use-case-template(
    nome: use-case-nome,
    livello-intestazione:depth+2,
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    attore-principale:"Utente",
    scenario-principale:[
        + L'utente seleziona uno o più file da importare (supportati: JSON, XML, CSV).
    + Per ogni file selezionato:
        + Il sistema esegue l'importazione del singolo asset
        + Il sistema registra l'esito dell'importazione (successo o fallimento).
    + Il sistema normalizza e riconcilia gli asset provenienti da fonti diverse creando un modello unico del dispositivo.
    + Il sistema mostra un riepilogo dell'operazione 

    ],
    pre-condizioni:[
    - Il sistema è online.
    - Il sistema ha in memoria un dispositivo su cui eseguire le verifiche.
    ],
    post-condizioni:[
        - Gli asset validi contenuti nei file sono caricati nella memoria del sistema.
    ],
    trigger:[
        L'utente ha selezionato la funzionalità di importazione degli asset.
    ],
    scenari-alternativi:[
        - *Conflitto di merge*: Durante l'unione dei dati, il sistema rileva conflitti (vedi UC10).
    ],
    inclusioni:[
    - Importa file asset singolo (vedi UC07).
    - Visualizza riepilogo di importazione (vedi UC09).],
    estensioni:[
        - UC10: Errore conflitto merge asset.
    ],
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)