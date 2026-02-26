#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Errore autenticazione"
#let use-case-level=3


#let codice=get-use-case-code(nome-etichetta: "Errore autenticazione")


#let attore-principale="Utente"

#let scenario-principale=[
    - Il sistema non trova lo username o rileva che la password è errata
]

#let pre-condizioni=[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      - L'utente ha inserito uno username non valido o una password errata
      ]

#let post-condizioni=[L'utente visualizza un messaggio di errore 'Username o password errata']

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
