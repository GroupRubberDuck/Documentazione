#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *

#show link: body => {
  set text(fill: blue)
  underline()[#body]
}
#show ref: body => { underline()[#strong(body)] }

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)


#let giornoRiunione = datetime(year: 2026, month: 04, day: 27)
#let doctype = "Riunione"
#frontPage([Dubbi su Specifica Tecnica], giornoRiunione)

#insertRomanNumberedPages("Indice", "Verbale interno", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterna
  - *Motivazione*: Chiarimento dubbi
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Zoom
  - *Ora inizio*: 8.40
  - *Ora fine*: 9.00
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Lorenzon
      - Riccardo Cardin
      \
    ]
]

#insertArabicNumberedPages("Informazioni generali", "Verbale interno", giornoRiunione)[
  = Domande
  == Modellazione UML e Convenzioni Visive

  === Rappresentazione delle Interfacce nei Diagrammi delle Classi

  È corretto utilizzare la notazione "socket e lollipop" (interfacce fornite e richieste) nei diagrammi delle classi per rappresentare le Porte? In caso affermativo, è necessario esplicitare la firma dei metodi e i campi dati dell’interfaccia? Se sì, qual è la sintassi visiva più adatta per mantenere il diagramma leggibile?

  #image("image1.png", width: 70%)

  #image("image2.png", width: 70%)
  

  === Livello di Dettaglio degli Adapter nei Diagrammi Parziali

  Quando un singolo Adapter implementa molteplici Porte, come deve essere rappresentato nei diagrammi delle classi settoriali (es. diagrammi focalizzati su un singolo caso d'uso)? Deve mostrare l'elenco completo di tutti i metodi che possiede, oppure è preferibile omettere i metodi non rilevanti per il contesto specifico?

  == Scelte Architetturali (Architettura Esagonale)
  
  === Molteplicità delle Porte per un Singolo Adapter

  Dal punto di vista del design architetturale (Porte e Adattatori), è considerata una buona pratica definire molteplici Outbound Ports (segregate per logica o entità) che vengono poi implementate a livello infrastrutturale da un unico Adapter concreto (es. un unico MongoAdapter che implementa sia DeviceRepositoryPort che StandardRepositoryPort)?

  === Separazione delle Responsabilità (Query vs Command)

  È corretto e consigliabile separare a livello di Use Case e Service le operazioni di lettura (Read/Query) da quelle di modifica/scrittura (Write/Command), seguendo un approccio ispirato al CQRS (Command Query Responsibility Segregation)?

  == Gestione del Flusso Dati (Application Layer vs Adapter)

  === Restituzione dei Dati al Controller: DTO vs Entità di Dominio

  In un'implementazione Python/Flask con Architettura Esagonale, qual è l'approccio migliore per trasferire i dati dall'Application Service all'Inbound Adapter (Controller)? È preferibile restituire direttamente le Entità di Dominio "pure" (lasciando al Controller l'onere di estrarre i campi necessari e serializzarli), oppure è architetturalmente più corretto creare e popolare dei DTO (o classi Wrapper) specifici per ogni vista (es. liste riassuntive vs viste di dettaglio), al fine di disaccoppiare il Dominio dal framework web?
]
