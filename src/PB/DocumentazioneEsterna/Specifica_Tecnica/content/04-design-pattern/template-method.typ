#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name:"Template Method",
  descrizione:[
    Il Template Method è un pattern comportamentale che definisce lo scheletro di un algoritmo in una classe astratta, delegando alle sottoclassi l'implementazione dei passi specifici. 
    
    La sequenza complessiva è fissa; ciò che cambia è il comportamento dei singoli passi.
  ],
  motivazione:[
    Tutti i formati di export condividono la stessa sequenza operativa: preparare la struttura, scrivere i dati, finalizzare l'output.
    \
     Senza Template Method questa sequenza dovrebbe essere replicata in ogni exporter concreto, introducendo duplicazione e rischio di inconsistenze.
    \
    Il Template Method consente di scrivere la sequenza una sola volta nella classe astratta, lasciando alle sottoclassi solo i dettagli specifici del formato.

  ],
  utilizzo:[
    Viene utilizzato durante l'esportazione di informazioni sotto formato di file in diversi formati.
  ],
)

#design-pattern-presenter(
  ..pattern
)
// ==== Template Method — FileDeviceExporter, FileDeviceImporter

// *Introduzione*

// Il Template Method è un pattern comportamentale che definisce lo scheletro di un
// algoritmo in una classe astratta, delegando alle sottoclassi l'implementazione dei passi
// specifici. La sequenza complessiva è fissa; ciò che cambia è il comportamento dei
// singoli passi.

// *Motivazioni dell'utilizzo*

// Tutti i formati di export condividono la stessa sequenza operativa: preparare la
// struttura, scrivere i dati, finalizzare l'output. Senza Template Method questa sequenza
// dovrebbe essere replicata in ogni exporter concreto, introducendo duplicazione e rischio
// di inconsistenze. Il Template Method consente di scrivere la sequenza una sola volta
// nella classe astratta, lasciando alle sottoclassi solo i dettagli specifici del formato.

// *Applicazione nel progetto*

// La classe astratta `FileDeviceExporter` definisce il metodo pubblico
// `generate_device_file(dto)` come sequenza fissa di tre passi: `prepare_structure()`,
// `write_data(dto)` e `finalize_output()`. Ogni exporter concreto ---
// `CsvFileDeviceExporter`, `XmlFileDeviceExporter`, `JSONFileDeviceExporter` --- eredita
// la sequenza e implementa solo i tre passi specifici del proprio formato.
// `ExportDeviceService` chiama unicamente `generate_device_file(dto)` attraverso la porta
// `FileDeviceExporterPort`, senza conoscere né la sequenza interna né il formato prodotto.
// Lo stesso schema si applica simmetricamente agli importer tramite la classe astratta
// `FileDeviceImporter`.
