== Architettura di Deployment

Il sistema adotta un'architettura a Monolite Modulare. 
\ L'intera applicazione è concepita, sviluppata e rilasciata come un'unica unità eseguibile.

=== Motivazioni della scelta
Questa scelta è coerente con lo sviluppo di una web app locale.

In questo contesto un'architettura a monolite modulare, rispetto all'architettura a microservizi, offre i seguenti vantaggi:
- Semplicità di Deployment, tutte le funzionalità sono contenute nella singola unità operativa;
- Latenze ridotte, lo scambio di informazioni avviene completamente in locale.

Non si è optato per una normale architettura monolitica tradizionale in cui spesso il codice è fortemente accoppiato.
La rigorosa divisione in moduli logici isolati permette di coniugare la semplicità di rilascio di una singola applicazione con alcuni dei vantaggi organizzativi tipici delle architetture a microservizi:

    - Separazione delle responsabilità tra i vari ambiti del dominio.

    - Semplificazione dello sviluppo e della manutenibilità a lungo termine.

    - Facilità di testing, permettendo di collaudare i singoli moduli in totale isolamento.

=== Realizzazione Pratica e Topologia

Per la distribuzione viene usato Docker come tool di containerizzazione  e Docker Compose come tool di orchestrazione.


#enum(
  [
    Nodi di Esecuzione:
    - Browser dell'utente, l'interfaccia utente è realizzata tramite browser;
    - Server Backend, contiene la core logic dell'applicazione e risponde alle richieste dell'utente;
    - Database MongoDB, sistema di permanenza; 
  ],
  [
    Packaging e isolamento.
    L'infrastruttura è orchestrata tramite Docker Compose e prevede i seguenti container:
    #terms(
      ([web-app],[Contiene l'ambiente Python, il framework Flask, gli asset statici del frontend e altre dipendenze #footnote()[
        Vedi sezione #link(<tecnologie>)[Tecnologie] - #link(<backend>)[Backend]
      ]
      ]),
      (
        [mongodb],[Basato sull'immagine ufficiale di MongoDB. Per prevenire la perdita dei dati (poiché i container sono effimeri per natura), questo container è agganciato a un Docker Volume locale che garantisce la persistenza strutturale dei file BSON.]
      )
    )
    
  ],
  [
    Comunicazioni e protocolli di rete

    I nodi comunicano attraverso i seguenti canali e protocolli:
    - Tra Browser e Backend: La comunicazione avviene in chiaro tramite protocollo HTTP/REST (sulla porta esposta 5000). Il browser effettua richieste GET per ottenere le interfacce e richieste POST/AJAX asincrone (tramite l'API Fetch di Javascript) per scambiare i dati JSON con Flask.
    - Tra Backend e Database: Flask comunica con MongoDB utilizzando il protocollo binario proprietario (sulla porta TCP 27017). Questa comunicazione avviene esclusivamente all'interno della rete virtuale privata creata da Docker (Bridge Network); la porta del database non è esposta verso il browser né verso l'esterno, garantendo l'integrità dei dati.
  ], 
  [
    Gestione del Traffico Web 

    l traffico in ingresso non viene gestito direttamente dal codice applicativo. Tra il browser dell'utente e il framework Flask è interposto un server WSGI (Web Server Gateway Interface, es. Gunicorn o Waitress). Questo strato funge da controllore del traffico: riceve le connessioni HTTP raw sulla porta 5000, gestisce la concorrenza delle richieste, le traduce in oggetti Python compatibili e le instrada verso i corretti moduli (Blueprint) della logica applicativa.
  ]
) 
