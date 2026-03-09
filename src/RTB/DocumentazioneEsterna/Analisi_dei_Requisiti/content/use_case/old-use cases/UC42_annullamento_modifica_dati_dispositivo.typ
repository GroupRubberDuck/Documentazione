#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Annullamento modifica dati dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
  attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente seleziona la funzionalità di annullamento durante la modifica dei dati 
        + L'Utente conferma l'intenzione di annullare l'operazione 
        + Il Sistema scarta le modifiche inserite 
        + Il Sistema interrompe la procedura di modifica 
        + Il Sistema ritorna alla visualizzazione del dispositivo inserito
    ],
    
    pre-condizioni:[
        - L'Utente sta modificando i dati di un dispositivo.
    ],
    
    post-condizioni:[
        - Il Sistema annulla il procedimento di modifica dei dati del dispositivo .
        - Nessuna informazione è stata aggiornata nel sistema di permanenza.
    ],
    
    trigger:[
        L'Utente seleziona la funzionalità di annullamento nella modifica dei dati di un dispositivo.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)

