#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Seleziona file"
#let use-case-level=1+2


#let codice=get-use-case-code(nome-etichetta: use-case-nome)


#let attore-principale="Utente"

#let scenario-principale=[
    + L'utente seleziona uno o più file dal file system locale
    + Il sistema acquisisce il percorso assoluto
]

#let pre-condizioni=[
    - Il sistema è online
    - Il sistema ha accesso al filesystem locale
    - #upper("è") stato richiesto l'input di uno o più file
]

#let post-condizioni=[
    - L'utente ha selezionato uno o più file dal file system locale
    - Il sistema ha memorizzato i path dei file selezionati
    - L'utente vede un messaggio di conferma
] 

#let trigger=[#upper("è") stata selezionata la funzionalità di selezione dei file]

#let scenari-alternativi=[
    - L'utente annulla l'importazione #sym.arrow Vedi #use-case-label(nome-etichetta: "Annulla selezione")
    - Errore nella selezione #sym.arrow Vedi #use-case-label(nome-etichetta: "Errore nella selezione")
]

#let inclusioni=none

#let estensioni=[
    - #use-case-label(nome-etichetta: "Annulla selezione")
    - #use-case-label(nome-etichetta: "Errore nella selezione")
]

#let generalizzazioni=[
    - #use-case-label(nome-etichetta: "seleziona file con filtri")
    - #use-case-label(nome-etichetta: "selezione con drag and drop")
]

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
