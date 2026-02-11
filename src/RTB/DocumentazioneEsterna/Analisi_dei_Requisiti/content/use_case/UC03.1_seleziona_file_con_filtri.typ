#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Seleziona file con filtri"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
    + Il sistema configura i filtri di estensione
    + Il sistema apre l'interfaccia di selezione dei file con applicato il filtro
    + L'utente seleziona uno o più file dal file system locale
    + Il sistema legge i path assoluti
],
    
    pre-condizioni:[
    - Il sistema è online
    - L'utente vuole selezionare uno o più file dal file system locale
    - Sono state specificate una o più estensioni permesse
],
    
    post-condizioni:[
    - L'utente ha selezionato uno o più file con le estensioni specificate
    - Il sistema ha acquisito dei riferimenti ai file
] ,
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
