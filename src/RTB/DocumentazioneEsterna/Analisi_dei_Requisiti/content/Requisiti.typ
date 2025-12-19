#import "/src/TypstTemplate/AnalisiRequisiti/tabellaRequisiti.typ": tabella-requisiti

= Requisiti
In questa sezione sono presenti i requisiti nati dai casi d'uso trovati grazie allo studio del capitolato, lo studio del dominio di progetto e dal confronto con l'azienda proponente.

== Requisiti funzionali
I requisiti funzionali definiscono le funzioni, i comportamenti e le azioni specifiche che il software deve essere in grado di eseguire in risposta a determinati input o eventi.
Questi sono stati divisi in obbligatori (requisiti che devono essere presenti per soddisfare la richiesta della proponente) e desiderabili (requisiti che arricchiscono il sistema con funzionalità utili).


#tabella-requisiti((
  "ROF1", "Obbligatorio", "Il sistema deve permettere l'importazione di documenti tecnici", "UC1",

  "ROF2", "Obbligatorio", "Il sistema deve trovare ed estrarre la lista degli asset presenti nei documenti importati", "UC1",

  "ROF3", "Obbligatorio", "Il sistema deve notificare l'utente di errori nell'importazione", "UC1.1, UC1.2, UC1.3",

  "ROF4", "Obbligatorio", "Il sistema deve eseguire i decision tree in modo interattivo (far vedere domanda e dare la possibilità di rispondere), guidando l'utente nei nodi", "UC4, UC5",

  "ROF5", "Obbligatorio", "Il sistema deve gestire i casi PASS, FAIL e N.A.: sbloccare/bloccare nodi, fermare/continuare la compilazione dell'albero", "UC5.1, UC5.2, UC5.3",

  "ROF6", "Obbligatorio", "Il sistema deve permettere la visualizzazione degli asset di un dispositivo e il loro stato", "UC8",

  "ROF7", "Obbligatorio", "Il sistema deve mostrare i requisiti da verificare per un dispositivo, basandosi sulla gerarchia della norma", "UC9",

  "ROF8", "Obbligatorio", "Il sistema deve permettere l'inserimento di una giustificazione testuale per gli esiti, in particolare per N.A.", "UC",
  
  "ROF9", "Obbligatorio", "Il sistema deve salvare in modo persistente le risposte fornite dall’utente durante l’esecuzione di un decision tree", "UC3, UC11",

  "ROF10", "Obbligatorio", "Il sistema deve tracciare e memorizzare il percorso decisionale seguito (nodi visitati e risposte) per ogni requisito verificato", "UC3, UC6",

  "ROF11", "Obbligatorio", "Il sistema deve bloccare la prosecuzione del decision tree quando viene raggiunto uno stato terminale (PASS, FAIL o N.A.)", "UC4, UC5",

  "ROF12", "Obbligatorio", "In caso di modifica di una risposta precedente, il sistema deve invalidare automaticamente le risposte successive e ricalcolare il percorso decisionale", "UC11",

  "RDF1", "Desiderabile", "Il sistema deve gestire l'autenticazione di un responsabile tecnico", "UC2",

  "RDF2", "Desiderabile", "Il sistema deve dare privilegi avanzati al responsabile tecnico autenticato (modifica alberi)", "UC2, UC10",

  "RDF3", "Desiderabile", "Il sistema deve gestire l'autenticazione di un utente base", "UC3",

  "RDF4", "Desiderabile", "Il sistema deve permettere una corretta navigazione all'indietro durante l'esecuzione di un decision tree", "UC6",

  "RDF5", "Desiderabile", "Il sistema deve includere un editor grafico per permettere al responsabile tecnico di visualizzare e modificare la risposta ad un decision tree", "UC10",

  "RDF6", "Desiderabile", "Il sistema deve permettere le modifiche di un asset esistente", "UC11",

  "RDF7", "Desiderabile", "Il sistema deve permettere l'aggiunta manuale di asset non rilevati automaticamente", "UC13",

  "RDF8", "Desiderabile", "Il sistema deve permettere l'esportazione dei risultati della verifica in diversi formati (PDF, CSV, JSON, XML)", "UC14",

  "RDF9", "Desiderabile", "Il sistema deve permettere di visualizzare uno storico interattivo delle verifiche effettuate", "UC16",
  
  "RDF10", "Desiderabile", "IIl sistema deve permettere di riprendere una verifica interrotta dal punto in cui era stata sospesa", "UC3, UC6",

  "RDF11", "Desiderabile", "Il sistema deve permettere la visualizzazione grafica del percorso seguito all’interno di un decision tree", "UC3",

  "RDF12", "Desiderabile", "Il sistema deve permettere di filtrare i requisiti di un asset in base al loro stato (PASS, FAIL, N.A., Non valutato)", "UC8",

)
)

Non obbligatori:
- modifica giustificazione

== Requisiti di qualità

== Requisiti di vincolo