#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Autenticazione"
#let use-case-level=3


#let codice=get-use-case-code(nome-etichetta: use-case-nome)


#let attore-principale="Utente"

#let scenario-principale=[
      + L'utente seleziona la funzionalità di autenticazione
      + L'utente inserisce il suo username #sym.arrow  #use-case-label(nome-etichetta: "Inserimento username",codice: "UC-01.1")
      + L'utente inserisce la sua password #sym.arrow #use-case-label(nome-etichetta: "Inserimento password",codice: "UC-01.2")
      + Il sistema valida le credenziali
      + L'utente accede alla piattaforma con i privilegi assegnati
    ]

#let pre-condizioni=[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      ]

#let post-condizioni=[
      - L'utente è autenticato
      ]

#let trigger=[L'utente accede alla piattaforma;]

#let scenari-alternativi=[
      - Errore nell'autenticazione #use-case-label(nome-etichetta: "Errore autenticazione",codice: "UC-02") 
      ]

#let inclusioni=[
      - #use-case-label(nome-etichetta: "Inserimento username",codice: "UC-01.1")
      - #use-case-label(nome-etichetta: "Inserimento password",codice: "UC-01.2")
]

#let estensioni=[- #use-case-label(nome-etichetta: "Errore autenticazione",codice: "UC-02")]

#let generalizzazioni=none

#let path-immagine-diagramma="/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC1.drawio.png"

#let figure-caption=get-use-case-code(nome-etichetta: use-case-nome)


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
