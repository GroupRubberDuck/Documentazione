=== Codifica

==== Descrizione e scopo

La codifica rappresenta la fase di implementazione del software secondo quanto definito in fase di progettazione. Durante questa attività, i programmatori traducono le specifiche architetturali e di dettaglio in codice sorgente eseguibile.

Lo scopo della codifica è:

- *Implementare le funzionalità* definite nell'Analisi dei Requisiti e nella Specifica Tecnica;

- *Garantire la qualità del codice* attraverso l'adozione di convenzioni di stile, buone pratiche di programmazione e strumenti di analisi automatica;

- *Assicurare la manutenibilità* del software mediante codice leggibile, ben strutturato e adeguatamente documentato;

- *Facilitare la testabilità* scrivendo codice modulare e disaccoppiato;

La codifica deve seguire le convenzioni e le norme definite in questo documento per garantire uniformità e coerenza nell'intero progetto.

=== Strumenti a supporto

Per lo sviluppo del software, il gruppo utilizza strumenti mirati a garantire qualità, tracciabilità e collaborazione:

- *Linguaggio e ambiente di sviluppo*: Python 3.x come linguaggio principale per le componenti software.

- *Versionamento del codice*: Git/GitHub per gestione dei repository, branch, commit, issue e pull request.

- *Formattazione e controllo del codice*: Il progetto adotta controlli automatici di qualità del codice e della documentazione tramite pipeline CI, includendo formattazione, verifica di leggibilità (indice Gulpease) e generazione automatica della documentazione.

- *Gestione attività e tracciamento*: GitHub Issues per assegnazione, monitoraggio e gestione delle modifiche.

- *Comunicazione e collaborazione interna*: Discord o WhatsApp per coordinamento rapido, aggiornamenti sullo stato di avanzamento e chiarimenti tra membri del gruppo.

- *Comunicazione verso la proponente*: email ufficiale, Zoom  per riunioni sincrone e Telegram per chiarimenti rapidi.

=== Convenzioni di stile
Per garantire di qualità dello sviluppo del codice verranno usati i seguenti criteri (i nomi delle classi e delle variabili saranno in inglese):
  - *Backend* :
    - *Variabili, attributi, funzioni e metodi*: snake_case.
    - *Classi, Data Transfer Object (DTO), Interfacce (Porte)*: PascalCase, nel caso delle interfacce si aggiunge il prefisso Interface (es. InterfaceDeviceRepository).
    - *Costanti a livello di Modulo*: UPPER_SNAKE_CASE.
  - *Frontend* :
    - *Variabili, attributi, funzioni e metodi*: camelCase.
    - *Handler di eventi*: camelCase con prefisso handle (es. handleSubmit() ).
    - *Componenti Vue*: PascalCase.
  - *Persistenza (MongoDB)* :
    - *Campi dei documenti*: snake_case (es.device_name).
    - *Nomi delle collection*: lowercase al plurale (es. devices, modules).
  - *Indentazioni* : \ I blocchi annidati del codice devono seguire un'indentazione equivalente a 2 spazi, sia nel Backend che nel Frontend.

==== Buone pratiche di programmazione

===== Principi di qualità del codice

Ogni componente del gruppo deve attenersi ai seguenti principi per 
garantire codice di qualità:

- *Riuso del codice*: sviluppare funzioni e metodi modulari che possano essere riutilizzati in diverse parti del progetto, evitando la 
  duplicazione del codice e facilitando la manutenzione;

- *Manutenibilità*: scrivere codice chiaro, leggibile e ben strutturato. I nomi di variabili, funzioni e classi devono essere significativi e auto-esplicativi. Il codice deve essere organizzato logicamente e seguire i principi di separazione delle responsabilità;

- *Efficienza*: prestare attenzione alla complessità algoritmica e alle performance, cercando di evitare soluzioni inefficienti quando esistono alternative più performanti;

- *Testabilità*: progettare il codice in modo che sia facilmente testabile, favorendo il disaccoppiamento delle dipendenze e l'uso di 
  interfacce.

===== Struttura del codice

*Lunghezza e complessità*: 
- Preferire funzioni brevi e ben definite che svolgano un singolo compito;
- Evitare funzioni eccessivamente lunghe o con logica complessa;
- Suddividere funzioni complesse in sotto-funzioni più semplici e riutilizzabili;

*Variabili globali*: evitare l'uso di variabili globali dove possibile, preferendo il passaggio esplicito di parametri e l'uso di dependency injection.

*Parametri di funzione*: gli inbound adapter costruiscono dei command object da passare ai service, in questo modo la firma rimane pulita e invariata indipendentemente dal numero di parametri.

===== Gestione degli errori

*Backend (Python)*:
- Utilizzare blocchi `try-except` per gestire eccezioni previste;
- Definire custom exceptions per errori specifici del dominio applicativo;
- Loggare errori significativi per facilitare il debugging;
- Non catturare eccezioni generiche (`except Exception`) se non strettamente necessario; preferire eccezioni specifiche.

*Frontend (JavaScript/Vue.js)*:
- Utilizzare blocchi `try-catch` per gestire errori nelle chiamate asincrone e nelle operazioni critiche;
- Fornire feedback all'utente in caso di errori (messaggi, notifiche);
- Loggare errori in console per facilitare il debugging in fase di sviluppo.

==== Formattazione e controllo qualità del codice

Il progetto adotta controlli automatici di qualità del codice attraverso strumenti di formattazione, analisi statica e pipeline CI/CD.

===== Strumenti per il backend (Python)

*Ruff* (≥0.15.12): linter e formatter per Python che sostituisce Ruff viene 
utilizzato per:
- Formattazione automatica del codice secondo lo stile PEP 8;
- Analisi statica per identificare errori comuni, code smells e violazioni di stile;
- Ordinamento automatico degli import.

*MyPy* (≥1.20.2): type checker statico per Python, utilizzato per verificare la correttezza dei type hints e identificare errori di tipo 
a tempo di sviluppo.

*Pytest* con coverage:
- `pytest-cov` (≥7.1.0): per misurare la copertura del codice da parte dei test;
- Configurato per generare report in formato HTML, XML e JSON;
- Target di copertura: branch coverage incluso.

===== Automazione tramite CI/CD

Gli strumenti di qualità del codice sono integrati nella pipeline CI/CD tramite GitHub Actions, che esegue automaticamente:

- Formattazione del codice con Ruff;
- Analisi statica del codice (Ruff, MyPy);
- Esecuzione della suite di test con report di copertura;
- Verifica della complessità del codice;
- Generazione di report HTML per la visualizzazione dei risultati.

La pipeline di CI/CD blocca il merge di Pull Request che:
- Non rispettano gli standard di formattazione;
- Contengono errori rilevati dall'analisi statica;
- Non superano i test definiti;
- Riducono significativamente la copertura del codice.

===== Esecuzione locale

Gli sviluppatori devono eseguire i controlli di qualità in locale prima di effettuare commit e push:

```bash
# Formattazione e linting
poetry run ruff check . --fix
poetry run ruff format .

# Type checking
poetry run mypy backend/src

# Test con copertura
poetry run pytest
```





