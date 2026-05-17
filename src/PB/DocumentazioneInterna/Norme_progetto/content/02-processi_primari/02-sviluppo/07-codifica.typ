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






