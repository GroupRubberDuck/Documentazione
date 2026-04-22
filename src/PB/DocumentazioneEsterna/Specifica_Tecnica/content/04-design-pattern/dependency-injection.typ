#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name: "Dependency Injection",
  descrizione: [
        La dependency injection prevede che le dipendenze necessarie a una classe o a un modulo non vengano create internamente, ma fornite dall’esterno.
        
        Generalmente questo avviene alla costruzione, tramite un setter o come parametro di un metodo.
  ],
  motivazione: [
        La dependency injection permette di realizzare la Dependency Inversion e garantisce che le classi di dominio non dipendano mai da servizi secondari, framework o tecnologie esterne.
  ],
  utilizzo: [
    All'interno del progetto viene usata la Constructor Injection. Il factory di Flask (`create_app()`) funge da *Composition Root*: è l'unico punto centralizzato del sistema a conoscere le implementazioni concrete delle porte e ad occuparsi di iniettarle nei service applicativi.
  ],
)

#design-pattern-presenter(
  ..pattern
)

// *Introduzione*


// *Motivazioni dell'utilizzo*

// Senza Dependency Injection ogni service applicativo dovrebbe istanziare direttamente le
// proprie dipendenze concrete --- `MongoDispositivoAdapter()`, `CsvFileDeviceImporter()`
// --- accoppiandosi alle implementazioni specifiche. Questo rende impossibile sostituire
// le implementazioni nei test. Con Dependency Injection il service dipende solo
// dall'interfaccia della porta.

// *Applicazione nel progetto*

// `DispositivoService` riceve `InterfaceDispositivoRepository` nel costruttore.
// `AssetService` riceve `InterfaceAssetRepository`. `ValutazioneService` riceve
// `InterfaceValutazioneRepository`, `InterfaceDispositivoRepository` e
// `InterfaceModelloRepository`. `ImportDeviceService` riceve `FileDeviceImporterFactoryPort`
// e `DeviceRepositoryPort`. `ExportDeviceService` riceve `FileDeviceExporterFactoryPort` e
// `DeviceRepositoryPort`. In nessun caso le dipendenze vengono istanziate internamente al
// service. La Composition Root `create_app()` è l'unico punto che conosce le
// implementazioni concrete e le inietta nei service prima di registrare i Blueprint Flask.