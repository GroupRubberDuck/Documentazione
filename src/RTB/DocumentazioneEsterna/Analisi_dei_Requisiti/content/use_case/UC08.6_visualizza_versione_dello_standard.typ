#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Visualizza versione dello standard"
#let depth=2
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + Il sistema recupera l'informazione sulla versione dello standard utilizzata per la verifica (es. EN 18031-1:2024)
        + L'utente visualizza  la versione dello standard associata al dispositivo
    ],
    
    pre-condizioni:[- L'utente ha creato o caricato un dispositivo nel sistema.
        - Il dispositivo è attualmente selezionato],
    
    post-condizioni:[
        - La versione dello standard è visibile all'utente.
    ],
    
    trigger:none, 
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)