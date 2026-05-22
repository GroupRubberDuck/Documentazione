=== Progettazione

==== Descrizione e scopo

La progettazione rappresenta l'attività che trasforma i requisiti definiti nell'Analisi dei Requisiti in una soluzione software strutturata, definendo l'architettura del sistema e le specifiche tecniche necessarie alla fase di implementazione.

Secondo lo standard ISO/IEC 12207, la progettazione comprende:
- La *progettazione architetturale*, che definisce la struttura generale del sistema, le componenti principali e le loro interazioni;
- La *progettazione di dettaglio*, che specifica il comportamento interno di ciascuna componente software.

Lo scopo della progettazione è:

- *Definire una soluzione tecnica* che soddisfi i requisiti funzionali, di qualità e di vincolo specificati nell'Analisi dei Requisiti;

- *Garantire modularità, riusabilità e manutenibilità* del sistema attraverso una corretta suddivisione in componenti;

- *Facilitare la fase di codifica* fornendo specifiche chiare e complete delle unità software da implementare;

- *Assicurare la tracciabilità* tra requisiti, componenti architetturali e implementazione;

- *Documentare le scelte progettuali* per consentire la verifica della conformità del prodotto rispetto alle specifiche e supportare la 
  manutenzione futura.

Le decisioni architetturali e le scelte tecniche specifiche adottate dal gruppo sono documentate nella Specifica Tecnica, che costituisce il riferimento progettuale per l'implementazione del sistema.

==== Standard e linee guida da seguire

La progettazione del sistema deve conformarsi agli standard UML e ai design pattern consolidati presentati nel corso di Ingegneria del Software.

===== Diagrammi UML

Per la rappresentazione della progettazione si adottano le convenzioni UML definite nelle slide del corso:

- *Diagrammi delle classi* (slide P4 - Diagrammi delle Classi): per la struttura statica del sistema, le relazioni tra classi e le dipendenze;

- *Diagrammi di sequenza*: per le interazioni dinamiche tra componenti durante l'esecuzione di casi d'uso;

- *Diagrammi dei package*: per l'organizzazione architetturale ad alto livello.

===== Design Pattern

I design pattern da considerare durante la progettazione sono documentati nelle slide del corso:

- *Pattern architetturali* (slide P5 - Design Pattern Architetturali - Dependency Injection): per l'organizzazione dell'architettura e la 
  gestione delle dipendenze;

- *Pattern comportamentali* (slide P9 - Design Pattern Comportamentali): per la definizione della comunicazione tra oggetti.

I pattern concretamente applicati nel progetto sono documentati nella Specifica Tecnica (Sezione Design Patterns).

===== Principi di progettazione

La progettazione segue i seguenti principi fondamentali:

- *Separazione delle responsabilità*: ogni componente ha una responsabilità ben definita;
- *Modularità*: organizzazione in moduli indipendenti e riutilizzabili;
- *Information hiding*: dettagli implementativi nascosti dietro interfacce;
- *Basso accoppiamento*: minimizzare le dipendenze tra componenti;
- *Alta coesione*: raggruppare funzionalità correlate.

==== Strumenti per la progettazione

Per la creazione e manutenzione dei diagrammi di progettazione, il gruppo 
utilizza i seguenti strumenti:

- *PlantUML*: per la generazione programmatica dei diagrammi UML (classi, sequenza, package). Questo approccio diagram-as-code permette di concentrarsi esclusivamente sulla logica e sui contenuti. Inoltre, la possibilità di organizzare i modelli in file separati e di sfruttare le direttive di inclusione assicura un'elevata coerenza strutturale, ottimizzando i tempi di produzione e semplificandone la manutenibilità.

- *Draw.io*: utilizzato per la creazione di diagrammi visivamente complessi che necessitano di una resa grafica specifica o del posizionamento manuale degli elementi, superando i vincoli di layout di PlantUML.

==== Procedure di progettazione

===== Documentazione delle scelte progettuali

Le decisioni architetturali e le scelte progettuali devono essere documentate nella Specifica Tecnica, che costituisce il riferimento ufficiale per l'implementazione.

La Specifica Tecnica include:
- Descrizione dell'architettura di sistema
- Design pattern applicati
- Diagrammi delle classi dettagliati
- Schema dei dati e strutture di persistenza

===== Aggiornamento della documentazione

La documentazione di progetto deve essere mantenuta aggiornata durante l'evoluzione del sistema:

- Aggiornare la Specifica Tecnica in seguito a modifiche architetturali significative;
- Documentare le decisioni progettuali nei verbali o nelle issue quando rappresentano cambiamenti rilevanti;
- Mantenere la coerenza tra Specifica Tecnica, Analisi dei Requisiti e codice implementato.