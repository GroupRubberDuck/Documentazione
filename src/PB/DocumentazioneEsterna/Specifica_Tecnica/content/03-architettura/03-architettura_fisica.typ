== Architettura di Deployment <deployment>

Il sistema adotta un'architettura a Monolite Modulare. 
\ L'intera applicazione è concepita, sviluppata e rilasciata come un'unica unità eseguibile.

=== Motivazioni della scelta
Questa scelta è coerente con lo sviluppo di una web app locale.

In questo contesto un'architettura a monolite modulare, rispetto all'architettura a microservizi, offre i seguenti vantaggi:

- *Semplicità di Deployment*: tutte le funzionalità sono contenute nella singola unità operativa;
- *Latenze ridotte*: lo scambio di informazioni avviene completamente in locale.

Non si è optato per una architettura monolitica tradizionale in cui spesso il codice è fortemente accoppiato.

La rigorosa divisione in moduli logici isolati permette di coniugare la semplicità di rilascio dell'applicazione come singola unità con alcuni dei vantaggi organizzativi tipici delle architetture a microservizi:

    - *Separazione delle responsabilità* tra i vari ambiti del dominio.

    - *Semplicità di sviluppo e manutenibilità* a lungo termine.

    - *Facilità di testing*, permettendo di collaudare i singoli moduli in totale isolamento.

=== Realizzazione Pratica e Topologia

Per la distribuzione viene usato Docker come tool di containerizzazione  e Docker Compose come tool di orchestrazione.


#enum(
  [
    *Nodi di Esecuzione*:
    - #strong("Browser dell'utente",delta:200), l'interfaccia utente è realizzata tramite browser;
    - #strong("Server Backend",delta:200), contiene la core logic dell'applicazione e risponde alle richieste dell'utente;
    - #strong("Database MongoDB",delta:200), sistema di permanenza; 
  ],
  [
    *Packaging e isolamento*.
    L'infrastruttura è orchestrata tramite Docker Compose e prevede i seguenti container:
    #terms(separator:[\ ],hanging-indent: 0em,
      ([#sym.bullet Web-app],[Contiene l'ambiente Python, il framework Flask, gli asset statici del frontend e altre dipendenze #footnote()[
        Vedi sezione #link(<tecnologie>)[Tecnologie] - #link(<backend>)[Backend]
      ]
      ]),
      (
        [#sym.bullet Mongodb],[Basato sull'immagine ufficiale di MongoDB. Per prevenire la perdita dei dati questo container è agganciato a un Docker Volume locale.]
      )
    )
    
  ],
  [
    *Comunicazioni e protocolli di rete*

    I nodi comunicano attraverso i seguenti canali e protocolli:
    - *Tra Browser e Backend*: \ La comunicazione avviene in chiaro tramite protocollo HTTP/REST
    - Tra Backend e Database: Flask comunica con MongoDB utilizzando il protocollo binario proprietario.
    La porta del database non è esposta verso il browser né verso l'esterno, garantendo l'integrità dei dati.
  ], 
[
    *Gestione del Traffico Web*

 
    
    Tra il browser dell'utente e l'applicazione Python è interposto un server *WSGI* . 
    
    Questo strato intermedio garantisce stabilità, gestisce la concorrenza delle richieste e le instrada in modo sicuro verso la logica applicativa.
  ]
) 
