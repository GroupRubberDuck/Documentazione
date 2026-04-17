== Asset<classe_asset>


#image("../uml/png/classe_asset.png")


Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione degli Asset. \ Un Asset rappresenta una componente fisica o logica di un Dispositivo e viene sempre gestito nel contesto del Dispositivo padre, identificato tramite device_id.


+ #[ *Inbound Adapter*


 Il pacchetto Inbound Adapter rappresenta il punto di contatto con l’utente. Contiene l’AssetController, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Gli endpoint sono annidati gerarchicamente sotto la risorsa Dispositivo, poiché un Asset non esiste in modo autonomo rispetto al Dispositivo padre. Questo livello non prende nessuna decisione logica.
]

+ #[ *Application Core e Ports*


 Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte (Interfacce astratte):


   `InterfaceAssetUseCase` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il Controller "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.


   `DispositivoService` (Service): Questa classe riceve i comandi dalla porta Inbound, crea e modifica le entità Asset e verifica che i dati rispettino le regole di business tramite un metodo privato dedicato (validaRegoleBusiness). In particolare, questo metodo garantisce che il campo tipo contenga esclusivamente uno dei valori ammessi dall’enumerazione TipoAsset (Security, Network), la cui validazione è delegata interamente al livello applicativo e non al database..


   `InterfaceAssetRepository` (Outbound Port): Quando il Service ha finito i controlli e deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.

]
+ #[ *Outbound Adapter*


 Il pacchetto Outbound Adapter contiene il `MongoAssetAdapter`. Questa classe implementa il contratto richiesto dalla porta `InterfaceAssetRepository` e traduce gli oggetti di dominio in operazioni concrete su MongoDB. A differenza del `MongoDispositivoAdapter`, che opera su documenti di primo livello, il `MongoAssetAdapter` non gestisce una collection indipendente: agisce direttamente sull’array lista_asset annidato all’interno del documento Dispositivo, come definito nello Schema Dati (Sezione 3.6.1). Questa scelta è coerente con la natura di composizione tra le due entità e con la strategia di normalizzazione selettiva adottata.
]