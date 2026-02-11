#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code



#let use-case-nome="Importa csv"
#let use-case-level=3


#let codice=get-use-case-code(nome-etichetta: use-case-nome)


#let attore-principale=none

#let scenario-principale=none

#let pre-condizioni=none

#let post-condizioni=none

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
