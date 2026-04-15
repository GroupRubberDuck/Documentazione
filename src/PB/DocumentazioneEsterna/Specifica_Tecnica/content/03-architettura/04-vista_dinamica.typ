== Diagrammi di sequenza<vista_din>
La seguente sezione illustra il comportamento dinamico del sistema tramite diagrammi di sequenza, focalizzandosi sui casi d'uso di maggiore interesse. Questi modelli descrivono l'ordine cronologico dei messaggi scambiati tra gli attori esterni, i componenti infrastrutturali e il nucleo applicativo.

=== UC05 - Importazione dispositivo
#image("uml/png/importazione_dispositivo_uc05-06.png");

Il diagramma illustra il processo di importazione e validazione strutturale di un dispositivo attraverso i layer dell'Architettura Esagonale. Il flusso adotta un approccio Fail-Fast diviso in due fasi. Inizialmente, l'Adattatore Inbound utilizza un Data Transfer Object (DTO) per eseguire una validazione strutturale sul formato del file in ingresso. Successivamente, il Servizio estrae i dati validati e li passa al Dominio, a cui è delegata esclusivamente la verifica delle regole normative.

Tramite le due aree alt viene modellata la gestione degli errori del caso (UC06): il primo blocco respinge i payload malformati fermandoli al confine del sistema (HTTP 400); il secondo gestisce le violazioni delle regole di business sollevate dal nucleo applicativo (HTTP 422). Solo se l'entità supera entrambi i controlli, il Servizio invoca l'Adattatore di persistenza per il salvataggio e completa l'operazione.

=== UC26, UC27 - Valutazione di un nodo e transizione di stato
#image("uml/png/Valutazione_e_transizione_stato_uc26-27.png");

Il diagramma di sequenza illustra il flusso principale di interazione durante la valutazione di un dispositivo secondo la norma EN18031.
Il diagramma evidenzia il rigoroso attraversamento dei layer architettonici, dal Boundary (Vue.js) fino al driver di persistenza (PyMongo).

Degno di nota è l'isolamento del livello Domain: il frontend e gli adapter non conoscono le regole normative.
È il Servizio applicativo che recupera lo stato, lo inietta nel Dominio, e si affida al calcolo di quest'ultimo.
Tramite l'uso di una sezione alt, il diagramma modella il comportamento polimorfico del flusso:
se la risposta porta a un nodo intermedio, il sistema salva il progresso e restituisce la domanda successiva;
se la risposta raggiunge una foglia dell'albero normativo, il sistema calcola la conformità finale (Pass/Fail) e chiude lo stato della valutazione.

=== UC30 - Esportazione report di conformità
#image("uml/png/Esportazione_report_uc30.png")

Il diagramma di sequenza illustra il processo di generazione ed esportazione del resoconto finale di conformità per un dispositivo valutato.

Il flusso è innescato da una chiamata HTTP gestita dall'Adattatore Inbound. Il Servizio applicativo avvia il recupero del documento che viene effettuato grazie all'outbound adapter (PyMongo) che estrae i dati dal database.

Una volta recuperato il dispositivo, il Servizio invoca l'aggregazione dei verdetti sul Dominio, il quale restituisce una struttura dati esclusivamente logica (Pass/Fail/NA) senza possedere alcuna conoscenza del rendering finale. Per la creazione del file fisico il Servizio usa la porta di generazione del pdf che traduce i dati puri in un layout grafico, restituendo il file che arriverà all'utente.

// altri papabili: uc11, uc23, UC33.3

== Diagrammi di attività

=== Navigazione degli alberi

#image("uml/png/Attività_navigazione.drawio.png", width: 80%)

Il diagramma di attività illustra l'algoritmo di navigazione dell'albero normativo.

Il flusso si basa su un ciclo continuo il cui innesco principale è la risposta dell'utente a uno specifico nodo (Sì/No). Dopo l'inserimento dell'input, il sistema calcola il nodo successivo e ne verifica la natura tramite un blocco decisionale ("è foglia?"):

Se il nodo non è una foglia (nodo intermedio), il flusso torna indietro per sottoporre all'utente la nuova domanda appena calcolata.

Se il nodo è una foglia (ramo di valutazione concluso), il sistema innesca la logica di avanzamento gerarchico.

La fase di avanzamento procede per livelli. Dapprima, il sistema calcola e verifica se vi sono ulteriori requisiti da valutare per l'asset corrente ("trovo requisiti?"). In caso positivo, il nuovo requisito viene caricato e il ciclo di domande riparte dall'inizio. In caso negativo, il sistema sale di livello verificando l'esistenza di ulteriori asset non ancora esaminati nel dispositivo ("trovo asset?"). Se viene individuato un nuovo asset, ne vengono calcolati i relativi requisiti, che vengono caricati per riavviare la compilazione.

L'algoritmo fuoriesce da questo ciclo annidato solo ed esclusivamente quando sia i requisiti sia gli asset del dispositivo sono stati completamente esauriti. In questo scenario conclusivo, il sistema torna alla pagina di dashboard.