L'applicazione adotta una strategia di gestione degli errori stratificata. Le eccezioni non attraversano liberamente i confini architetturali, vengono invece intercettate, contestualizzate e tradotte man mano che si propagano dai livelli più profondi verso l'esterno.
Per garantire chiarezza d'intenti e manutenibilità del codice, l'implementazione si basa su una netta distinzione semantica definita dai suffissi delle classi:

- *Suffisso `*Error` (Livello di Dominio e Infrastruttura):* Viene utilizzato all'interno del Domain Layer (ereditando da una classe base `DomainError`) per segnalare la violazione di regole di business, oppure negli Outbound Adapter per segnalare problemi di interazione con risorse esterne o fallimenti infrastrutturali.
- *Suffisso `*Failure` (Livello Applicativo / Casi d'Uso):* Identifica il fallimento di un intero flusso di lavoro orchestrato da un *Application Service*. Queste eccezioni descrivono l'impossibilità di portare a termine un'operazione dal punto di vista dell'utente o del sistema chiamante.

=== Il Flusso di Traduzione degli Errori (Exception Mapping)

L'intento di questa gestione degli errori è di evitare che dettagli tecnici (come l'uso specifico di MongoDB) inquinino i livelli superiori. Il meccanismo di propagazione si articola in tre fasi:

1. *Adattatori di Output (Infrastruttura):* Sollevano eccezioni custom di tipo `Error` per segnalare l'impossibilità di completare un'operazione di propria competenza. Questo avviene sia intercettando e traducendo errori generati da librerie di terze parti (es. eccezioni dei driver del database), sia generandole direttamente in base alla logica interna dell'adapter (es. risorse non trovate in un sistema di cache in memoria).
2. *Application Services (Casi d'Uso):* Durante l'orchestrazione, intercettano le eccezioni `Error` provenienti dal dominio o dai repository e le sollevano nuovamente (wrapping) traducendole in eccezioni di tipo `Failure`, aggiungendo il contesto specifico dell'operazione in corso.
3. *Adattatori di Input (Controller):* Comunicano esclusivamente con i Service, ricevendo solo eccezioni `Failure`. Il loro unico compito è mappare questi fallimenti nei corretti codici di stato del protocollo di comunicazione (es. HTTP 400 Bad Request, 404 Not Found, 409 Conflict), restituendo al client messaggi chiari e sicuri.