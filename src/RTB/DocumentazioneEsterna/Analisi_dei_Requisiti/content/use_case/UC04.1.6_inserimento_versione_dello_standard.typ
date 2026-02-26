#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Inserimento versione dello standard"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente seleziona la versione dello standard da utilizzare per la verifica (es. EN 18031-1:2024) dall'elenco disponibile o la inserisce manualmente
        + Il Sistema memorizza la versione associata al dispositivo
    ],
    
    pre-condizioni:[La procedura di creazione dispositivo è attiva],
    
    post-condizioni:[
        - La versione dello standard è impostata per il dispositivo corrente.
    ],
    
    trigger:none,
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)