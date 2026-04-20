== Asset<classe_asset>


#image("../uml/png/classe_asset.png")


Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione degli Asset. \ Un Asset rappresenta una componente fisica o logica di un Dispositivo e viene sempre gestito nel contesto del Dispositivo padre, identificato tramite device_id.


+ #[ *Inbound Adapter*


 Il pacchetto Inbound Adapter rappresenta il punto di contatto con l’utente. Contiene il flask asset request handler, sviluppato come Blueprint Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Gli endpoint sono annidati gerarchicamente sotto la risorsa Dispositivo, poiché un Asset non esiste in modo autonomo rispetto al Dispositivo padre.
 Questo livello non prende nessuna decisione logica.

 Vengono usati dei DTO specifici per gestire il passaggio dei dati relativi agli asset tra le varie parti del sistema, questo permette al dispositivo di mantenere il possesso esclusivo sugli asset
]

+ #[ *Application Core e Ports*


 Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte (Interfacce astratte):


   `AssetUseCasePort` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il request handler "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.


   `AssetService` (Service): Questa classe realizza le funzioni dalle Inbound Port, crea e modifica le entità Asset, ma sempre utilizzando i metodi della classe Device.


   `DeviceRepositoryPort` (Outbound Port): Quando il Service deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.

]
+ #[ *Outbound Adapter*


 Il pacchetto Outbound Adapter contiene il `MongoDeviceRepository`. Questa classe implementa il contratto richiesto dalla porta `DeviceRepositoryPort` e traduce gli oggetti di dominio in operazioni concrete su MongoDB.
 
 Essendo relazione di composizione tra dispositivo e asset una regola di business, si è preferito mantenere un'unica porta repository e di non permettere il la modifica diretta degli asset senza passare dal device, cosa che rischierebbe di violare le regole di business e di causare stati inconsistenti.
 
 Tuttavia questa scelta richiede di non esporre un metodo granulare per il salvataggio delle modifiche agli asset sul sistema di  persistenza.

 Questo richiederà un'ottimizzazione da parte del repository o causerà un costo in termini di performance.

  #upper("è") in valutazione anche l'introduzione di un'unità di dominio registroModifiche, il cui compito è di tracciare le modifiche e permettere a servizi esterni di replicarle.
]