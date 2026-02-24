#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Avviso cambio versione standard"
#let depth=1
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
     attore-principale:"Utente", 
    
    scenario-principale:[
        + L'utente modifica il campo relativo alla versione dello standard
        + Il Sistema rileva la modifica 
        + L'Utente visualizza un messaggio di avviso indicando che la modifica potrebbe invalidare le verifiche già effettuate 
        + Il Sistema richiede una conferma esplicita per procedere con la modifica 
        + L'Utente conferma di voler mantenere la nuova versione dello standard
    ],
    
    pre-condizioni:[
        - L'Utente sta modificando i dati di un dispositivo esistente.
        - È stata selezionata una versione dello standard diversa da quella precedentemente salvata.
    ],
    
    post-condizioni:[
        - La nuova versione dello standard è accettata e pronta per il salvataggio.
    ],
    
    trigger:[
        Tentativo di modifica del campo "Versione dello standard" o salvataggio con valore modificato.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)

