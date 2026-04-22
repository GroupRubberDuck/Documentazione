#import "/src/TypstTemplate/specificaTecnica/design-pattern-presenter.typ": design-pattern-presenter

#let pattern=(
  pattern-name:"Repository",
  descrizione:[
    Il Repository è un pattern architetturale che astrae il sistema di persistenza dietro un'interfaccia che simula una collezione in memoria.
    Chi usa il Repository non conosce i dettagli del database sottostante.

    Interagisce solo con metodi semantici come `findById()`, `save()`, `findAll()`.
  ],
  motivazione:[
    Senza Repository la logica di business sarebbe mescolata con le query. 
    
    Inoltre i test unitari richiederebbero un database. 
\
    Con Repository il dominio e i service applicativi dipendono solo dall'interfaccia nei test si usa un mock.
  ],
  utilizzo:[
    Nell'ambito del progetto viene utilizzata per gestire le comunicazioni con sistema di persistenza.

    La lettura delle collection presenti su mongo DB avviene tramite porte dedicate.

    `DeviceRepositoryPort` implementata da `MongoDeviceRepository`  e `ComplianceStandardRepositoryPort` implementata da `MongoComplianceStandardRepository`

   ],
)

#design-pattern-presenter(
  ..pattern
)
// ==== Repository

// *Introduzione*

// Il Repository è un pattern comportamentale che astrae il sistema di persistenza dietro
// un'interfaccia che simula una collezione in memoria. Chi usa il Repository non conosce i
// dettagli del database sottostante --- interagisce solo con metodi semantici come
// `findById()`, `save()`, `findAll()`.

// *Motivazioni dell'utilizzo*

// Senza Repository la logica di business sarebbe mescolata con le query MongoDB. I test
// unitari richiederebbero un database. 
// Con Repository il dominio e i
// service applicativi dipendono solo dall'interfaccia nei test si usa un mock.

// *Applicazione nel progetto*

// `InterfaceDispositivoRepository`, `InterfaceAssetRepository` e
// `InterfaceValutazioneRepository` sono porte Repository implementate rispettivamente da
// `MongoDispositivoAdapter`, `MongoAssetAdapter` e `MongoValutazioneAdapter`.
// `DispositivoService`, `AssetService` e `ValutazioneService` ricevono queste porte per
// dependency injection nel costruttore e non conoscono mai l'implementazione concreta.
// `MongoAssetAdapter` non gestisce una collection indipendente ma opera sull'array
// `lista_asset` annidato nel documento `Dispositivo`; analogamente
// `MongoValutazioneAdapter` opera sull'array `lista_valutazioni` annidato nel
// sub-documento `lista_asset`, coerentemente con la struttura documentale di MongoDB
// descritta nella sezione 3.6.