#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Aggiungi nuovo requisito"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il #sudo inserisce l'anagrafica del requisito
        + Il #sudo inserisce il target del requisito
        + Il sistema inserisce "nessuna dipendenza" nel campo dipendenze
        + Il sistema genera un decision tree con root vuota
        + Il sistema crea il requisito
        + Il #sudo visualizza il requisito inserito
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Il sistema registra il nuovo requisito
        - Il #sudo visualizza il requisito inserito
    ],
    
    trigger:[
        L'utente seleziona la funzionalità di aggiunta di un nuovo requisito
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
