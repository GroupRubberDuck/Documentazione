#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-template, use-case-label
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
  - *Casi che Ereditano*: elenchiamo i casi d'uso che ereditano dal caso d'uso corrente, ereditandone tutte le caratteristiche e aggiungendone di specifiche;\
  - *Eredita da*: specifichiamo il caso d'uso padre dal quale il caso d'uso corrente deriva le proprie funzionalità di base.
]

== Attori

L'applicazione prevede la presenza di un Attore principale:


- *Utente*: Persona che utilizza l'applicazione per effettuare la verifica della conformità dei dispositivi radio allo standard EN 18031. L'utente interagisce direttamente con il sistema attraverso l'interfaccia grafica, importa i documenti tecnici, risponde alle domande dei decision tree, visualizza i risultati delle valutazioni e gestisce la documentazione associata.

- Il *responsabile tecnico* (specializzazione di *Utente*). \ Conosce a fondo la normativa di riferimento e rimane costantemente aggiornato sulle sue evoluzioni.\ Il suo compito è garantire che la logica decisionale del sistema sia sempre coerente con la norma, intervenendo quando necessario. Può infatti accedere all’editor e modificare i decision tree, aggiornando nodi e condizioni in base ai cambi normativi o alle esigenze operative.
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
utente(padre)<----responsabile tecnico(figlio), cioè responsabile tecnico eredita tutte le funzionalità dell'utente e ne aggiunge di nuove.
*/


// Livello base delle intestazioni degli use case, utile a non doverli ripredere in mano se vengono fatti cambi strutturali
#let base-level=3


#use-case-template(
    codice:"UC-01",
    nome:"Autenticazione",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente seleziona la funzionalità di autenticazione
      + L'utente inserisce il suo username #sym.arrow  #use-case-label(nome-etichetta: "Inserimento username",codice: "UC-01.1")
      + L'utente inserisce la sua password #sym.arrow #use-case-label(nome-etichetta: "Inserimento password",codice: "UC-01.2")
      + Il sistema valida le credenziali
      + L'utente accede alla piattaforma con i privilegi assegnati
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      ],
    post-condizioni:[
      - L'utente è ora autenticato e gli sono riconosciuti i  privilegi appropriati
      ],
    scenari-alternativi:[
      - Fallimento dell'autenticazione #use-case-label(nome-etichetta: "autenticazione-fallita",codice: "UC-02") 
      ],
    trigger:[L'utente accede alla piattaforma;],
    inclusioni:[
      - #use-case-label(nome-etichetta: "Inserimento username",codice: "UC-01.1")
      - #use-case-label(nome-etichetta: "Inserimento password",codice: "UC-01.2")
],
    estensioni:[- #use-case-label(nome-etichetta: "autenticazione-fallita",codice: "UC-02")],
    generalizzazioni:none,    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC1.drawio.png",
    figure-caption: "UC-01: Autenticazione"
)

#use-case-template(
    livello-intestazione:base-level+1,
    codice:"UC-01.1",
    nome:"Inserimento username",
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente inserisce il suo username
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      ],
    post-condizioni:[
      - Username inserito correttamente
      ],
    trigger:[L'utente vuole inserire il suo username],
)


#use-case-template(
    livello-intestazione:base-level+1,
    codice:"UC-01.2",
    nome:"Inserimento password",
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente inserisce la sua password
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      ],
    post-condizioni:[
      - Password inserita correttamente
      ],
    trigger:[L'utente vuole inserire la sua password],
)




#use-case-template(
    livello-intestazione:base-level,
    codice:"UC-02",
    nome:"Autenticazione fallita",
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente ha tentato di autenticarsi #sym.arrow #use-case-label(nome-etichetta: "autenticazione",codice: "UC-01")
      + Il sistema ha rilevato che username o password non sono validi 
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente non è autenticato nel sistema
      - L'utente ha inserito informazioni non valide in fase di login
      ],
    post-condizioni:[
      - Il sistema annulla il tentativo di autenticazione
      - L'utente visualizza il messaggio di errore generico: 'Username o password non validi'
      ],
)



#use-case-template(
    codice:"UC-03",
    nome:"Seleziona lista documenti tecnici",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente seleziona uno o più file da importare
      + Per ogni file importato
        + Il sistema importa le informazioni contenute nel singolo documento tecnico #sym.arrow Vedi #use-case-label(codice: "UC 3.1",nome-etichetta: "Importazione singolo documento tecnico")
        + Il sistema registra l'esito dell'importazione
      + Il sistema unisce i dati estratti 
    ],
    pre-condizioni:[
      - L'utente è autenticato
      - Il sistema è online
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      - L'utente può vedere il riepilogo delle importazioni
      ],
    scenari-alternativi:[
      - Vi sono conflitti tra i file caricati #sym.arrow Vedi #use-case-label(codice: "UC 4",nome-etichetta: "") 
      - L'utente annulla l'importazione #sym.arrow
      ],
    trigger:[L'utente seleziona la funzionalità di importazione dei file contenti la specifica tecnica degli asset],
    inclusioni:[
      - #use-case-label(codice: "UC 3.1",nome-etichetta: "Importazione singolo documento tecnico")
],
    estensioni:[
      - #use-case-label(codice: "UC 4",nome-etichetta: "Errore nel merge delle informazioni")
      ],
    generalizzazioni:none,    
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC3.drawio.png",
    figure-caption: "UC-01"
)
#use-case-template(
    codice:"UC-04",
    nome:"Errore nel merge delle informazioni",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema salva gli asset privi di conflitti
      + Il sistema memorizza quali asset sono soggetti a conflitti nell'area di risoluzione dei conflitti
    ],
    pre-condizioni:[
      - L'utente è autenticato
      - Il sistema è online
      - Il sistema ha rilevato conflitti durante il merge delle informazioni
      ],
    post-condizioni:[
      - Il sistema memorizza il conflitto
      - L'utente può vedere il riepilogo delle importazioni
      ],
    scenari-alternativi:[
      - Vi sono conflitti tra i file caricati #sym.arrow Vedi #use-case-label(codice: "UC 4",nome-etichetta: "") 
      - L'utente annulla l'importazione #sym.arrow
      ],
    trigger:[L'utente seleziona la funzionalità di importazione dei file contenti la specifica tecnica degli asset],
    inclusioni:[
      - #use-case-label(codice: "UC 3.1",nome-etichetta: "Importazione singolo documento tecnico")
],
    estensioni:[
      - #use-case-label(codice: "UC 4",nome-etichetta: "Errore nell'importazione")
      ],
    generalizzazioni:none,    
    path-immagine-diagramma:"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/immagini/UC3.drawio.png",
    figure-caption: "UC-01"
)

#use-case-template(
    codice:"UC-03.1",
    nome:"Importazione singolo documento tecnico",
    livello-intestazione:base-level+1,
    attore-principale:"Utente",
    scenario-principale:[
      + L'utente seleziona il file da importare
      + Il sistema esegue controlli generici di validità sui file #sym.arrow #use-case-label(codice: "UC-05",nome-etichetta: "Controllo generico documento tecnico")
      + Il sistema interpreta il file #sym.arrow
      + Il sistema salva internamente le informazioni lette dai file 
    ],
    pre-condizioni:[
      - L'utente è autenticato correttamente
      ],
    post-condizioni:[
      - Il sistema ha caricato correttamente le informazioni contenute nel documento 
      ],
    scenari-alternativi:[
      - L'utente seleziona un file non valido #sym.arrow
      - L'utente seleziona un file contente informazioni strutturate in modo non valido #sym.arrow
      ],
    inclusioni:[
      - 
    ],
    estensioni:[
      - 
      ],
    generalizzazioni:none,    
)





#use-case-template(
    codice:"UC-06.1",
    nome:"Controllo della struttura interna di un documento tecnico .json",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema ha importato un file .json
      + Il sistema verifica la presenza di tutti i campi obbligatori
      + Il sistema salva il risultato del controllo
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente è autenticato correttamente
      - L'utente ha importato un documento .json
      ],
    post-condizioni:[
      - Il sistema ha salvato il risultato dei controlli
      - Il sistema ha salvato gli errori incontrati
      ],
    generalizzazioni:none,    
)

#use-case-template(
    codice:"UC-06.2",
    nome:"Controllo della struttura interna di un documento tecnico .xml",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema ha importato un file .xml
      + Il sistema verifica la presenza di tutti i campi obbligatori
      + Il sistema salva il risultato del controllo
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente è autenticato correttamente
      - L'utente ha importato un documento .xml
      ],
    post-condizioni:[
      - Il sistema ha salvato il risultato dei controlli
      - Il sistema ha salvato gli errori incontrati
      ],
    generalizzazioni:none,    
)
#use-case-template(
    codice:"UC-06.3",
    nome:"Controllo della struttura interna di un documento tecnico .csv",
    livello-intestazione:base-level,
    attore-principale:"Utente",
    scenario-principale:[
      + Il sistema ha importato un file .csv
      + Il sistema verifica la presenza di tutti i campi obbligatori
      + Il sistema salva il risultato del controllo
    ],
    pre-condizioni:[
      - Il sistema è attivo
      - L'utente è autenticato correttamente
      - L'utente ha importato un documento csv
      ],
    post-condizioni:[
      - Il sistema ha salvato il risultato dei controlli
      - Il sistema ha salvato gli errori incontrati
      ],
    generalizzazioni:none,    
)















#rect(fill:red,width:100%)[ #strong(text("Use case ancora da sistemare",fill:white))]







=== UC3: Importazione documenti tecnici del dispositivo
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente è autenticato e si trova nella schermata principale;
- *Postcondizioni*: I documenti tecnici sono stati caricati correttamente e gli asset identificati;
- *Trigger*: L'utente seleziona l'opzione per importare i documenti tecnici;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente accede alla funzionalità di importazione documenti;
    + Il sistema apre l'interfaccia di selezione file;
    + L'utente seleziona uno o più file;
    + Il sistema valida i file selezionati;
    + Il sistema carica i documenti;
    + Il sistema identifica tutti gli asset presenti;
    + Il sistema mostra un messaggio di conferma;
    + Il sistema visualizza un riepilogo delle informazioni importate.
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC4*: Errore file vuoto;
    + *UC5*: Errore file di dimensione eccessiva;
    + *UC6*: Errore nel parsing di funzionalità;
  ]

=== UC4: Errore file vuoto
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un file per l'importazione;
- *Postcondizioni*: Viene visualizzato un messaggio di errore;
- *Trigger*: Il sistema rileva che il file è vuoto;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema tenta di aprire il file;
    + Il sistema rileva che il file è vuoto;
    + Il sistema interrompe l'importazione;
    + Il sistema visualizza un messaggio di errore specifico;
    + L'utente può tentare nuovamente l'importazione con un file diverso (*UC3*).
  ]

=== UC5: Errore file di dimensione eccessiva
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato un file per l'importazione;
- *Postcondizioni*: Viene visualizzato un messaggio di errore;
- *Trigger*: Il sistema rileva che il file supera le dimensioni massime consentite;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema verifica la dimensione del file;
    + Il sistema rileva che il file è troppo grande;
    + Il sistema interrompe l'importazione;
    + Il sistema visualizza un messaggio di errore con la dimensione massima consentita;
    + L'utente può tentare nuovamente l'importazione con un file più piccolo (*UC3*).
  ]

=== UC6: Errore nel parsing di funzionalità
- *Attore Principale*: Utente;
- *Precondizioni*: Il sistema sta processando un file importato;
- *Postcondizioni*: Viene visualizzato un report degli errori e l'utente può completare manualmente;
- *Trigger*: Il sistema rileva errori durante l'estrazione delle funzionalità/asset;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema tenta di estrarre le funzionalità/asset;
    + Il sistema rileva errori nel parsing di alcune sezioni;
    + Il sistema completa l'importazione delle parti valide;
    + Il sistema genera un report dettagliato degli errori;
    + Il sistema visualizza il report all'utente;
    + L'utente può completare manualmente le informazioni mancanti (*UC15*).
  ]

=== UC7: Avvio dell'esecuzione di un decision tree
/*#figure(
  image("immagini/UC7.png", width: 80%),
  caption: [Avvio dell'esecuzione di un decision tree]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: I decision tree sono stati caricati e gli asset identificati;
- *Postcondizioni*: Si apre la compilazione di un decision tree;
- *Trigger*: L'utente seleziona un requisito da verificare;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente visualizza la dashboard dei requisiti;
    + L'utente seleziona un asset;
    + L'utente seleziona un requisito da verificare;
    + Il sistema apre la schermata di compilazione;
    + Il sistema mostra la prima domanda del decision tree.
  ]

=== UC8: Navigazione di un decision tree
- *Attore Principale*: Utente;
- *Precondizioni*: È stata aperta la compilazione di un requisito;
- *Postcondizioni*: Si passa al nodo successivo o si raggiunge uno stato terminale;
- *Trigger*: L'utente seleziona una risposta;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente legge la domanda mostrata dal sistema;
    + L'utente seleziona la risposta corretta;
    + Il sistema naviga nel prossimo nodo dell'albero mostrando la relativa domanda.
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC9*: Raggiungimento stato NOT APPLICABLE;
    + *UC10*: Raggiungimento stato FAIL;
    + *UC11*: Raggiungimento stato PASS;
  ]


=== UC9: Raggiungimento stato NOT APPLICABLE
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente risponde ad un nodo e il sistema arriva in uno stato NOT APPLICABLE;
- *Postcondizioni*: Il sistema ferma la compilazione dell'albero e segnala che non è necessario continuarla;
- *Trigger*: il sistema raggiunge uno stato NOT APPLICABLE;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente risponde 'Yes/No' ad un nodo;
    + Il sistema naviga nell'albero in base alla risposta;
    + Il sistema arriva in uno stato NOT APPLICABLE;
    + Il sistema esce e segnala il requisito come NOT APPLICABLE;
    + Il sistema blocca i requisiti che dipendono da questo requisito;
    + Il sistema, se ce ne sono, mostra gli altri requisiti da verificare.
  ]

=== UC10: Raggiungimento stato FAIL
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente risponde ad un nodo e il sistema arriva in uno stato FAIL;
- *Postcondizioni*: Il sistema blocca l'esecuzione e segnala una falla di sicurezza per quel requisito;
- *Trigger*: il sistema raggiunge uno stato FAIL;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente risponde 'Yes/No' ad un nodo;
    + Il sistema naviga nell'albero in base alla risposta;
    + Il sistema arriva in uno stato FAIL;
    + Il sistema esce e segnala il requisito come FAIL;
    + Il sistema blocca i requisiti che dipendono da questo requisito;
    + Il sistema, se ce ne sono, mostra gli altri requisiti da verificare.
  ]


=== UC11: Raggiungimento stato PASS
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente risponde ad un nodo e il sistema arriva in uno stato PASS;
- *Postcondizioni*: Il sistema segnala che la verifica del requisito è andata a buon fine;
- *Trigger*: il sistema raggiunge uno stato PASS;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente risponde 'Yes/No' ad un nodo;
    + Il sistema naviga nell'albero in base alla risposta;
    + Il sistema arriva in uno stato PASS;
    + Il sistema segnala all'utente che l'albero è terminato e il requisito è stato superato;
    + Il sistema esce, mostra eventuali altri requisiti dello stesso livello e, se ce ne sono, sblocca i livelli successivi che dipendono dal requisito appena verificato.
  ]

=== UC12: Navigazione al passo precedente durante l'esecuzione di un decision tree
/*#figure(
  image("immagini/UC12.png", width: 80%),
  caption: [Navigazione al passo precedente]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente sta eseguendo un decision tree e ha risposto ad almeno una domanda;
- *Postcondizioni*: Il sistema torna alla domanda precedente e la risposta può essere modificata;
- *Trigger*: L’utente seleziona il pulsante «Passo precedente»;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente sta rispondendo alle domande di un decision tree;
    + Il sistema ha presentato una domanda;
    + L'utente seleziona il pulsante "Passo precedente";
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
    + *UC13*: Gestione prima domanda (pulsante disabilitato);
  ]

=== UC13: Gestione prima domanda
- *Attore Principale*: Utente;
- *Precondizioni*: Visualizzazione della prima domanda;
- *Postcondizioni*: Pulsante "Indietro" disabilitato, opzione "Torna a dashboard" aggiunta;
- *Trigger*: L’utente seleziona il pulsante «Passo precedente» mentre si trova alla prima domanda;
- *Scenario Principale*:#pad(left: 1em)[
#v(-0.5em)
   + Sistema disabilita "Passo precedente";
   + Il sistema mostra il pulsante "Torna a dashboard";
   + L'utente può annullare esecuzione;
  ]


=== UC14: Terminazione verifica di requisiti per un asset
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha compilato tutti i decision tree di un asset;
- *Postcondizioni*: Il sistema fornisce il resoconto delle operazioni;
- *Trigger*: Il sistema rileva che i requisiti sono stati tutti verificati, ciò include anche i casi N.A. e FAIL;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema conclude la compilazione di un decision tree;
    + Il sistema rileva che non ci sono altri requisiti da verificare;
    + Il sistema comunica all'utente che la verifica è terminata ed esce dalla pagina di verifica dei requisiti dell'asset;
    + L'utente riceve un resoconto dettagliato delle operazioni e, se ce ne sono, mostra gli altri asset del dispositivo.
  ]


=== UC15: Modifica di un decision tree tramite editor grafico
/*#figure(
  image("immagini/UC14.png", width: 80%),
  caption: [Modifica di un decision tree tramite editor grafico]
)*/
- *Attore Principale*: responsabile tecnico;
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
- *Sottocasi d'uso*:#pad(left: 1em)[
    #v(-0.5em)
    - *UC15.1*: Modifica testo delle domande;
    - *UC15.2*: Modifica delle connessioni tra nodi;
    - *UC15.3*: Aggiunta di nuovi nodi;
    - *UC15.4*: Eliminazione di nodi;
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC16*: Struttura del decision tree non valida dopo la modifica;
  ]

==== UC15.1: Modifica testo delle domande
- *Attore Principale*: responsabile tecnico;
- *Precondizioni*: Un nodo domanda è stato selezionato;
- *Postcondizioni*: Il testo della domanda è stato modificato;
- *Trigger*: Il responsabile tecnico desidera cambiare il testo;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il responsabile tecnico seleziona un nodo domanda;
    + Il sistema mostra un editor di testo;
    + Il responsabile tecnico modifica il testo;
    + Il responsabile tecnico conferma le modifiche;
    + Il sistema aggiorna la visualizzazione.
  ]
==== UC15.2: Modifica delle connessioni tra nodi
- *Attore Principale*: responsabile tecnico;
- *Precondizioni*: L'editor grafico è aperto;
- *Postcondizioni*: Le connessioni tra nodi sono state modificate;
- *Trigger*: Il responsabile tecnico desidera cambiare i percorsi;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il responsabile tecnico seleziona una connessione;
    + Il responsabile tecnico può:
      - Eliminare la connessione;
      - Modificare il nodo di destinazione;
      - Cambiare la condizione (Yes/No);
    + Il responsabile tecnico conferma le modifiche;
    + Il sistema aggiorna la struttura.
  ]

==== UC15.3: Aggiunta di nuovi nodi
- *Attore Principale*: responsabile tecnico;
- *Precondizioni*: L'editor grafico è aperto;
- *Postcondizioni*: Un nuovo nodo è stato aggiunto;
- *Trigger*: Il responsabile tecnico seleziona "Aggiungi nodo";
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il responsabile tecnico clicca su "Aggiungi nodo";
    + Il sistema richiede il tipo (domanda/terminale);
    + Il responsabile tecnico seleziona il tipo;
    + Il sistema crea il nuovo nodo;
    + Il responsabile tecnico inserisce il contenuto;
    + Il responsabile tecnico crea le connessioni;
    + Il sistema aggiorna la visualizzazione.
  ]

==== UC15.4: Eliminazione di nodi
- *Attore Principale*: responsabile tecnico;
- *Precondizioni*: Un nodo è stato selezionato;
- *Postcondizioni*: Il nodo è stato eliminato;
- *Trigger*: Il responsabile tecnico seleziona "Elimina nodo";
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il responsabile tecnico seleziona un nodo;
    + Il responsabile tecnico clicca su "Elimina";
    + Il sistema mostra un messaggio di conferma;
    + Il responsabile tecnico conferma;
    + Il sistema rimuove il nodo e le connessioni;
    + Il sistema aggiorna la visualizzazione.
  ]

=== UC16: Struttura del decision tree non valida dopo la modifica
- *Attore Principale*: responsabile tecnico;
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
    + Il responsabile tecnico corregge le anomalie segnalate (torna al punto 5 di *UC15*).

  ]

=== UC17: Visualizzazione degli asset
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha importato correttamente i documenti;
- *Postcondizioni*: Apertura della lista degli asset;
- *Trigger*: L’utente seleziona un dispositivo per il quale sono stati caricati i documenti;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema mostra un'icona nella home che indica l'area di lavoro per uno specifico dispositivo, di cui si sono caricati i documenti;
    + L'utente clicca sull'icona;
    + Vengono mostrati tutti gli asset del dispositivo e il loro stato di lavorazione.
  ]

=== UC18: Visualizzazione dei requisiti per un asset
/*#figure(
  image("immagini/UC5.png", width: 80%),
  caption: [Visualizzazione della dashboard dei requisiti]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: I documenti sono stati caricati correttamente e sono visibili tutti gli asset di un dispositivo;
- *Postcondizioni*: L'utente visualizza i requisiti da verificare per quell'asset;
- *Trigger*: L’utente seleziona un asset dalla lista degli asset disponibili;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente seleziona un asset che vuole verificare;
    + Vengono visualizzati i requisiti da verificare per quell'asset secondo la gerarchia corretta.
  ]

=== UC19: Modifica delle caratteristiche degli asset
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
    + *UC20*: Visualizzazione errore nella validazione dei dati dell'asset.
  ]

=== UC20: Visualizzazione errore nella validazione dei dati dell'asset
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

=== UC21: Aggiunta di un nuovo asset tramite interfaccia
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha caricato un file di configurazione del dispositivo o ha aperto una valutazione esistente;
- *Postcondizioni*: Il nuovo asset viene aggiunto al dispositivo e tutti i decision tree standard vengono associati ad esso;
- *Trigger*: L’utente seleziona l’opzione «Aggiungi nuovo asset»;
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
    + Il sistema aggiorna la dashboard mostrando il nuovo asset.
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC20*: Visualizzazione errore nella validazione dei dati dell'asset.
  ]

=== UC22: Eliminazione di un asset tramite interfaccia
/*#figure(
  image("immagini/UC34.png", width: 80%),
  caption: [Eliminazione di un asset tramite interfaccia]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha caricato un file di configurazione del dispositivo con almeno un asset;
- *Postcondizioni*: L'asset selezionato viene rimosso dal dispositivo e tutti i decision tree associati vengono eliminati;
- *Trigger*: L'utente seleziona l'opzione «Elimina asset»;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    + L'utente accede alla sezione di gestione degli asset;
    + L'utente seleziona un asset dalla lista;
    + L'utente seleziona l'opzione "Elimina asset";
    + Il sistema mostra un messaggio di conferma che avvisa:
      - L'asset verrà rimosso definitivamente;
      - Tutti i decision tree e i risultati associati a quell'asset verranno eliminati;
    + L'utente conferma l'eliminazione;
    + Il sistema rimuove l'asset selezionato;
    + Il sistema elimina tutte le verifiche e i risultati associati all'asset;
    + Il sistema aggiorna la dashboard rimuovendo l'asset dalla lista;
    + Il sistema ricalcola le statistiche complessive del dispositivo.
  ]

=== UC23: Salvataggio degli asset in un file
/*#figure(
  image("immagini/UC19.png", width: 80%),
  caption: [Salvataggio degli asset in un file]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha aggiunto, modificato o eliminato uno o più asset;
- *Postcondizioni*: Un file contenente tutti gli asset viene generato e salvato;
- *Trigger*: L'utente seleziona l'opzione di esportazione configurazione asset;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente accede alla funzione di esportazione configurazione asset;
    + Il sistema presenta le opzioni di formato disponibili (CSV, XML, JSON);
    + L'utente seleziona il formato desiderato;
    + L'utente specifica il percorso di salvataggio;
    + Il sistema genera il file contenente le informazioni del dispositivo e la lista completa degli asset;
    + Il sistema salva il file nel percorso specificato;
    + Il sistema notifica l'utente del completamento dell'operazione.
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC*: Visualizzazione errore durante il salvataggio del file;
  ]

=== UC24: Aggiunta giustificazione ad un risultato N/A (Not Applicable)
/*#figure(
image("immagini/UC12.png", width: 80%),
caption: [Aggiunta giustificazione a un risultato]
)*/
- *Attore Principale*: Utente;
- *Precondizioni*: Un requisito è stato valutato e ha prodotto il risultato N/A (Not Applicable);
- *Postcondizioni*: La giustificazione viene associata al risultato e salvata;
- *Trigger*: L’utente seleziona l’opzione per aggiungere una giustificazione al risultato N/A;
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


=== UC25: Esportazione dei risultati
/*#figure(
image("immagini/UC11.png", width: 80%),
caption: [Aggiunta giustificazione a un risultato]
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
    + Il sistema notifica all'utente il completamento dell'esportazione e la posizione del file;
    + La compilazione viene messa in stand by se non sono stati verificati tutti gli asset del dispositivo.
  ]

=== UC26: Apertura cronologia
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente si trova nella Home o nell'Area utente;
- *Postcondizioni*: Visualizzazione della cronologia
- *Trigger*: L’utente seleziona il pulsante «Cronologia»;
- *Scenario Principale*:#pad(left: 1em)[
#v(-0.5em)
   + L'utente si trova in home o in area utente e clicca il tasto cronologia;
   + Il sistema apre la cronologia dei dispositivi verificati, è possibile vederci lo stato (verificati o in lavorazione) e aprirli per vedere asset->requisiti.
]
- *Scenari Alternativi*:#pad(left: 1em)[
#v(-0.5em)
   + *UC 27*: Selezione di un asset dalla cronologia.
]

==== UC27: Selezione di un asset dalla cronologia
- *Attore Principale*: Utente;
- *Precondizioni*: Essere nella cronologia di un dispositivo;
- *Postcondizioni*: Apertura della vista dei requisiti dell'asset;
- *Trigger*: L'utente seleziona un asset dalla cronologia dei dispositivi verificati;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente si trova nella cronologia;
    + L'utente seleziona un dispositivo;
    + Il sistema mostra gli asset del dispositivo;
    + L'utente seleziona un asset;
    + Il sistema apre la vista dei requisiti per quell'asset.
  ]

=== UC28: Interruzione della valutazione in corso
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente sta eseguendo la valutazione di uno o più requisiti che non è ancora stata completata;
- *Postcondizioni*: Lo stato corrente della valutazione viene salvato automaticamente e contrassegnato come "In corso";
- *Trigger*: L'utente desidera interrompere temporaneamente la sessione di valutazione;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. L'utente richiede di uscire dalla sessione di valutazione corrente;
    2. Il sistema verifica che la valutazione non sia completata;
    3. Il sistema esegue il salvataggio automatico dello stato corrente;
    4. Il sistema contrassegna la sessione come "In corso" nei metadati;
    5. Il sistema reindirizza l'utente alla dashboard principale;
    6. La valutazione interrotta rimane disponibile per essere ripresa in seguito.
]
- *Scenari Alternativi*:#pad(left: 1em)[
  #v(-0.5em)
    1. *UC28*: Visualizzazione errore durante il salvataggio automatico;
]

=== UC29: Visualizzazione errore durante il salvataggio automatico
- *Attore Principale*: Utente;
- *Precondizioni*: Il sistema ha tentato di salvare lo stato della valutazione interrotta;
- *Postcondizioni*: Viene visualizzato un messaggio di errore e l'utente può scegliere come procedere;
- *Trigger*: Si verifica un errore durante l'operazione di salvataggio automatico;
- *Scenario Principale*:#pad(left: 1em)[
  #v(-0.5em)
    1. Il sistema tenta di salvare lo stato della valutazione;
    2. Si verifica un errore (spazio insufficiente, permessi mancanti, errore di I/O);
    3. Il sistema visualizza un messaggio di errore dettagliato;
    4. Il sistema presenta le opzioni disponibili:
        - Ritentare il salvataggio;
        - Uscire senza salvare (con conferma esplicita);
    5. L'utente seleziona un'opzione;
    6. Il sistema procede in base alla scelta effettuata.
]

=== UC30: Caricamento di un test di conformità precedente
- *Attore Principale*: Utente;
- *Precondizioni*: Esiste almeno un file di test salvato in precedenza;
- *Postcondizioni*: Il test di conformità viene caricato nel sistema nella modalità selezionata;
- *Trigger*: L'utente seleziona l'opzione «Carica test precedente»;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + L'utente accede alla funzionalità di caricamento test;
    + L'utente seleziona l'opzione "Carica test precedente";
    + Il sistema richiede la selezione del file del test;
    + L'utente seleziona il file dal file system locale;
    + Il sistema valida il formato e la struttura del file;
    + Il sistema richiede la modalità di apertura;
    + L'utente seleziona la modalità desiderata;
    + Il sistema carica il test completo (configurazione dispositivo, asset, decision tree con risultati, giustificazioni);
    + Il sistema configura l'interfaccia in base alla modalità selezionata;
    + Il sistema visualizza la dashboard con tutti i requisiti e i loro stati;
  ]
- *Sottocasi d'uso*:#pad(left: 1em)[
    #v(-0.5em)
    - *UC30.1*: Apertura in modalità lettura;
    - *UC30.2*: Apertura in modalità modifica;
  ]
- *Scenari Alternativi*:#pad(left: 1em)[
    #v(-0.5em)
    + *UC31*: Visualizzazione errore nel caricamento del test;
  ]

==== UC30.1: Apertura in modalità lettura
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato "Modalità Lettura";
- *Postcondizioni*: Il test viene caricato in modalità sola lettura;
- *Trigger*: L'utente ha confermato la modalità lettura;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema carica tutti i dati del test;
    + Il sistema configura l'interfaccia in modalità sola lettura:
      - Disabilita tutti i pulsanti di modifica;
      - Disabilita l'aggiunta/eliminazione di asset;
      - Disabilita la modifica dei risultati;
      - Disabilita la modifica delle giustificazioni;
    + Il sistema visualizza i dati in formato consultabile;
    + L'utente può solo visualizzare i contenuti senza modificarli.
  ]

==== UC30.2: Apertura in modalità modifica
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha selezionato "Modalità Modifica";
- *Postcondizioni*: Il test viene caricato in modalità completamente modificabile;
- *Trigger*: L'utente ha confermato la modalità modifica;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema carica tutti i dati del test;
    + Il sistema configura l'interfaccia in modalità modifica:
      - Abilita tutti i pulsanti di modifica;
      - Abilita l'aggiunta/eliminazione di asset;
      - Abilita la modifica dei risultati;
      - Abilita la modifica delle giustificazioni;
    + Il sistema rende tutti i dati completamente modificabili;
    + L'utente può modificare qualsiasi aspetto del test caricato.
  ]
 
=== UC31: Visualizzazione errore nel caricamento del test
- *Attore Principale*: Utente;
- *Precondizioni*: L'utente ha tentato di aprire un test salvato;
- *Postcondizioni*: Viene visualizzato un messaggio di errore;
- *Trigger*: Il sistema incontra un errore durante il caricamento;
- *Scenario Principale*:#pad(left: 1em)[
    #v(-0.5em)
    + Il sistema rileva un errore (file corrotto, formato non compatibile, dati mancanti);
    + Il sistema visualizza un messaggio di errore descrittivo;
    + L'utente viene riportato alla schermata di selezione.
  ]