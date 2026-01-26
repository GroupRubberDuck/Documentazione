#import "/src/TypstTemplate/AnalisiRequisiti/tabellaRequisiti.typ": tabella-requisiti
#import "/src/TypstTemplate/AnalisiRequisiti/tabellaTracciamento.typ": tabella-tracciamento

= Requisiti
In questa sezione sono presenti i requisiti nati dai casi d'uso trovati grazie allo studio del capitolato, lo studio del dominio di progetto e dal confronto con l'azienda proponente.

== Requisiti funzionali
I requisiti funzionali definiscono le funzioni, i comportamenti e le azioni specifiche che il software deve essere in grado di eseguire in risposta a determinati input o eventi.
Questi sono stati divisi in obbligatori (ROF: Requisiti Obbligatori Funzionali - requisiti che devono essere presenti per soddisfare la richiesta della proponente) e desiderabili (RDF: Requisiti Desiderabili Funzionali - requisiti che arricchiscono il sistema con funzionalità utili).


#tabella-requisiti((
  "ROF1", "Obbligatorio", "Il sistema deve permettere l'importazione di documenti tecnici", "UC1",

  "ROF2", "Obbligatorio", "Il sistema deve trovare ed estrarre la lista degli asset presenti nei documenti importati", "UC1",

  "ROF3", "Obbligatorio", "Il sistema deve notificare l'utente di errori nell'importazione", "UC1.1, UC1.2, UC1.3",

  "ROF4", "Obbligatorio", "Il sistema deve eseguire i decision tree in modo interattivo (far vedere domanda e dare la possibilità di rispondere), guidando l'utente nei nodi", "UC4, UC5",

  "ROF5", "Obbligatorio", "Il sistema deve gestire i casi PASS, FAIL e N.A.: sbloccare/bloccare nodi, fermare/continuare la compilazione dell'albero", "UC5.1, UC5.2, UC5.3",

  "ROF6", "Obbligatorio", "Il sistema deve permettere la visualizzazione degli asset di un dispositivo e il loro stato", "UC8",

  "ROF7", "Obbligatorio", "Il sistema deve mostrare i requisiti da verificare per un dispositivo, basandosi sulla gerarchia della norma", "UC9",

  "ROF8", "Obbligatorio", "Il sistema deve permettere l'inserimento di una giustificazione testuale per gli esiti, in particolare per N.A.", "UC12",
  
  "ROF9", "Obbligatorio", "Il sistema deve salvare in modo persistente le risposte fornite dall’utente durante l’esecuzione di un decision tree", "UC5",

  "ROF10", "Obbligatorio", "Il sistema deve tracciare e memorizzare il percorso decisionale seguito (nodi visitati e risposte) per ogni requisito verificato", "UC5, UC6",

  "ROF11", "Obbligatorio", "Il sistema deve bloccare la prosecuzione del decision tree quando viene raggiunto uno stato terminale (PASS, FAIL o N.A.)", "UC4, UC5",

  "ROF12", "Obbligatorio", "In caso di modifica di una risposta precedente, il sistema deve invalidare automaticamente le risposte successive e ricalcolare il percorso decisionale", "UC6",

  "ROF13", "Obbligatorio", "Il sistema deve riconoscere il completamento di tutti i requisiti di un asset e fornire un resoconto finale all'utente", "UC7",

  "ROF14", "Obbligatorio", "Il sistema deve distinguere il tipo di interfaccia (Rete o Utente)", "UC4",

  "RDF1", "Desiderabile", "Il sistema deve gestire l'autenticazione di un responsabile tecnico", "UC2",

  "RDF2", "Desiderabile", "Il sistema deve dare privilegi avanzati al responsabile tecnico autenticato (modifica alberi)", "UC2, UC10",

  "RDF3", "Desiderabile", "Il sistema deve gestire l'autenticazione di un utente base", "UC3",

  "RDF4", "Desiderabile", "Il sistema deve permettere una corretta navigazione all'indietro durante l'esecuzione di un decision tree", "UC6",

  "RDF5", "Desiderabile", "Il sistema deve includere un editor grafico per permettere al responsabile tecnico di visualizzare e modificare la risposta ad un decision tree", "UC10",

  "RDF6", "Desiderabile", "Il sistema deve permettere le modifiche di un asset esistente", "UC11",

  "RDF7", "Desiderabile", "Il sistema deve permettere l'aggiunta manuale di asset non rilevati automaticamente", "UC13",

  "RDF8", "Desiderabile", "Il sistema deve permettere l'esportazione dei risultati della verifica in diversi formati (PDF, CSV, JSON, XML)", "UC14",

  "RDF9", "Desiderabile", "Il sistema deve permettere di visualizzare uno storico interattivo delle verifiche effettuate", "UC15",
  
  "RDF10", "Desiderabile", "Il sistema deve permettere di riprendere una verifica interrotta dal punto in cui era stata sospesa", "UC3, UC6",

  "RDF11", "Desiderabile", "Il sistema deve permettere la visualizzazione grafica del percorso seguito all’interno di un decision tree", "UC3",

  "RDF12", "Desiderabile", "Il sistema deve permettere di filtrare i requisiti di un asset in base al loro stato (PASS, FAIL, N.A., Non valutato)", "UC8",

)
)

== Requisiti di qualità
I requisiti di qualità definiscono le caratteristiche che deve rispettare il sistema affinchè raggiunga uno stato consono ad una buona user experience.

#tabella-requisiti((
  "ROQ1", "Obbligatorio", "Il sistema deve seguire le metriche indicate nel Piano di Qualifica", "Piano di Qualifica",

  "ROQ2", "Obbligatorio", "Il sistema deve rispettare le indicazioni delle Norme di Progetto", "Norme di Progetto",

  "ROQ3", "Obbligatorio", "Deve essere allegato al sistema un manuale utente", "Capitolato",

  "ROQ4", "Obbligatorio", "La documentazione del prodotto deve essere fornita tramite una repo Github", "Capitolato",

  "ROQ5", "Obbligatorio", "Il codice del prodotto deve essere fornito tramite una repo Github", "Capitolato",

  "ROQ6", "Obbligatorio", "Il sistema deve essere basato sul lavoro descritto nell'Analisi dei requisiti, dove sono definiti Use Case e i requisiti che scaturiscono da essi", "Analisi dei requisiti",
))

== Requisiti di vincolo
Questa sezione definisce le restrizioni tecniche, normative e implementative che limitano le scelte progettuali nello sviluppo del sistema. Tali vincoli impongono condizioni obbligatorie, come l'uso di specifiche tecnologie e standard di compatibilità che il prodotto finale deve soddisfare.

#tabella-requisiti((
  "ROV1", "Obbligatorio" , "Il sistema deve rispettare rigorosamente la logica e i contenuti (terminologia tecnica in particolare) descritti sullo standard EVS-EN 18031-1:2024", "Capitolato",

  "ROV2", "Obbligatorio", "La struttura dei decision tree deve essere importata da file di configurazione esterni in un formato strutturato prestabilito (es. JSON)", "UC4, UC10",

  "ROV3", "Obbligatorio", "L'applicazione deve essere web based e accessibile da un browser", "Capitolato, UC1",

  "ROV4", "Obbligatorio", "I report finali devono essere generati in un formato standard esportabile (es. PDF, CVS)", "Capitolato, UC14",

  "RDV1", "Desiderabile", "La logica del sistema deve essere scritta in linguaggio Python", "Capitolato"
))

== Requisiti di sicurezza
Questa sezione analizza i requisiti che l'applicazione debba avere affinchè siano garantiti adeguati livelli di sicurezza, integrità e riservatezza dei dati trattati.

#tabella-requisiti((
  "ROS1", "Obbligatorio", "Le password utente e admin non devono essere salvate in chiaro nel database", "UC1",

  "ROS2", "Obbligatorio", "Il sistema deve garantire che la modifica dei decision tree sia consentita esclusivamente ad utenti autentificati come Responsabile Tecnico", "UC2, UC10",

  "RDS1", "Desiderablie", "Ogni input di testo deve essere sanificato affinchè vengano introdotti nel db tipi di dati previsti", "Riunione esterna",
))

== Requisiti di performance
Da chiedere all'azienda se azioni come conversione, caricamento del nodo successivo ecc... debbano avere un tempo di durata massimo

== Tracciamento
=== Fonte - Requisiti
#tabella-tracciamento(
  "Fonte",
  "Requisiti",
  (
    "UC1",
    "ROF1, ROF2, ROV3, ROS1",

    "UC1.1",
    "ROF3",

    "UC1.2",
    "ROF3",

    "UC1.3",
    "ROF3",

    "UC2",
    "RDF1, RDF2, ROS2",

    "UC3",
    "RDF3, RDF10, RDF11",

    "UC4",
    "ROF4, ROF11, ROF14, ROV2",

    "UC5",
    "ROF4, ROF9, ROF10, ROF11",

    "UC5.1",
    "ROF5",

    "UC5.2",
    "ROF5",

    "UC5.3",
    "ROF5",

    "UC6",
    "ROF10, ROF12, RDF4, RDF10",

    "UC7",
    "ROF13",

    "UC8",
    "ROF6, RDF12",

    "UC9",
    "ROF7",

    "UC10",
    "RDF2, RDF5, ROV2, ROS2",

    "UC11",
    "RDF6",

    "UC12",
    "ROF8",

    "UC13",
    "RDF7",

    "UC14",
    "RDF8, ROV4",

    "UC15",
    "RDF9",

    "Capitolato",
    "ROQ3, ROQ4, ROQ5, ROV1, ROV3, ROV4, RDV1",

    "Riunione esterna",
    "RDS1",

    "Analisi dei requisiti",
    "ROQ6",

    "Piano di Qualifica",
    "ROQ1",

    "Norme di Progetto",
    "ROQ2"
  )
)

=== Requisito fonte
#tabella-tracciamento(
  "Requisito",
  "Fonte",
  (
    "ROF1",
    "UC1",

    "ROF2",
    "UC1",

    "ROF3",
    "UC1.1, UC1.2, UC1.3",

    "ROF4",
    "UC4, UC5",

    "ROF5",
    "UC5.1, UC5.2, UC5.3",

    "ROF6",
    "UC8",

    "ROF7",
    "UC9",

    "ROF8",
    "UC12",

    "ROF9",
    "UC5",

    "ROF10",
    "UC5, UC6",

    "ROF11",
    "UC4, UC5",

    "ROF12",
    "UC6",

    "ROF13",
    "UC7",

    "ROF14",
    "UC4",

    "RDF1",
    "UC2",

    "RDF2",
    "UC2, UC10",

    "RDF3",
    "UC3",

    "RDF4",
    "UC6",

    "RDF5",
    "UC10",

    "RDF6",
    "UC11",

    "RDF7",
    "UC13",

    "RDF8",
    "UC14",

    "RDF9",
    "UC15",

    "RDF10",
    "UC3, UC6",

    "RDF11",
    "UC3",

    "RDF12",
    "UC8",

    "ROQ1",
    "Piano di Qualifica",

    "ROQ2",
    "Norme di Progetto",

    "ROQ3",
    "Capitolato",

    "ROQ4",
    "Capitolato",

    "ROQ5",
    "Capitolato",

    "ROQ6",
    "Analisi dei requisiti",

    "ROV1",
    "Capitolato",

    "ROV2",
    "UC4, UC10",

    "ROV3",
    "Capitolato, UC1",

    "ROV4",
    "Capitolato, UC14",

    "RDV1",
    "Capitolato",

    "ROS1",
    "UC1",

    "ROS2",
    "UC2, UC10",

    "RDS1",
    "Riunione esterna"
  )
)

