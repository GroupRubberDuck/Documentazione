
 = Casi d'uso

  == Scopo

  Lo scopo di questa sezione è descrivere in dettaglio i casi d’uso individuati dal gruppo, al fine di rappresentare le funzionalità principali del sistema di verifica della conformità allo standard EN 18031. Per garantire una rappresentazione formale e comprensibile a tutti gli stakeholder del progetto, il documento adotta la notazione UML per la descrizione dei casi d'uso, ognuno dei quali è descritto seguendo una struttura logica rigorosa che comprende:

  #pad(left: 1em)[
    - *Nominativo*: identificativo univoco e descrittivo del caso d'uso;\
    - *Attori Principali*: soggetti (umani o sistemi esterni) che interagiscono con il sistema;\
    - *Precondizioni*: stato del sistema prima dell'esecuzione del caso d'uso;\
    - *Trigger*: identifichiamo l'evento specifico o l'azione dell'attore che avvia l'esecuzione del caso d'uso.\
    - *Postcondizioni*: stato del sistema al termine dell'esecuzione del caso d'uso;\
    - *Scenario principale*: si mostra passo dopo passo la sequenza di interazioni tra attori e sistema che caratterizza il flusso di esecuzione normale, mostrando come si passa dalle condizioni iniziali al risultato finale;\
    - *Scenari alternativi*: documentiamo i percorsi di esecuzione che si discostano dal flusso normale e le situazioni in cui l'esecuzione regolare viene interrotta a causa di condizioni anomale o scelte diverse dell'utente;\
    - *Estensioni*: eventuali estensioni o generalizzazioni del caso d'uso;\
    - *Sottocasi d'Uso*: quando necessario, identifichiamo dei sottocasi che seguono la medesima struttura documentale e vengono referenziati tramite una numerazione gerarchica nella forma X.Y, dove X rappresenta il caso d'uso principale e Y un identificativo progressivo del sottocaso;\
    - *Casi che Ereditano*: elenchiamo i casi d'uso che estendono il caso d'uso corrente, ereditandone tutte le caratteristiche e aggiungendone di specifiche;\
    - *Eredita da*: specifichiamo il caso d'uso padre dal quale il caso d'uso corrente deriva le proprie funzionalità di base.
  ]

  == Attori

  L'applicazione prevede la presenza di un Attore principale:

  - *Utente*: Persona che utilizza l'applicazione per effettuare la verifica della conformità dei dispositivi radio allo standard EN 18031. L'utente interagisce direttamente con il sistema attraverso l'interfaccia grafica, importa i documenti tecnici, risponde alle domande dei decision tree, visualizza i risultati delle valutazioni e gestisce la documentazione associata. 
  
  - Il *Responsabile Tecnico* (specializzazione di *Utente*). \ Conosce a fondo la normativa di riferimento e rimane costantemente aggiornato sulle sue evoluzioni.\ Il suo compito è garantire che la logica decisionale del sistema sia sempre coerente con la norma, intervenendo quando necessario. Può infatti accedere all’editor e modificare i decision tree, aggiornando nodi e condizioni in base ai cambi normativi o alle esigenze operative.
//
// Valutare se avere un attore: utente non autenticato
// 

== Lista casi d'uso

/*Ipotetiche relazioni tra i casi d'uso principali
UC3 --> UC1 (INCLUDE)
UC4 --> UC3 (INCLUDE)
UC6 --> UC2 (INCLUDE)
UC3.1 <-- UC3 (EXTEND)
UC1.1 <-- UC1 (EXTEND)
potrebbe volerci anche una relazione di generalizzazione tra utente e responsabile tecnico del tipo:
utente(padre)<----responsabile tecnico(figlio), cioè Responsabile tecnico eredita tutte le funzionalità dell'utente e ne aggiunge di nuove.
*/

=== UC1: Importazione documenti tecnici del dispositivo

#figure(
  image("../immagini/UC1.png", width: 80%),
  caption: [Importazione documenti tecnici del dispositivo]
)
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha avviato l'applicazione e si trova nella schermata principale;
- *Postcondizioni*: I documenti tecnici sono stati caricati correttamente nel sistema e sono disponibili per l'elaborazione;
- *Trigger*: L'utente seleziona l'opzione per importare i documenti tecnici;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
  
    + L'utente accede alla funzionalità di importazione documenti;
    + Il sistema mostra l'interfaccia di selezione dei file;
    + L'utente seleziona uno o più file nei formati supportati;
    + Il sistema carica i documenti e identifica tutti gli asset presenti in essi;
    + Il sistema mostra un messaggio di conferma dell'avvenuta importazione;
    + Il sistema visualizza un riepilogo delle informazioni importate.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
  #terms(separator: ": ",
    ([UC1.1],[File di ingresso non valido per formato.]),
    ([UC1.2],[Una o più funzionalità non sono state lette correttamente]),
  )
    
]

  ==== UC1.1: File di ingresso non valido
/*#figure(
  image("immagini/UC1.1.png", width: 80%),
  caption: [File di ingresso non valido]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un file per l'importazione;
- *Postcondizioni*: L'utente viene informato dell'errore e può tentare una nuova importazione;
- *Trigger*: Il sistema tenta di leggere il file selezionato;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
  + Il sistema tenta di aprire il file selezionato;
  + Il sistema rileva che il file non rispetta il formato previsto;
  + Il sistema notifica l'errore all'utente con un messaggio dettagliato;
  + Il sistema suggerisce all'utente di verificare il formato del file;
  + L'utente può tentare nuovamente l'importazione (*UC1*).
]
  ==== UC1.2 lettura non corretta di singole funzionalità
  - *Precondizioni*: L'utente ha selezionato un file per l'importazione;
- *Postcondizioni*: L'utente viene informato dell'errore e può vedere il report degli errori;
- *Trigger*: Il sistema tenta di leggere il file selezionato;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema tenta di aprire il file selezionato;
    + Il sistema rileva le funzionalità/asset ;
    + Il sistema rileva degli errori nel parsing di alcune funzionalità/asset di alcuni asset;
    + Il sistema riporta gli errori;
    + L'utente può completare manualmente la documentazione, tramite editor integrato . *UC7.1*
]

=== UC2: Autenticazione del Responsabile Tecnico

/*#figure(
image("immagini/UC2.png", width: 80%),
caption: [Autenticazione del Responsabile Tecnico]
)*/

- *Attore Principale*: Responsabile Tecnico;
- *Precondizioni*: L’utente ha accesso alla piattaforma e desidera operare con privilegi avanzati;
- *Postcondizioni*: Il Responsabile Tecnico è autenticato e riconosciuto come utente con privilegi elevati;
- *Trigger*: Il Responsabile Tecnico accede alla piattaforma;
- *Scenario Principale*:#pad(left: 1em)[
#v(-0.5em)
   + L’utente accede alla schermata di login;
   + L’utente inserisce le credenziali di Responsabile Tecnico (username, password);
   + Il sistema verifica le credenziali;
   + Il sistema conferma l’autenticazione e assegna i privilegi avanzati;
   + Il Responsabile Tecnico accede alla piattaforma con la funzionalità riservata di modifica dei decision tree.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC2.1*: Errore nelle credenziali di accesso.
]


=== UC3: Avvio dell'esecuzione di un decision tree

/*#figure(
  image("immagini/UC3.png", width: 80%),
  caption: [Avvio dell'esecuzione di un decision tree]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: I decision tree sono stati importati correttamente nel sistema;
- *Postcondizioni*: L'utente ha avviato la compilazione delle domande del decision tree selezionato;
- *Trigger*: L'utente seleziona un requisito da valutare per un asset specifico dalla dashboard;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + L'utente apre la dashboard dei requisiti;
    + L'utente seleziona un requisito specifico (es. AUM-5-1);
    + Il sistema verifica se il requisito selezionato ha dipendenze da altri requisiti;
    + Il sistema controlla lo stato dei requisiti prerequisiti;
    + Se tutti i prerequisiti sono soddisfatti (Pass o Not Applicable), il sistema carica il decision tree associato;
    + Il sistema apre una schermata dedicata alla compilazione del decision tree;
    + Il sistema mostra la prima domanda del decision tree;
    + L'utente seleziona una risposta tra "Yes" o "No";
    + Il sistema naviga automaticamente al nodo successivo in base alla risposta.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + *UC3.1*: Prerequisiti non soddisfatti.
]

==== UC3.1: Prerequisiti non soddisfatti
/*#figure(
  image("immagini/UC3.1.png", width: 80%),
  caption: [Prerequisiti non soddisfatti]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un requisito che ha dipendenze da altri requisiti;
- *Postcondizioni*: L'utente è informato sui prerequisiti mancanti e non può avviare il decision tree;
- *Trigger*: Il sistema rileva che uno o più  prerequisiti non sono stati completati;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema verifica le dipendenze del requisito selezionato;
    + Il sistema rileva che uno o più prerequisiti non sono nello stato Pass o Not Applicable;
    + Il sistema mostra un messaggio all'utente indicando quali requisiti devono essere completati prima;
    + Il sistema evidenzia nella dashboard i prerequisiti mancanti;
    + L'utente può selezionare uno dei prerequisiti per completarlo.
]

=== UC4: Completamento dell'esecuzione di un decision tree
/*#figure(
  image("immagini/UC4.png", width: 80%),
  caption: [Completamento dell'esecuzione di un decision tree]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha risposto a tutte le domande del decision tree seguendo il percorso decisionale;
- *Postcondizioni*: Viene generato l'esito finale del requisito (Pass, Fail o Not Applicable) e lo stato viene aggiornato nella dashboard;
- *Trigger*: L'ultimo nodo del percorso decisionale viene raggiunto;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema rileva che il nodo finale è stato raggiunto;
    + Il sistema legge l'esito associato al nodo finale (Pass, Fail o Not Applicable);
    + Il sistema salva l'esito del requisito;
    + Il sistema mostra all'utente l'esito finale con un messaggio esplicativo;
    + Il sistema aggiorna lo stato del requisito nella dashboard;
    + Il sistema notifica all'utente eventuali nuovi requisiti dipendenti disponibili.
]

=== UC5: Visualizzazione della dashboard dei requisiti
/*#figure(
  image("immagini/UC5.png", width: 80%),
  caption: [Visualizzazione della dashboard dei requisiti]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: I decision tree sono stati importati nel sistema e associati ai rispettivi requisiti;
- *Postcondizioni*: L'utente visualizza lo stato completo di tutti i requisiti e può interagire con essi;
- *Trigger*: L'utente apre la dashboard dell'applicazione;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + L'utente accede alla dashboard dell'applicazione;
    + L'utente visualizza la lista degli asset del dispositivo;
    + Per ogni asset vengono visualizzati tutti i  requisiti da valutare;
    + Per ogni requisito, il sistema visualizza:
        - Codice identificativo del requisito (es. AUM-5-1);
        - Stato corrente: Non iniziato, In corso, Pass, Fail, Not Applicable;
        - Eventuali dipendenze da altri requisiti;
        - Indicatore di disponibilità per l'esecuzione;
    + Il sistema evidenzia visivamente i requisiti in base al loro stato (es. colori diversi);
    + L'utente può filtrare o ordinare i requisiti per stato o codice;
    + L'utente può selezionare un requisito disponibile per avviarne l'esecuzione;
    + L'utente può accedere all'editor grafico per visualizzare o modificare un decision tree.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + *UC3*: L'utente seleziona un requisito per avviarne l'esecuzione;
    + *UC6*: L'utente con privilegi apre l'editor grafico per modificare un decision tree.
]


=== UC6: Modifica di un decision tree tramite editor grafico
/*#figure(
  image("immagini/UC6.png", width: 80%),
  caption: [Modifica di un decision tree tramite editor grafico]
)*/
- *Attore Principale*: Responsabile tecnico;
- *Precondizioni*: Il responsabile tecnico è autenticato e ha selezionato un decision tree dalla dashboard;
- *Postcondizioni*: Le modifiche al decision tree vengono salvate e il decision tree aggiornato è disponibile per l'esecuzione;
- *Trigger*: Il responsabile tecnico apre l'editor grafico per visualizzare o modificare un decision tree;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il responsabile tecnico accede all'editor grafico dalla dashboard;
    + Il sistema carica la rappresentazione grafica del decision tree selezionato;
    + Il sistema visualizza la struttura ad albero con tutti i nodi, domande e percorsi;
    + Il responsabile tecnico naviga visualmente il decision tree;
    + Il responsabile tecnico modifica elementi del decision tree:
        - Testi delle domande;
        - Dipendenze e percorsi tra nodi;
        - Esiti finali (Pass, Fail, Not Applicable);
    + Il responsabile tecnico seleziona l'opzione di salvataggio;
    + Il sistema richiede il formato desiderato (XML o JSON);
    + Il sistema valida la struttura modificata del decision tree;
    + Il sistema genera il file nel formato selezionato;
    + Il sistema salva il decision tree modificato nel file system locale;
    + Il sistema conferma il salvataggio all'utente.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + *UC6.1*: Struttura del decision tree non valida dopo la modifica;
]


==== UC6.1: Struttura del decision tree non valida dopo la modifica
- *Attore Principale*: Responsabile Tecnico;
- *Precondizioni*: Il responsabile tecnico ha effettuato modifiche al decision tree e ha confermato il salvataggio;
- *Postcondizioni*: Il decision tree non viene salvato e rimane nello stato precedente alla modifica, l'editor rimane aperto;
- *Trigger*: Il sistema rileva errori di validazione durante il controllo della struttura modificata;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema avvia la validazione della struttura modificata;
    + Il sistema rileva anomalie nella struttura del decision tree (es. nodi orfani, percorsi interrotti, riferimenti mancanti, cicli infiniti);
    + Il sistema interrompe il processo di salvataggio;
    + Il sistema mostra un messaggio di errore dettagliato con l'elenco delle anomalie riscontrate;
    + Il sistema mantiene l'editor aperto con le modifiche correnti evidenziando gli elementi errati;
    + Il responsabile tecnico corregge le anomalie segnalate (torna al punto 5 di *UC6*);
    
]

=== UC7: Modifica delle caratteristiche degli asset
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente vuole modificare una o più caratteristiche di un asset;
- *Postcondizioni*: Le modifiche sono state salvate e gli output ricalcolati di conseguenza;
- *Trigger*: L'utente seleziona un asset per modificarlo;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema apre un'interfaccia di modifica precompilata con i dati attuali;
    + L'utente modifica i campi desiderati;
    + L'utente conferma il termine della modifica;
    + Il sistema valida i nuovi dati;
    + Il sistema salva le modifiche e aggiorna le informazioni;
    + Il sistema chiude l'interfaccia.
]
- *Scenari alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + *UC7.1*: Visualizzazione errore nella validazione dei dati dell'asset.
]

==== UC7.1: Visualizzazione errore nella validazione dei dati dell'asset
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha modificato i dati di un asset e ha tentato di salvare;
- *Postcondizioni*: Le modifiche non vengono applicate, l'editor rimane aperto mostrando l'errore;
- *Trigger*: Il sistema rileva dati non validi dopo la conferma dell'utente;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + Il sistema blocca il salvataggio delle modifiche;
    + Il sistema segnala all'utente i campi non validi con messaggi di errore specifici;
    + L'utente corregge i dati o annulla l'operazione.
]
=== UC8: Esportazione dei risultati
/*#figure(
  image("immagini/UC7.png", width: 80%),
  caption: [Esportazione dei risultati]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'esecuzione di almeno un decision tree è stata completata;
- *Postcondizioni*: Il file contenente i risultati è stato generato e salvato nel formato selezionato;
- *Trigger*: L'utente richiede l'esportazione dei risultati;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + L'utente accede al menù "Esporta risultati";
    + Il sistema mostra le opzioni di formato disponibili (PDF, CSV, JSON);
    + L'utente seleziona il formato desiderato per l'esportazione;
    + Il sistema raccoglie per ogni asset tutti i risultati delle esecuzioni completate;
    + Il sistema genera il file nel formato selezionato;
    + Il sistema salva il file sul file system locale;
    + Il sistema notifica all'utente il completamento dell'esportazione e la posizione del file. 
]


=== UC9: Aggiunta giustificazione ad un risultato N/A (Not Applicable)
/*#figure(
image("immagini/UC8.png", width: 80%),
caption: [Aggiunta giustificazione a un risultato]
)*/

- *Attore Principale*: Utente;
- *Precondizioni*: Un requisito è stato valutato e ha prodotto il risultato N/A (Not Applicable);
- *Postcondizioni*: La giustificazione viene associata al risultato e salvata;
- *Trigger*: L'utente decide di documentare la motivazione di un risultato N/A;
- *Scenario Principale*:#pad(left: 1em)[
#v(-0.5em)
   + L'utente visualizza il risultato del requisito;
   + L'utente seleziona l'opzione per aggiungere una giustificazione;
   + Il sistema presenta un'area di testo per l'inserimento;
   + L'utente inserisce la giustificazione;
   + L'utente conferma l'inserimento;
   + Il sistema associa la giustificazione al risultato;
   + La giustificazione viene visualizzata insieme al risultato.
]

=== UC10: Aggiunta di un nuovo asset tramite interfaccia
- *Attore principali*: Utente;
- *Precondizioni*: L'utente ha caricato un file di configurazione del dispositivo o ha aperto una valutazione esistente;
- *Postcondizioni*: Il nuovo asset viene aggiunto al dispositivo e tutti i decision tree standard vengono associati ad esso;
- *Trigger*: L'utente desidera aggiungere manualmente un nuovo asset al dispositivo;
- *Scenario Principale*:#pad(left: 1em)[
#v(-0.5em)
   + L'utente accede alla sezione di gestione degli asset;
   + L'utente seleziona l'opzione "Aggiungi nuovo asset";
   + Il sistema presenta un form per l'inserimento dei dati dell'asset;
   + L'utente inserisce le informazioni richieste (nome, tipo, descrizione, proprietà tecniche);
   + L'utente conferma l'inserimento;
   + Il sistema valida i dati inseriti;
   + Il sistema crea il nuovo asset;
   + Il sistema associa tutti i decision tree standard al nuovo asset con stato "Non valutato";
   + Il sistema aggiorna la dashboard mostrando il nuovo asset;
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + *UC7.1*: Visualizzazione errore nella validazione dei dati dell'asset;
]


=== UC11: Navigazione al passo precedente durante l'esecuzione di un decision tree
/*#figure(
  image("immagini/UC10.png", width: 80%),
  caption: [Navigazione al passo precedente durante l'esecuzione di un decision tree]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente sta eseguendo un decision tree e ha risposto ad almeno una domanda;
- *Postcondizioni*: Il sistema torna alla domanda precedente e la risposta può essere modificata;
- *Trigger*: l'utente desidera tornare alla domanda precedente per correggere la risposta;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + L'utente sta rispondendo alle domande di un decision tree;
    + Il sistema ha presentato una domanda;
    + L'utente seleziona il pulsante "Passo precedente" o "Indietro";
    + Il sistema torna alla domanda precedente nel percorso del decision tree;
    + Il sistema mostra la risposta precedentemente data;
    + L'utente può:
        - Confermare la risposta precedente e procedere;
        - Modificare la risposta;
    + Se l'utente modifica la risposta:
        - Il sistema invalida tutte le risposte successive a quella modificata;
        - Il sistema ricalcola il percorso del decision tree dalla domanda modificata;
        - Il sistema presenta la domanda successiva in base al nuovo percorso.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    + Se l'utente è alla prima domanda, il pulsante "Passo precedente" non è disponibile e viene sostituito da un pulsante "Ritorna alla dashboard";
]

//Infine, nel caso in cui l'utente apra, tramite la web app, un file relativo a un test precedente, questo non dovrà presentare i risultati in modalità sola lettura, bensì dovranno essere pienamente modificabili.