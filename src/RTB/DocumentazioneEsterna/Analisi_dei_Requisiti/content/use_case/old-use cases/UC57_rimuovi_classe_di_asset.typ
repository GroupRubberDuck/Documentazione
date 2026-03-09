#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label,Sudo, sudo

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":format-code,get-use-case-code

#let use-case-nome="Rimuovi classe di asset"
#let depth=deps.get-uc-depth(nome-etichetta: use-case-nome)
#use-case-template(
    
    nome: use-case-nome,
    
    livello-intestazione:depth+2,
    
    codice:get-use-case-code(nome-etichetta: use-case-nome),
    
    attore-principale:Sudo,
    
scenario-principale:[
        + Il sistema richiede la conferma per procedere con l'eliminazione della classe di asset selezionata.
        + Il #lower(sudo) conferma la volontà di eliminare la classe.
        + Il sistema verifica se la classe di asset è attualmente impostata come Target in uno o più Requisiti del modello.
        + Il sistema rimuove la classe di asset e i suoi attributi ammissibili dalla bozza operativa.
        + Il sistema aggiorna l'interfaccia rimuovendo l'elemento visivo.
    ],
    
    pre-condizioni:[
        - Nel sistema è attiva una sessione di modifica del modello
    ],
    
    post-condizioni:[
        - Il sistema ha eliminato la classe di asset selezionata dalla bozza operativa
    ],
    
    trigger:[
        L'utente seleziona un asset per la rimozione
    ],
    
scenari-alternativi:[
        - *Annullamento:* Al passo 2, il #lower(sudo) rifiuta l'eliminazione. Il sistema annulla l'operazione e chiude la richiesta di conferma.
    ],    
    inclusioni:none,
    
estensioni:[
        - *UC Riassegna Target Requisiti*
    ],    
    generalizzazioni:none,
    
    path-immagine-diagramma:none,
    
    figure-caption:none,
)
