== Dispositivo<classe_disp>

#image("../uml/png/classe_dispositivo.png")

Il diagramma delle classi illustra la progettazione architetturale per il modulo di Gestione dei Dispositivi.

+ #[*Inbound Adapter*

  Il pacchetto Inbound Adapter rappresenta il punto di contatto con l'utente. Contiene il DispositivoController, sviluppato con il framework Flask. Il suo unico compito è ricevere le richieste HTTP, tradurle in un formato comprensibile al sistema e restituire una risposta web. Questo livello non prende nessuna decisione logica.
]
+ #[ *Application Core e Ports*

  Al centro del diagramma si trova la logica vera e propria del software. Per proteggere questa parte centrale, essa comunica con l'esterno unicamente tramite delle Porte rappresentate da interfacce:

    `InterfaceDispositivoUseCase` (Inbound Port): È l'elenco dei servizi offerti all'utente. Il Controller "utilizza" questa porta per inviare i comandi, senza aver bisogno di sapere come verranno eseguiti.

    `DispositivoService` (Service): È la classe che svolge il lavoro reale. Riceve i comandi dalla porta Inbound, crea le entità (`Dispositivo`) e verifica che i dati rispettino le regole del progetto tramite un metodo privato dedicato (`validaRegoleBusiness`).

    `InterfaceDispositivoRepository` (Outbound Port): Quando il Service ha finito i controlli e deve salvare i dati, non contatta direttamente il database. Usa invece questa porta di uscita, che dichiara solo il bisogno di salvare o leggere un dato, senza specificare la tecnologia.
]
#[ *Outbound Adapter*

  Il pacchetto Outbound Adapter contiene il `MongoDispositivoAdapter`. Questa classe implementa il contratto richiesto dalla porta in uscita e traduce gli oggetti del programma in documenti fisici salvati su MongoDB.

]