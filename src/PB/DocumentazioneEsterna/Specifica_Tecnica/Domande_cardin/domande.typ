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

  // È corretto utilizzare la notazione "socket e lollipop" (interfacce fornite e richieste) nei diagrammi delle classi per rappresentare le Porte? In caso affermativo, è necessario esplicitare la firma dei metodi e i campi dati dell’interfaccia? Se sì, qual è la sintassi visiva più adatta per mantenere il diagramma leggibile?

  Per la progettazione abbiamo utilizzato PlantUML, un tool che permette di generare diagrammi uml tramite codice, invece di usare tool grafici.

  Tuttavia plant uml non supporta l'interfaccia UML 2.0 vista a lezione.

  Volevamo chiedere se è accettabile usare nella specifica tecnica la sintassi UML 1.0 oppure una ball priva delle dichiarazioni dei metodi, eventualmente segnalati con apposita nota

  #image("assets/image1.png", width: 70%)

  #image("assets/image2.png", width: 70%)
  

  === Livello di Dettaglio degli Adapter nei Diagrammi Parziali

  Quando un singolo Adapter implementa molteplici Porte, come deve essere rappresentato nei diagrammi delle classi settoriali (es. diagrammi focalizzati su un singolo caso d'uso)? Deve mostrare l'elenco completo di tutti i metodi che possiede, oppure è preferibile omettere i metodi non rilevanti per il contesto specifico?

  #image("assets/image3.png", width: 70%)
  #image("assets/image4.png", width: 70%)

  == Scelte Architetturali (Architettura Esagonale)
  
  === Molteplicità delle Porte per un Singolo Adapter
// io ti dico assolutamente si, è perfettamente lecito che una classe implementi 2 interfacce, chiediamolo lo stesso ma specifichiamo che è banale 
  Dal punto di vista del design architetturale (Porte e Adattatori), è considerata una buona pratica definire molteplici Outbound Ports (segregate per logica o entità) che vengono poi implementate a livello infrastrutturale da un unico Adapter concreto (es. un unico MongoAdapter che implementa sia DeviceRepositoryPort che StandardRepositoryPort)?

  === Separazione delle Responsabilità (Query vs Command)

  È corretto e consigliabile separare a livello di Use Case e Service le operazioni di lettura (Read/Query) da quelle di modifica/scrittura (Write/Command), seguendo un approccio ispirato al CQRS (Command Query Responsibility Segregation)?

  Un'applicazione estremamente rigorosa del Single Responsibility Principle porterebbe alla definizione di interfacce funzionali, volevamo sapere se applicare questa separazione oppure i raggruppamenti prima descritti sono accettabili 

  == Gestione del Flusso Dati (Application Layer vs Adapter)

  === Restituzione dei Dati al Controller: DTO vs Entità di Dominio

 L'applicazione opera con un'interfaccia web, l'utilizzo di DTO granulari per gli utilizzi (EntitySummaryDTO e EntityDetailDTO) è fondamentale per la comunicazione tra backend e frontend.

 Il nostro dubbio riguarda dove definire e far vivere i DTO, le opzioni individuate sono le seguenti:
 - #[
  Le porte ritornano dei DTO costruiti dai service
  #terms(
    ([Vantaggi],[
      - Le classi di Dominio non vengono rese note
      - Maggiore decoupling 
    ]),
    ([Svantaggi],[
      - Appesantisce il Dominio con codice boilerplate
      - L'uso di Pydantic renderebbe più veloce l'implementazione, ma introduce una dipendenza esterna  all'interno della business logic
    ]),
  )
 ]
 - #[
  Le porte ritornano degli oggetti di dominio
  #terms(
    ([Vantaggi],[
      - Domain leggero
    ]),
    ([Svantaggi],[
      - Viene esposto un oggetto di Dominio, teoricamente corretto, ma permette di modificare l'oggetto dall'esterno
    ]),
    ([Possibili mitigazioni],[
      - Invece di un oggetto di dominio si restituisce una classe view che realizza un wrapper che nasconde i metodi che modifica lo stato interno. \ In linguaggio di programmazione tipizzato staticamente sarebbe l'equivalente di un const
    ])
  )
 ]

Per alleggerire le firme di funzione si stava valutando di usare DTO invece di un elenco di parametri.

Anche se questa pratica è lecita va valutato il trade off tra codice boilerplate per il DTO di modifica e l'effettivo risparmio di codice ed estensibilità



  // In un'implementazione Python/Flask con Architettura Esagonale, qual è l'approccio migliore per trasferire i dati dall'Application Service all'Inbound Adapter (Controller)? È preferibile restituire direttamente le Entità di Dominio "pure" (lasciando al Controller l'onere di estrarre i campi necessari e serializzarli), oppure è architetturalmente più corretto creare e popolare dei DTO (o classi Wrapper) specifici per ogni vista (es. liste riassuntive vs viste di dettaglio)?

  // Gli adapter hanno spesso bisogno di DTO che semplificano la serializzazione e il trasferimento dei dati tramite payload JSON.

  // Il nostro dubbio riguarda il dove definirli, se far ritornare un'entità di dominio tramite i metodi definiti nella inbound port, in questo caso il problema è dato dal paradigma di python che non implementa il const
]

== Pydantic e dominio
Pydantic offre una sintassi molto snella per la definizione di regole di verifica per la validazione semantica dei dati.

Se si optasse per utilizzare DTO nel dominio l'uso di pydantic per la loro definizione tornerebbe utile a ridurre la verbosità.

== Import export di file
In generale si preferisce mantenere i dati come raw byte o classi della libreria standard che permettono di rappresentare i file oppure si utilizzano dei DTO di dominio


== Interfacce e javascript

Javascript non supporta le interfacce.

#upper("è") accettabile dichiarare un'interfaccia nel diagramma UML per dire che si può inserire una qualsiasi classe che implementa i metodi dichiarati dall'interfaccia


#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png/Diagrammi_classi/frontend/decision-tree-canvas.png")

#image("/src/PB/DocumentazioneEsterna/Specifica_Tecnica/content/uml/png/Diagrammi_classi/frontend/domain.png")