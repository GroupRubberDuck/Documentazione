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
      ([Fpdf2],[2.8.7],[Libreria per la generazione dinamica di documenti e reportistica in formato PDF direttamente lato server.]),
      ([Pymongo],[4.17.0],[Driver ufficiale per l'integrazione con MongoDB.]),
      ([Pydantic],[2.13.3],[Utilizzato per la validazione rigida e type-safe dei dati in ingresso e delle variabili d'ambiente di sistema.]),
      ([Python-dotenv],[1.2.2],[Gestione semplificata delle configurazioni e delle variabili d'ambiente.]),
      ([Jinja2],[3.1.2],[Template engine HTML con un'ottima integrazione con Flask.]),
      ([Werkzeug],[3.1.8],[Server di sviluppo locale.]),
      ([Watchdog],[2.3.X],[Permette l'hot reloading durante lo sviluppo locale, passando le modifiche al server di sviluppo senza necessità di riavvio e preservando lo stato dell'applicazione.]),
    ),
  "Dynamic Testing":(
      ([Pytest],[8.4.2],[Framework di testing adottato per la sua sintassi concisa. Utilizzato per automatizzare i "Sanity Tests" e validare l'integrazione di sistema alla radice del progetto.]),
      ([Pytest-cov],[7.1.0],[Estensione di Pytest per la misurazione della Code Coverage.]),
      ([Pytest-html],[4.2.0],[Plugin per generare report visivi dei test in formato HTML self-contained, utili per la documentazione delle run di sistema.]),
      ([Pytest-json-report],[1.5.0],[Estensione per esportare i risultati dei test in formato JSON, facilitando l'integrazione con pipeline CI/CD o tool di analisi custom.]),
      ([Pytest-mock],[3.15.1],[Wrapper per la libreria 'unittest.mock' nativa di Python. Semplifica la creazione di mock, stub e spy durante i test unitari.]),
      ([Mongomock],[4.1.2],[Libreria per effettuare il mocking del database MongoDB. Permette di eseguire test di integrazione in memoria senza la necessità di sollevare un'istanza reale del database.]),
  ),
  "Static Testing":(
      ([Ruff],[0.15.12],[Linter e formatter estremamente veloce (scritto in Rust). Impone e garantisce standard di codice puliti e uniformi senza rallentare lo sviluppo.]),
      ([Mypy],[1.20.2],[Analizzatore statico basato sul Type Hinting. Previene i bug e gli errori di tipo a tempo di sviluppo prima ancora dell'esecuzione]),
    ([Radon],[6.0.0],[Strumento di analisi statica del codice utilizzato per calcolare metriche del software come la complessità ciclomatica e l'indice di manutenibilità.]),
  ),
  "Sviluppo":(
      ([Poetry],[2.3.4],[Gestore moderno delle dipendenze e degli ambienti virtuali (.venv). Garantisce build riproducibili tra i vari sviluppatori tramite il file di blocco (poetry.lock).]),
  ),

)




#tabella-tecnologie(caption: "Backend", 
cells:backend
)
