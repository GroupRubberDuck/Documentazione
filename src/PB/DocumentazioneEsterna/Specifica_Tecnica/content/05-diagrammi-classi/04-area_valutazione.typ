== Valutazione<classe_valutazione>

//casi d'uso implementati : UC20 - UC30

#image("../uml/png/classe_valutazione.png")


Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione delle Valutazioni dei Requisiti. Questo modulo è il cuore operativo del sistema: implementa la navigazione degli alberi decisionali della norma EN 18031 e la produzione degli esiti di conformità (PASS/FAIL/NA) per ciascun requisito applicato a un asset.


+ #[ *Inbound Adapter*
  Il pacchetto Inbound Adapter contiene il `ValutazioneController`, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Questo livello non prende nessuna decisione logica; delega interamente il controllo alle Inbound Ports. Gli endpoint esposti corrispondono alle operazioni principali del ciclo di vita di una valutazione: avvio, progressione nodo per nodo, lettura dello stato corrente, reset e richiesta del report finale.
]

+ #[ *Application Core e Ports*


 Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte (Interfacce astratte):


   `InterfaceValutazioneUseCase` (Inbound Port): Definisce il contratto dei casi d'uso offerti all'esterno. Il Controller invoca questa porta senza conoscere l'implementazione sottostante. I metodi principali riguardano l'avvio (avviaValutazione), la progressione nodo per nodo (valutaNodo), la lettura dello stato corrente (getStatoValutazione), il reset (resetValutazione) e la generazione del report finale (getReportConformita).

   `ValutazioneService` (Service): È la classe che svolge il lavoro reale. Implementa InterfaceValutazioneUseCase e orchestra l'intero flusso di navigazione degli alberi decisionali. In particolare:
   - ecupera il contesto di valutazione (dispositivo, modello normativo, stato corrente) tramite i repository iniettati (`dispositivoRepository` e `modelloRepository`) esposti come Outbound Ports appartenenti ai rispettivi moduli;
   - delega al Domain il calcolo della transizione di stato e della logica normativa EN 18031;
   - utilizza un metodo privato caricaContestoValutazione per centralizzare il caricamento ed evitare duplicazione tra le operazioni.

   `InterfaceValutazioneRepository` (Outbound Port): Definisce il contratto di persistenza specifico per le valutazioni che il Service utilizza. Astrae completamente la tecnologia di storage: il nucleo non conosce MongoDB. I metodi esposti comprendono la ricerca per dispositivo e requisito, il salvataggio, la cancellazione e il recupero completo per dispositivo.

]
+ #[ *Domain*


  Il livello Domain incapsula le entità e le regole di business pure.
  - `ValutazioneRequisito`: è la classe di associazione centrale tra un Asset e un Requisito normativo (già visibile nel diagramma di dominio alla Sezione 5.1). Memorizza nella mappa mapRisposte le risposte booleane date dall'utente per ciascun nodo dell'albero, permettendo la sospensione e la ripresa della compilazione. Il metodo calcolaEsito delega al DecisionTree la restituzione del verdetto finale percorrendo il cammino registrato. Il metodo `getUltimoNodoAttivo` determina a quale nodo dell'albero l'utente deve essere reindirizzato in caso di ripresa.
  - `ReportConformita`: aggrega una collezione di `ValutazioneRequisito` relative a un intero Dispositivo. La relazione è di aggregazione e non di composizione: l'eventuale rigenerazione o cancellazione di un report non invalida le valutazioni persistite nel sistema. Offre metodi per calcolare l'esito globale e per interrogare la distribuzione dei verdetti (totale PASS, FAIL, NA).
  - `StatoValutazione` e `Verdetto`: due enumerazioni che impongono vincoli di dominio stringenti sullo stato del processo di valutazione e sull'esito finale, garantendo type-safety e prevenendo stati non previsti dalla norma.
]
+ #[ *Outbound Adapter*


  Il pacchetto Outbound Adapter contiene il `MongoValutazioneAdapter`. Questa classe implementa concretamente il contratto `InterfaceValutazioneRepository`. A differenza del `MongoDispositivoAdapter`, che opera su documenti di primo livello, il `MongoValutazioneAdapter` agisce sull'array `lista_valutazioni` annidato all'interno del sub-documento `lista_asset` del documento Dispositivo, come definito nello Schema Dati alla Sezione 3.6.2. Questa scelta è coerente con la struttura di composizione tra le entità e con la strategia di normalizzazione selettiva adottata.
]