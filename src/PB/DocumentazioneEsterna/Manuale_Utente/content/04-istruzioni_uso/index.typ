== Dashboard Principale e Gestione Dispositivi

Al primo avvio dell'applicazione, in assenza di dati precedentemente inseriti, la schermata principale si presenta in uno *stato vuoto* (_empty state_).

#figure(
  image("../../screenshot/schermata_devices.png", width: 90%),
  caption: [Dashboard in stato iniziale (vuota)],
) <fig:dashboard-vuota>

Come mostrato in @fig:dashboard-vuota, per iniziare a utilizzare il sistema è sufficiente scegliere una delle due modalità disponibili:

- *Importazione da file:* Cliccare sul pulsante di importazione e caricare un file strutturato in formato JSON, XML o CSV contenente i dati del dispositivo e i relativi asset associati.
- *Inserimento manuale:* Cliccare sul pulsante di creazione e compilare la form con i dati fondamentali del dispositivo: nome, sistema operativo e descrizione.

== Inserimento e Importazione di un Dispositivo

Il sistema offre due modalità per aggiungere un dispositivo: l'*inserimento manuale* e l'*importazione da file*.

Per l'*inserimento manuale*, cliccare sul pulsante dedicato e compilare la form con i dati del dispositivo: nome, sistema operativo e descrizione. Tutti i campi potranno essere modificati in qualsiasi momento successivo alla creazione.

#figure(
  image("../../screenshot/schermata_creazione_device.png", width: 60%),
  caption: [Schermata di creazione manuale di un nuovo dispositivo],
)

Per l'*importazione da file*, cliccare sul pulsante di importazione e caricare un file in uno dei formati supportati: JSON, XML o CSV.

#figure(
  image("../../screenshot/schermata_caricamento_device.png"),
  caption: [Schermata di importazione di un dispositivo da file],
)
=== Elenco dei Dispositivi e Accesso alla Valutazione

Non appena uno o più dispositivi vengono creati o importati con successo, la dashboard si aggiorna dinamicamente mostrando l'elenco completo dei dispositivi presenti nel sistema.

#figure(
  image("../../screenshot/pagina_lista_dispositivi.png", width: 100%),
  caption: [Dashboard con elenco dei dispositivi presenti],
) <fig:dashboard-lista>

Come mostrato in @fig:dashboard-lista, ogni riga della tabella rappresenta un dispositivo tracciato e ne riepiloga i principali dati identificativi. Da questa schermata l'utente può:

+ *Aggiungere nuovi dispositivi:* Cliccare sul pulsante di inserimento manuale o importazione da file per registrare un nuovo dispositivo senza abbandonare la vista corrente.
+ *Accedere al dettaglio:* Cliccare sul pulsante *Dettagli Dispositivo* per aprire la schermata di dettaglio, dove sono disponibili l'anagrafica completa e tutte le azioni di gestione.

=== Inizializzazione dello Standard di Valutazione

Indipendentemente dalla modalità scelta, al momento della creazione ogni dispositivo viene automaticamente associato allo standard normativo *EVS-EN 18031-1:2024*. Lo standard è precaricato nel database e inizializzato tramite uno script eseguito all'avvio del container Docker, rendendo il _decision tree_ di valutazione immediatamente disponibile senza alcuna configurazione manuale da parte dell'utente. L'architettura è inoltre predisposta per adattarsi a eventuali revisioni future dello standard, rendendo sufficiente l'aggiornamento del riferimento normativo nel sistema senza impatti sulla struttura applicativa.

=== Controllo di Integrità e Gestione dei Duplicati

Per garantire l'unicità dei dati nel sistema, l'applicazione adotta una strategia *_fail-fast_*: qualora un dispositivo con lo stesso identificativo risulti già presente nel database, l'operazione viene immediatamente bloccata e l'interfaccia notifica l'utente con un messaggio di errore esplicito, come illustrato in @fig:duplicato.

#figure(
  image("../../screenshot/caricamento_duplicato.png", width: 45%),
  caption: [Messaggio di errore in caso di dispositivo duplicato],
) <fig:duplicato>

== Dettaglio Dispositivo

La pagina di dettaglio raccoglie tutte le informazioni anagrafiche del dispositivo selezionato, organizzate in tre sezioni: *Informazioni Generali* (nome e sistema operativo), *Descrizione e Funzionalità* e *Contesto Normativo* (modello e versione dello standard associato).\ Da questa pagina è possibile:
+ Avviare la valutazione;
+ Modificare l'anagrafica;
+ Esportare il dispositivo;
+ Eliminare il dispositivo.
\
#figure(
  image("../../screenshot/schermata_dettaglio_device.png", width: 70%),
  caption: [Schermata di dettaglio di un dispositivo],
)

=== Modifica del Dispositivo

Per modificare un dispositivo, cliccare su *Modifica Dispositivo*: si apre una form precompilata con i dati attuali, dove è possibile aggiornare nome, sistema operativo e descrizione. I campi nome e sistema operativo sono obbligatori (max 64 caratteri), mentre la descrizione è facoltativa (max 512 caratteri). Cliccare *Salva Modifiche* per confermare o *Annulla* per tornare al dettaglio senza salvare.

#figure(
  image("../../screenshot/modifica_dispositivo.png", width: 60%),
  caption: [Schermata di modifica di un dispositivo],
) <fig:modifica-device>

=== Esportazione del Dispositivo

Per esportare il dispositivo, cliccare su *Esporta Dispositivo*, selezionare il formato desiderato tra JSON, XML o CSV tramite il menu a tendina e confermare l'operazione.

#figure(
  image("../../screenshot/esporta_dispositivo.png", width: 40%),
  caption: [Dialog di esportazione del dispositivo],
) <fig:esporta-device>

=== Eliminazione del Dispositivo

Per eliminare il dispositivo, cliccare su *Elimina*: il sistema mostra una finestra di conferma che avvisa dell'irreversibilità dell'operazione. Prima di procedere è possibile esportare una copia del dispositivo selezionando il formato e cliccando *Esporta*. Cliccare nuovamente *Elimina* per confermare o *Annulla* per tornare al dettaglio.

#figure(
  image("../../screenshot/elimina_dispositivo.png", width: 60%),
  caption: [Dialog di conferma eliminazione del dispositivo],
) <fig:elimina-device>

== Sessione di Valutazione
Avviando la valutazione dalla pagina di dettaglio dispositivo, l'utente viene reindirizzato alla schermata di valutazione del dispositivo. In alto a sinistra vengono riportati il nome del dispositivo, il sistema operativo e l'*Esito Globale* della valutazione corrente (ad esempio _pass_ o _fail_), aggiornato dinamicamente in base allo stato degli asset analizzati.

#figure(
  image("../../screenshot/pagina_valutazione_device.png", width: 100%),
  caption: [Schermata di valutazione del dispositivo],
) <fig:valutazione-device>

Come mostrato in @fig:valutazione-device, la schermata è suddivisa in due aree principali:

- *Gestione Asset:* La tabella elenca tutti gli asset associati al dispositivo, ciascuno con nome, tipologia (ad esempio _network_ o _security_) e stato di valutazione corrente (_PASS_, _FAIL_ o _Pending_). Per ciascun asset è disponibile il pulsante *Valuta*, che consente di aprire il _decision tree_ corrispondente e compilare o aggiornare la valutazione. Tramite il pulsante *+ Aggiungi Asset* è possibile registrare nuovi asset direttamente dalla sessione.

- *Azioni di sessione:* In alto a destra sono disponibili i controlli per salvare, chiudere la sessione e generare il report di conformità in PDF, descritti in dettaglio nella @sec:gestione-sessione.

=== Aggiunta di un Asset

Per aggiungere un nuovo asset, cliccare il pulsante *+ Aggiungi Asset*, compilare la form con nome, tipologia e descrizione, quindi cliccare *Salva*. L'asset verrà aggiunto immediatamente alla lista e sarà pronto per essere valutato.

#figure(
  image("../../screenshot/schermata_creazione_asset.png", width: 60%),
  caption: [Schermata di creazione di un nuovo asset],
)

== Dettaglio Asset e Valutazione dei Requisiti

Cliccando su *Valuta* nella lista degli asset della sessione, l'utente accede alla pagina di dettaglio dell'asset. La pagina presenta un riepilogo (_Summary_) con lo stato aggregato della valutazione, la tipologia e la descrizione dell'asset, seguito dalla *lista completa dei requisiti* applicabili, ciascuno con il proprio stato corrente (_Pending_, _Pass_, _Fail_ o _N.A._) e il link *Vai al requisito →* per avviare o riprendere la valutazione interattiva.

#figure(
  image("../../screenshot/pagina_dettaglio_asset.png", width: 90%),
  caption: [Pagina di dettaglio di un asset con lista dei requisiti],
) <fig:dettaglio-asset>

Dalla stessa pagina è possibile gestire l'asset tramite i pulsanti in fondo alla schermata:

- *Modifica Asset:* Apre una form precompilata con i dati attuali dell'asset (nome, tipologia e descrizione), modificabili e salvabili tramite *Salva Asset* o annullabili tramite *Annulla*.
#figure(
  image("../../screenshot/pagina_modifica_asset.png", width: 50%),
  caption: [Form di modifica di un asset],
) <fig:modifica-asset>
- *Elimina:* Mostra una finestra di conferma che avvisa dell'irreversibilità dell'operazione, richiedendo una conferma esplicita prima di procedere con la cancellazione.

#figure(
  image("../../screenshot/pagina_elimina_asset.png", width: 50%),
  caption: [Dialog di conferma eliminazione di un asset],
) <fig:elimina-asset>

=== Valutazione di un Requisito tramite Decision Tree

Cliccando su *Vai al requisito →*, l'utente accede alla pagina di valutazione interattiva del requisito, composta da tre aree principali:

- *Intestazione del requisito:* Mostra identificativo, nome, descrizione normativa, target di applicazione e la lista delle dipendenze da altri requisiti. Ogni dipendenza è cliccabile per navigare direttamente al requisito collegato. Le dipendenze hanno un impatto diretto sulla valutazione: se un requisito da cui dipende il corrente risulta _Fail_, anche il requisito dipendente viene automaticamente marcato come _Fail_, indipendentemente dalle risposte fornite. È inoltre presente un badge con lo stato corrente della valutazione (_Pending_, _Pass_, _Fail_ o _N.A._).

- *Canvas del Decision Tree:* Visualizzazione grafica e interattiva dell'albero decisionale del requisito. Il nodo attivo, evidenziato in azzurro, può essere selezionato per visualizzare la domanda corrispondente nel pannello laterale.

- *Pannello laterale delle domande:* Mostra il testo completo della domanda relativa al nodo selezionato, i pulsanti di risposta (*Yes* / *No*) e i controlli di navigazione per scorrere il percorso già compilato. È presente inoltre un campo *Justification*, opzionale, in cui inserire una nota a supporto della valutazione, salvabile tramite l'apposito pulsante.

#figure(
  image("../../screenshot/pagina_valutazione_requisito.png", width: 100%),
  caption: [Schermata di valutazione interattiva del requisito],
) <fig:valutazione-requisito>

#figure(
  image("../../screenshot/pagina_valutazione_requisito_fail.png", width: 100%),
  caption: [Schermata di valutazione con esito Fail],
) <fig:valutazione-requisito-fail>

=== Gestione dell'Esito N.A. e Comportamento delle Dipendenze

Un requisito che raggiunge un nodo _Not Applicable_ viene marcato come *N.A.* solo se è presente una giustificazione nel campo apposito: in assenza di giustificazione, il sistema lo considera automaticamente *Fail*. Aggiungendo una giustificazione, lo stato viene correttamente aggiornato a _N.A._, che ai fini del calcolo dell'esito finale viene equiparato a _Pass_.

Una volta raggiunto un nodo foglia, il pannello laterale mostra il risultato della valutazione (_Pass_, _Fail_ o _Not Applicable_) e un link *Torna alla lista Requisiti* per tornare alla schermata riassuntiva dell'asset e proseguire con i requisiti rimanenti.

#figure(
  image("../../screenshot/schermata_fine_valutazione_requisito.png", width: 40%),
  caption: [Pannello laterale con esito finale della valutazione del requisito],
) <fig:fine-valutazione-requisito>

=== Calcolo dello Stato Aggregato

Al termine della valutazione di tutti i requisiti, il sistema calcola lo *stato aggregato* dell'asset secondo le seguenti regole:

- Se tutti i requisiti risultano *Pass* o *N.A.*, lo stato aggregato dell'asset è *Pass*.
- Se anche un solo requisito risulta *Fail*, lo stato aggregato dell'asset è *Fail*.
- Un asset con stato *Fail* determina a sua volta il *Fail* dell'intera valutazione di conformità del dispositivo.

Questo meccanismo garantisce che qualsiasi non conformità, anche parziale, si propaghi correttamente fino all'esito globale della valutazione.

=== Gestione della Sessione di Valutazione <sec:gestione-sessione>

Quando si avvia una nuova valutazione, il sistema apre una *sessione dedicata* al dispositivo selezionato. All'interno della sessione è possibile valutare esclusivamente quel dispositivo: non è consentito navigare verso altre aree dell'applicazione senza prima chiudere la sessione corrente.

#figure(
  image("../../screenshot/header_sessione.png", width: 60%),
  caption: [Header della sessione di valutazione con i controlli principali],
) <fig:header-sessione>

Come mostrato in @fig:header-sessione, in alto a destra sono disponibili quattro controlli per la gestione della sessione:

- *Salva Sessione:* Salva tutte le modifiche effettuate durante la sessione corrente senza chiuderla, permettendo di continuare la valutazione in un secondo momento.
- *Chiudi Sessione:* Chiude la sessione e reindirizza l'utente alla lista dei dispositivi, da cui è possibile riprendere la sessione corrente o avviarne una nuova su un altro dispositivo. Se sono presenti modifiche non salvate, il sistema mostra un messaggio di avviso prima di procedere.
- *Salva e Chiudi:* Salva le modifiche e chiude la sessione in un'unica operazione, reindirizzando direttamente alla lista dei dispositivi.
- *Genera Report PDF:* Produce un report in formato PDF con il riepilogo completo della valutazione nello stato attuale.

== Generazione del Report di Conformità

La generazione del report rappresenta il punto di arrivo dell'intero flusso di valutazione. Tramite il pulsante *Genera Report PDF*, disponibile in qualsiasi momento nella dashboard della sessione, il sistema produce automaticamente un documento PDF strutturato a partire dai dati raccolti durante la valutazione.

#figure(
  image("../../screenshot/report.png", width: 70%),
  caption: [Anteprima del Report di Conformità generato],
) <fig:report-pdf>

Come illustrato in @fig:report-pdf, il report è organizzato in due sezioni principali:

- *Informazioni Dispositivo:* Riporta nome, sistema operativo, descrizione, standard applicato e il verdetto complessivo della valutazione (_Pass_ o _Fail_).
- *Dettaglio per Asset:* Per ciascun asset valutato vengono riportati tipologia, descrizione, stato aggregato e l'elenco dei singoli requisiti con il relativo esito e le note giustificative inserite durante la valutazione.

Questo documento costituisce il *cuore dell'applicazione*: il suo scopo principale è quello di facilitare e automatizzare la redazione dei report di conformità alla norma EVS-EN 18031-1:2024, eliminando la necessità di compilare manualmente la documentazione richiesta e fornendo un output direttamente utilizzabile in contesti di audit e certificazione.