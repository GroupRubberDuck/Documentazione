#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name: "Facade",
  descrizione: [
    Il Facade è un pattern strutturale che fornisce un'interfaccia di alto livello e semplificata a un insieme di componenti complessi o a un intero sottosistema. L'obiettivo è nascondere la complessità interna esponendo al chiamante unicamente i metodi strettamente necessari all'azione richiesta.
  ],
  motivazione: [
    In un'architettura a livelli, i Facade evitano che i layer esterni (come i controller o le interfacce utente) debbano orchestrare manualmente le dipendenze e la logica applicativa. Questo permette di mantenere i moduli di ingresso "sottili"  e disaccoppiati dalle dinamiche interne del dominio.
  ],
  utilizzo: [
    Nel progetto, questo pattern si riflette nei Service, come ad esempio il `FileImporterService`. Anche se espone un'interfaccia minimale, agisce da Facade orchestrando diverse operazioni sottostanti: riceve la richiesta, coordina i servizi di estrazione e parsing del file, e istruisce il sistema di persistenza per il salvataggio, nascondendo l'intera complessità della sequenza al chiamante.
  ],
)

#design-pattern-presenter(
  ..pattern
)

// *Introduzione*

// Il Facade è un pattern strutturale che fornisce un'interfaccia semplificata a un insieme
// di componenti complessi. Nasconde la complessità interna del sistema esponendo solo i
// metodi necessari al chiamante, che non ha bisogno di sapere quante classi ci sono dietro.

// *Motivazioni dell'utilizzo*

// Senza Facade i Blueprint Flask dovrebbero orchestrare direttamente repository, logica di
// dominio e porte outbound. Le route diventerebbero lunghe e difficili da testare. Il Facade
// concentra tutta l'orchestrazione nei service applicativi, mantenendo i Blueprint sottili
// e privi di logica di business.

// *Applicazione nel progetto*

// I service applicativi `DispositivoService`, `AssetService` e `ValutazioneService` sono
// Facade. Un Blueprint che vuole creare un dispositivo chiama
// `DispositivoService.creaDispositivo(dto)` in una sola riga. Dietro quella riga il Facade
// valida le regole di business tramite `validaRegoleBusiness()`, crea l'entità
// `Dispositivo` e la persiste attraverso `InterfaceDispositivoRepository`. Il Blueprint non
// sa nulla di questo processo. Lo stesso vale per `ValutazioneService`, che dietro il
// metodo `valutaNodo()` orchestra il recupero del contesto, la navigazione del decision
// tree e la persistenza dello stato.

