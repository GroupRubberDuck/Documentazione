== Diagrammi di sequenza
La seguente sezione illustra il comportamento dinamico del sistema tramite diagrammi di sequenza, focalizzandosi sui casi d'uso di maggiore interesse. Questi modelli descrivono l'ordine cronologico dei messaggi scambiati tra gli attori esterni, i componenti infrastrutturali e il nucleo applicativo.

=== UC05 - Importazione dispositivo
#image("uml/png/importazione_dispositivo_uc05-06.png");
Il diagramma di sequenza illustra il processo di importazione e sanificazione di un dispositivo. Il diagramma evidenzia il flusso protetto attraverso i layer dell'Architettura Esagonale, dal Boundary (Vue.js) fino al livello di persistenza, adottando un rigoroso approccio Fail-Fast: il sistema esegue inizialmente una validazione strutturale su attributi esterni, quali formato e dimensione del file, delegando esclusivamente al Dominio la verifica di conformità semantica dei dati rispetto ai requisiti della norma.

L'Adattatore Inbound utilizza un Data Transfer Object (DTO) per la validazione strutturale. In seguito, è il Servizio che disaccoppia i dati puliti e li inietta nel Dominio, demandando a quest'ultimo la sola validazione semantica (regole normative).

Tramite l'uso di due Alternative Sequence Fragment (alt), il diagramma modella la robustezza del sistema e la gestione degli errori (UC06): il primo blocco intercetta i payload malformati arrestando il flusso ai confini dell'esagono (HTTP 400); il secondo gestisce le violazioni delle regole di business sollevate dal nucleo applicativo (HTTP 422). Solo se l'entità supera entrambi i controlli, il sistema invoca la porta di uscita per il salvataggio e chiude l'operazione con successo.

=== UC26, UC27 - Valutazione di un nodo e transizione di stato
#image("uml/png/Valutazione_e_transizione_stato_uc26-27.png");

Il diagramma di sequenza illustra il flusso principale di interazione durante la valutazione di un dispositivo secondo la norma EN18031.
Il diagramma evidenzia il rigoroso attraversamento dei layer architettonici, dal Boundary (Vue.js) fino al driver di persistenza (PyMongo).

Degno di nota è l'isolamento del livello Domain: il frontend e gli adapter non conoscono le regole normative.
È il Servizio applicativo che recupera lo stato, lo inietta nel Dominio, e si affida al calcolo di quest'ultimo.
Tramite l'uso di un Alternative Sequence Fragment (alt), il diagramma modella il comportamento polimorfico del flusso:
se la risposta porta a un nodo intermedio, il sistema salva il progresso e restituisce la domanda successiva;
se la risposta raggiunge una foglia dell'albero normativo, il sistema calcola la conformità finale (Pass/Fail) e chiude lo stato della valutazione.

=== UC30 - Esportazione report di conformità
#image("uml/png/Esportazione_report_uc30.png")

Il diagramma di sequenza illustra il processo di generazione ed esportazione del resoconto finale di conformità per un dispositivo valutato.

Il flusso è innescato da una chiamata HTTP gestita dall'Adattatore Inbound. Il Servizio applicativo avvia il recupero del documento che viene effettuato grazie all'outbound adapter (PyMongo) che estrae i dati dal database.

Una volta recuperato il dispositivo, il Servizio invoca l'aggregazione dei verdetti sul Dominio, il quale restituisce una struttura dati esclusivamente logica (Pass/Fail/NA) senza possedere alcuna conoscenza del rendering finale. Per la creazione del file fisico il Servizio usa la porta di generazione del pdf che traduce i dati puri in un layout grafico, restituendo il file che arriverà all'utente.

// altri papabili: uc11, uc23, UC33.3

== Diagrammi di attività
