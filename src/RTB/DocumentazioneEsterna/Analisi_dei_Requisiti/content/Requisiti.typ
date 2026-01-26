#import "/src/TypstTemplate/AnalisiRequisiti/tabellaRequisiti.typ": tabella-requisiti
#import "/src/TypstTemplate/AnalisiRequisiti/tabellaTracciamento.typ": tabella-tracciamento

= Requisiti
In questa sezione sono presenti i requisiti nati dai casi d'uso trovati grazie allo studio del capitolato, lo studio del dominio di progetto e dal confronto con l'azienda proponente.

== Requisiti funzionali
I requisiti funzionali definiscono le funzioni, i comportamenti e le azioni specifiche che il software deve essere in grado di eseguire in risposta a determinati input o eventi.
Questi sono stati divisi in obbligatori (ROF: Requisiti Obbligatori Funzionali - requisiti che devono essere presenti per soddisfare la richiesta della proponente) e desiderabili (RDF: Requisiti Desiderabili Funzionali - requisiti che arricchiscono il sistema con funzionalità utili).

#tabella-requisiti((
  "ROF1", "Obbligatorio", "Il sistema deve permettere l'importazione di documenti tecnici", "UC3",

  "ROF2", "Obbligatorio", "Il sistema deve trovare ed estrarre la lista degli asset presenti nei documenti importati", "UC3",

  "ROF3", "Obbligatorio", "Il sistema deve notificare l'utente di errori nell'importazione (file vuoto, troppo grande o parsing fallito)", "UC4, UC5, UC6",

  "ROF4", "Obbligatorio", "Il sistema deve eseguire i decision tree in modo interattivo (far vedere domanda e dare la possibilità di rispondere), guidando l'utente nei nodi", "UC7, UC8",

  "ROF5", "Obbligatorio", "Il sistema deve gestire i casi PASS, FAIL e N.A.: sbloccare/bloccare nodi, fermare/continuare la compilazione dell'albero", "UC9, UC10, UC11",

  "ROF6", "Obbligatorio", "Il sistema deve permettere la visualizzazione degli asset di un dispositivo e il loro stato", "UC17",

  "ROF7", "Obbligatorio", "Il sistema deve mostrare i requisiti da verificare per un dispositivo, basandosi sulla gerarchia della norma", "UC18",

  "ROF8", "Obbligatorio", "Il sistema deve permettere l'inserimento di una giustificazione testuale per gli esiti, in particolare per N.A.", "UC24",
  
  "ROF9", "Obbligatorio", "Il sistema deve salvare in modo persistente le risposte fornite dall’utente durante l’esecuzione di un decision tree", "UC8, UC28",

  "ROF10", "Obbligatorio", "Il sistema deve tracciare e memorizzare il percorso decisionale seguito (nodi visitati e risposte) per ogni requisito verificato", "UC8",

  "ROF11", "Obbligatorio", "Il sistema deve bloccare la prosecuzione del decision tree quando viene raggiunto uno stato terminale (PASS, FAIL o N.A.)", "UC9, UC10, UC11",

  "ROF12", "Obbligatorio", "In caso di modifica di una risposta precedente (navigazione indietro), il sistema deve invalidare automaticamente le risposte successive e ricalcolare il percorso decisionale", "UC12",

  "ROF13", "Obbligatorio", "Il sistema deve riconoscere il completamento di tutti i requisiti di un asset e fornire un resoconto finale all'utente", "UC14",

  "ROF14", "Obbligatorio", "Il sistema deve permettere di specificare il tipo di asset e di interfaccia (es. Rete o Utente) all'inserimento", "UC21",

  "RDF1", "Desiderabile", "Il sistema deve gestire l'autenticazione di un responsabile tecnico", "UC1",

  "RDF2", "Desiderabile", "Il sistema deve dare privilegi avanzati al responsabile tecnico autenticato (modifica alberi tramite editor)", "UC1, UC15",

  "RDF3", "Desiderabile", "Il sistema deve gestire l'autenticazione di un utente base", "UC1",

  "RDF4", "Desiderabile", "Il sistema deve permettere una corretta navigazione all'indietro durante l'esecuzione di un decision tree", "UC12",

  "RDF5", "Desiderabile", "Il sistema deve includere un editor grafico per permettere al responsabile tecnico di visualizzare e modificare la struttura di un decision tree", "UC15",

  "RDF6", "Desiderabile", "Il sistema deve permettere le modifiche delle caratteristiche di un asset esistente", "UC19",

  "RDF7", "Desiderabile", "Il sistema deve permettere l'aggiunta manuale di asset non rilevati automaticamente", "UC21",

  "RDF8", "Desiderabile", "Il sistema deve permettere l'esportazione dei risultati della verifica in diversi formati (PDF, CSV, JSON)", "UC25",

  "RDF9", "Desiderabile", "Il sistema deve permettere di visualizzare uno storico delle verifiche effettuate", "UC26",
  
  "RDF10", "Desiderabile", "Il sistema deve permettere di riprendere una verifica interrotta o salvare lo stato di una verifica in corso", "UC28, UC30",

  "RDF11", "Desiderabile", "Il sistema deve permettere la visualizzazione grafica della struttura di un decision tree", "UC15",

  "RDF12", "Desiderabile", "Il sistema deve permettere di visualizzare i requisiti di un asset in base al loro stato (gerarchia corretta)", "UC18",
))

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

  "ROV2", "Obbligatorio", "La struttura dei decision tree deve essere importata/salvata da file di configurazione esterni in un formato strutturato (es. XML/JSON)", "UC15",

  "ROV3", "Obbligatorio", "L'applicazione deve essere accessibile previa autenticazione", "Capitolato, UC1",

  "ROV4", "Obbligatorio", "I report finali devono essere generati in un formato standard esportabile (es. PDF, CVS)", "Capitolato, UC25",

  "RDV1", "Desiderabile", "La logica del sistema deve essere scritta in linguaggio Python", "Capitolato"
))

== Requisiti di sicurezza
Questa sezione analizza i requisiti che l'applicazione deve avere affinché siano garantiti adeguati livelli di sicurezza, integrità e riservatezza dei dati trattati.

#tabella-requisiti((
  "ROS1", "Obbligatorio", "Le password utente e admin non devono essere salvate in chiaro nel database", "UC1",

  "ROS2", "Obbligatorio", "Il sistema deve garantire che la modifica dei decision tree sia consentita esclusivamente ad utenti autenticati come Responsabile Tecnico", "UC15",

  "RDS1", "Desiderabile", "Ogni input di testo deve essere sanificato affinché vengano introdotti nel db tipi di dati previsti", "Riunione esterna",
))

== Requisiti di performance
Da chiedere all'azienda se azioni come conversione, caricamento del nodo successivo ecc... debbano avere un tempo di durata massimo

== Tracciamento
=== Fonte - Requisiti
#tabella-tracciamento(
  "Fonte",
  "Requisiti",
  (
    "UC1", "ROF14, RDF1, RDF2, RDF3, ROV3, ROS1",
    "UC3", "ROF1, ROF2",
    "UC4", "ROF3",
    "UC5", "ROF3",
    "UC6", "ROF3",
    "UC7", "ROF4",
    "UC8", "ROF4, ROF9, ROF10",
    "UC9", "ROF5, ROF11",
    "UC10", "ROF5, ROF11",
    "UC11", "ROF5, ROF11",
    "UC12", "ROF12, RDF4",
    "UC14", "ROF13",
    "UC15", "RDF2, RDF5, RDF11, ROV2, ROS2",
    "UC17", "ROF6",
    "UC18", "ROF7, RDF12",
    "UC19", "RDF6",
    "UC21", "ROF14, RDF7",
    "UC24", "ROF8",
    "UC25", "RDF8, ROV4",
    "UC26", "RDF9",
    "UC28", "ROF9, RDF10",
    "UC30", "RDF10",
    
    "Capitolato", "ROQ3, ROQ4, ROQ5, ROV1, ROV3, ROV4, RDV1",
    "Riunione esterna", "RDS1",
    "Analisi dei requisiti", "ROQ6",
    "Piano di Qualifica", "ROQ1",
    "Norme di Progetto", "ROQ2"
  )
)

=== Requisito fonte
#tabella-tracciamento(
  "Requisito",
  "Fonte",
  (
    "ROF1", "UC3",
    "ROF2", "UC3",
    "ROF3", "UC4, UC5, UC6",
    "ROF4", "UC7, UC8",
    "ROF5", "UC9, UC10, UC11",
    "ROF6", "UC17",
    "ROF7", "UC18",
    "ROF8", "UC24",
    "ROF9", "UC8, UC28",
    "ROF10", "UC8",
    "ROF11", "UC9, UC10, UC11",
    "ROF12", "UC12",
    "ROF13", "UC14",
    "ROF14", "UC21",

    "RDF1", "UC1",
    "RDF2", "UC1, UC15",
    "RDF3", "UC1",
    "RDF4", "UC12",
    "RDF5", "UC15",
    "RDF6", "UC19",
    "RDF7", "UC21",
    "RDF8", "UC25",
    "RDF9", "UC26",
    "RDF10", "UC28, UC30",
    "RDF11", "UC15",
    "RDF12", "UC18",

    "ROQ1", "Piano di Qualifica",
    "ROQ2", "Norme di Progetto",
    "ROQ3", "Capitolato",
    "ROQ4", "Capitolato",
    "ROQ5", "Capitolato",
    "ROQ6", "Analisi dei requisiti",

    "ROV1", "Capitolato",
    "ROV2", "UC15",
    "ROV3", "Capitolato, UC1",
    "ROV4", "Capitolato, UC25",
    "RDV1", "Capitolato",

    "ROS1", "UC1",
    "ROS2", "UC15",
    "RDS1", "Riunione esterna"
  )
)