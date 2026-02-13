#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Importa json"
#let use-case-level=3


#let codice=get-use-case-code(nome-etichetta: use-case-nome)


#let attore-principale="Utente"

#let scenario-principale=[
    + L'utente seleziona un file json
    + Il sistema legge il file selezionato
    + Il sistema interpreta il contenuto
    + Il sistema salva le informazioni lette
]

#let pre-condizioni=[
    - L'utente è autenticato
    - Il sistema è online
    - Il sistema ha in memoria un dispositivo su cui eseguire le verifiche
]

#let post-condizioni=[    
    - Il sistema ha caricato in memoria gli asset importati dal file
    ]


#let trigger=none

#let scenari-alternativi=none

#let inclusioni=none

#let estensioni=none

#let generalizzazioni=none

#let path-immagine-diagramma=none

#let figure-caption=none


#use-case-template(
    livello-intestazione:use-case-level,
    codice:codice,
    nome:use-case-nome,
    attore-principale:attore-principale,
    scenario-principale:scenario-principale,
    pre-condizioni:pre-condizioni,
    post-condizioni:post-condizioni,
    trigger:trigger,
    scenari-alternativi:scenari-alternativi,
    inclusioni:inclusioni,
    estensioni:estensioni,
    generalizzazioni:generalizzazioni,
    path-immagine-diagramma:path-immagine-diagramma,
    figure-caption:figure-caption,
)
