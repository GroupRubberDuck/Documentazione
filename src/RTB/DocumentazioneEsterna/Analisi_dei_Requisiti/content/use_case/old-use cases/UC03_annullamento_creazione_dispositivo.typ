#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Annullamento creazione dispositivo"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
   attore-principale:"Utente",
    
    scenario-principale:[
        + L'Utente seleziona il bottone di annullamento durante il processo di creazione
        + L'Utente conferma l'intenzione di annullare l'operazione
        + Il Sistema elimina i dati temporanei del dispositivo e/o degli asset già immessi
        + Il Sistema interrompe il procedimento di creazione
        + Il Sistema riporta l'Utente allo stato iniziale
    ],
    
    pre-condizioni:[
        - L'Utente sta effettuando la creazione manuale di un nuovo dispositivo.
    ],
    
    post-condizioni:[
        - Nessun nuovo dispositivo è stato registrato nel sistema.
        - Tutte le informazioni parzialmente inserite sono state scartate.
        - L'interfaccia di creazione viene chiusa.
    ],
    
    trigger:[
        L'Utente preme il bottone di annullamento nell'interfaccia di creazione.
    ],
    
    scenari-alternativi:none,
    
    inclusioni:none,
    
    estensioni:none,
    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
