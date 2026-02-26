#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Aggiungi dipendenza"
#let depth=3
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
    scenario-principale:[
        + Il sistema mostra un elenco dei requisiti che possono essere aggiunti come dipendenza
        + Il #sudo seleziona uno o più requisiti da aggiungere alle dipendenze requisito da aggiungere 
        + Il sistema controlla l'assenza di dipendenze circolari
        + Il sistema salva la nuova dipendenza tra le informazioni del requisito
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sottosessione di modifca di un requisito
    ],
    
    post-condizioni:[
        - Il sistema ha registrato la nuova dipendenza per il requisito
    ],
    
    trigger:[Il #sudo seleziona l'opzione di aggiunta di una nuova dipendenza al requisito],
    
    scenari-alternativi:[
        - Dipendenza circolare
    ],
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
