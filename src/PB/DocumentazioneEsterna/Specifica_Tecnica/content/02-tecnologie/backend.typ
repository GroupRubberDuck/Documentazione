#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
== Backend <backend>

#let backend=(
  "Linguaggio di Programmazione":
    ([Python],[3.12.X],[
        Linguaggio interpretato scelto per la rapidità di sviluppo, l'alta leggibilità e il vasto ecosistema.
    ]),
  "Framework": 
      ([Flask],[3.1.3],[
        Micro-framework web flessibile che permette un controllo totale sull'architettura.
    ]),
  "Dipendenze principali":
    (
      ([waitress],[3.0.2],[
        Server WSGI leggero e pronto per la produzione. Gestisce la concorrenza delle richieste in modo affidabile su più sistemi operativi.]),
      ([fpdf],[],[Libreria per la generazione dinamica di documenti e reportistica in formato PDF direttamente lato server.]),
      ([pymongo],[],[Driver ufficiale per l'integrazione con MongoDB. Consente interazioni agili con il database NoSQL orientato ai documenti.]),
      ([pydantic],[],[Utilizzato, insieme a pydantic-settings, per la validazione rigida e type-safe dei dati in ingresso e delle variabili d'ambiente di sistema.]),
      ([python.dotenv],[],[Gestione semplificata delle configurazioni. Permette il caricamento dinamico a runtime dei parametri definiti nel singolo file centralizzato .env.]),
      ([],[],[]),
      ([],[],[]),
      ([],[],[]),
    ),
  "Dynamic Testing":(
      ([pytest],[],[Framework di testing adottato per la sua sintassi concisa. Utilizzato per automatizzare i "Sanity Tests" e validare l'integrazione di sistema alla radice del progetto.]),
  ),
  "Static Testing":(
      ([ruff],[],[Linter e formatter estremamente veloce (scritto in Rust). Impone e garantisce standard di codice puliti e uniformi senza rallentare lo sviluppo.]),
      ([mypy ],[],[Analizzatore statico basato sul Type Hinting. Previene i bug e gli errori di tipo a tempo di sviluppo prima ancora dell'esecuzione]),
  ),
  "Sviluppo":(
      ([poetry],[],[Gestore moderno delle dipendenze e degli ambienti virtuali (.venv). Garantisce build riproducibili tra i vari sviluppatori tramite il file di blocco (poetry.lock).]),
  ),

)




#tabella-tecnologie(caption: "Backend", 
cells:backend
)
