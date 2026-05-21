#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
== Backend <backend>

#let backend=(
  "Linguaggio di Programmazione":
    ([Python],[3.12.X],[
        Linguaggio interpretato scelto per la rapidità di sviluppo, l'alta leggibilità e il vasto ecosistema.
    ]),
  "Framework Principale": 
      ([Flask],[3.1.3],[
        Micro-framework web utilizzato come infrastruttura principale di backend. Consente una gestione flessibile e leggera del routing per esporre le interfacce API.
        Buona documentazione e possibilità di confronto tecnico con la proponente.
    ]),
  "Dipendenze principali":
    (
      ([Waitress],[3.0.2],[
        Server WSGI leggero. \ Gestisce la concorrenza delle richieste in modo affidabile.]),
      ([Fpdf],[],[Libreria per la generazione dinamica di documenti e reportistica in formato PDF direttamente lato server.]),
      ([Pymongo],[],[Driver ufficiale per l'integrazione con MongoDB.]),
      ([Pydantic],[],[Utilizzato per la validazione rigida e type-safe dei dati in ingresso e delle variabili d'ambiente di sistema.]),
      ([Python-dotenv],[],[Gestione semplificata delle configurazioni e delle variabili d'ambiente.]),
      ([Jinja2],[],[Template engine HTML con un'ottima integrazione con Flask.]),
      ([Werkzeug],[],[Server di sviluppo locale.]),
      ([Watchdog],[],[Permette l'hot reloading, passando le modifiche al server di sviluppo senza necessità di riavvio e preservando lo stato dell'applicazione.]),
    ),
  "Dynamic Testing":(
      ([Pytest],[],[Framework di testing adottato per la sua sintassi concisa. Utilizzato per automatizzare i "Sanity Tests" e validare l'integrazione di sistema alla radice del progetto.]),
  ),
  "Static Testing":(
      ([Ruff],[],[Linter e formatter estremamente veloce (scritto in Rust). Impone e garantisce standard di codice puliti e uniformi senza rallentare lo sviluppo.]),
      ([Mypy],[],[Analizzatore statico basato sul Type Hinting. Previene i bug e gli errori di tipo a tempo di sviluppo prima ancora dell'esecuzione]),
  ),
  "Sviluppo":(
      ([Poetry],[],[Gestore moderno delle dipendenze e degli ambienti virtuali (.venv). Garantisce build riproducibili tra i vari sviluppatori tramite il file di blocco (poetry.lock).]),
  ),

)




#tabella-tecnologie(caption: "Backend", 
cells:backend
)
