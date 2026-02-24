#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza funzionalita dispositivo"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
  scenario-principale:[
        + Il sistema recupera le funzionalità principali descritte per il dispositivo
        +  L'utente visualizza la funzionalità del dispositivo
    ],
    pre-condizioni: [L'utente ha creato o caricato un dispositivo nel sistema.
        - Il dispositivo è attualmente selezionato],
    post-condizioni:[Le funzionalità sono visibili all'utente],
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,
)