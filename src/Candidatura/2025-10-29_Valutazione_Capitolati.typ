#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": insertArabicNumberedPages, insertRomanNumberedPages
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/utilityTable.typ": getCode, utilityTable
#import template_dir + "/statusTab.typ": statusTab


#set text(size: 13pt)

#let giornoRiunione = datetime(year: 2025, month: 10, day: 29)

// Call the function
#frontPage([Valutazione capitolati], giornoRiunione)


#insertRomanNumberedPages("Stato del documento", "Valutazione capitolati", giornoRiunione)[
  #statusTab(
    stato: "In approvazione",
    versione: "0.1",
    autori: ("Aldo Bettega",),
    verificatori: ("Filippo Guerra
Davide Testolin",),
    uso: "Esterno",
    destinatari: ("Professor Tullio Vardanega
Professor Riccardo Cardin",),
  )
]

#insertRomanNumberedPages("Registro Modifiche", "Valutazione capitolati", giornoRiunione)[
  #registroModifiche((
    ([0.1], [2025-10-29], [Prima stesura], [Aldo Bettega], []),
  ))
]

#insertRomanNumberedPages("Indice", "Valutazione capitolati", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

= Introduzione
In questo documento viene presentata la valutazione dei capitolati del gruppo RubberDuck al fine di esporre le nostre motivazioni di scelta e considerazioni riguardo ai progetti proposti dai proponenti.
Sarà presentata una valutazione dettagliata di "Sistema di acquisizione dati da sensori" di M31, seguita da una panoramica dei capitolati preferiti. Saranno inoltre discusse brevemente le ragioni per cui altri capitolati non sono stati selezionati.

= Valutazione del capitolato selezionato
== Capitolato 7: Sistema di acquisizione dati da sensori

=== Descrizione
Il capitolato descrive lo sviluppo di una piattaforma cloud per la raccolta, gestione e visualizzazione di dati provenienti da sensori Bluetooth Low Energy (BLE).

=== Dominio applicativo
Il progetto si colloca nell'ambito dell'Internet of Things, con particolare riferimento ai sistemi di monitoraggio distribuito dei parametri vitali di una persona. Deve essere presenta un’interfaccia web che visualizza in tempo reale le informazioni derivate dall’elaborazione dei dati acquisiti dai sensori

=== Dominio tecnologico
Viene richiesto di sviluppare un simulatore di gateway BLE in grado di inviare dati ad una piattaforma centrale che si occupa della gestione sicura di dati e li rende disponibili tramite API e un'interfaccia web. L'azienda ha suggerito l'utilizzo delle seguenti tecnologie:
#set list(marker: [--])
- *Node.js* e *Nest.js* con *Typescript* per lo sviluppo dei microservizi
- *Go* per eventuali componenti ad alte prestazioni
- *NATS* o *Apache Kafka* per la gestione di messaggi distribuiti
- *Google Cloud Platform* e *Kubernetes* per una gestione centralizzata e servizi cloud affidabili e scalabili
- *MongDB* e *PostreSQL* per la persistenza dati
- *Redis* per migliorare le prestazioni del sistema
- *Angular* per l'interfaccia web

=== Motivazione della scelta
La scelta del capitolato è stata ampiamente condivisa dal gruppo per diversi motivi:
#set list(marker: [--])
- *Difficoltà*: riteniamo che il progetto presenti un alto livello di difficolà, motivo per cui il gruppo ritiene che affrontarlo possa rappresentare una sfida stimolante e occasione di crescita personale e professionale
- *Tecnologie*: il progetto offre l'occasione di affacciarsi ad un gran numero di tecnologie moderne e applicabili in progetti futuri
- *Contenuto del capitolato*: è di comune interesse la possibilità di approfondire tematiche avanzate legate ai sistemi distribuiti e alle architetture cloud
- *Disponibilità dell'azienda*: M31 ha lasciato un'ottima impressione in quanto disponibilità e flessibilità, in particolare durante l'incontro zoom si è dimostranta molto organizzata e puntuale nella risposta delle nostre domande
- *Impatto*: pensiamo che il progetto possa avere un impatto concreto nella vita delle persone

=== Conclusioni
Il gruppo ritiene che il capitolato proposto da M31 rappresenti la scelta più coerente con le proprie ambizioni. La condivisione interna nella decisione e l'interesse mostrato dall'azienda verso il progetto ci fanno sperare in una collaborazione proficua e stimmolante.

= Valutazione dei capitolati preferiti
== Capitolato 1: Automated EN18031 Compliance Verification
=== Descrizione
Il capitolato intende automatizzare la verifica di conformità allo standard EN18031, applicabile ai dispositivi radio sul mercato europeo.
=== Dominio applicativo
Il progetto si colloca nell'ambito della certificazione dei dispositivi radio, dove la verifica manuale risulta dispendiosa e noiosa. Si vuole automatizzare il processo tramite un tree decisionale che fornisce un chiaro report di conformità.
=== Dominio tecnologico
Il progetto prevede un'applicazione web based o desktop e viene consigliato l'uso di Pyhton con metodologia Agile. Viene lasciato ampio spazio sulla scelta delle tecnologie, purchè vengano rispettati i requisiti obbligatori.
=== Aspetti positivi
#set list(marker: [--])
- Disponibilità e supporto dell'azienda: sono stati proposti 1-2 incontri settimanali
- Scope ridotto e realistico: è richiesto di coprire un gruppo ristretto di requisiti della norma (ACM e AUM)
- Libertà tecnologica: viene lasciata ampia libertà in materia, consentendo al gruppo di scegliere tecnologie con cui ha più familiarità 
// === Aspetti negativi
=== Conclusioni
Il gruppo ritiene il capitolato una valida proposta perchè ritiene che l'automazione di processi sia un tema di attualità, inoltre l'azienda si è dimostrata disponibile e professionale.
== Capitolato 8: Smart Order
=== Descrizione
Il capitolato "Smart Order" ha come oggetto la gestione degli ordini di acquisto da parte dei clienti di un’azienda in contesti in cui gli ordini possono assumere diverse forme.
=== Dominio applicativo
L’obiettivo del progetto è automatizzare la ricezione di questi ordini, interpretarli correttamente e
trasformarli in ordini cliente strutturati e pronti per l’inserimento nel database aziendale

Il progetto SmartOrder consiste in una piattaforma
intelligente in grado di analizzare input multimodali (testo, audio e immagini) e convertirli automaticamente in ordini strutturati
=== Dominio tecnologico
Per la realizzazione del progetto è previsto l'uso delle seguenti tecniche e tecnologie: 
L'uso di database per interfacciarsi con i sistemi aziendali \
Entrando più nello specifico:
- Database relazionali, per interfacciarsi con i sistemi aziendali
- Modelli di Linguaggio e NLP
- Visione Computazionale e OCR
- Riconoscimento Vocale e Trascrizione
- API REST
- Comunicazione da/per il database
- Interfaccia utente
    
Dal punto di vista tecnologico sono state fornite molte indicazioni o suggerimenti ma senza porre vincoli stringenti sulle tecnologie specifiche da adottare



=== Aspetti positivi
- Ha suscitato l'interesse del gruppo
- L'azienda si è mostrata molto disponibile
=== Aspetti negativi
=== Conclusioni

== Capitolato 5: Nexum
=== Descrizione
Il Capitolato C5 consiste nell'estensione dell'ecosistema NEXUM con lo sviluppo di nuove funzionalità intelligenti che
migliorino la gestione HR, il dialogo con gli studi dei Consulenti del Lavoro e l'esperienza digitale dei dipendenti.
=== Dominio applicativo
L'attuale applicativo nexum include già alcune funzioni
Il progetto mira a introdurre funzionalità intelligenti, 2 AI assistant: 
- Un AI Assistant per la creazione di contenuti in grado di adeguare stile e tono comunicativo a quello dell’azienda.
- Un AI Copilot per i consulenti del lavoro (CdL)
Oltre al potenziamento di alcuni dei moduli già presenti.

=== Dominio tecnologico
L'impresa proponente è stata molto specifica sulle tecnologie da utilizzare, in quanto il proidotto finale deve essere facilmente integrabile nei sistemi già esistenti.
- #[Front-end
    - Dashboard amministrativa (Angular).
    - PWA utenti finali (Next.js): hosting su AWS Amplify Hosting oppure alternativa S3+CloudFront (se full-static).
  ]
- #[API & Backend
    - Ruby on Rails.
    - Background jobs: Sidekiq su service Fargate dedicato + SQS come coda.
    - Cache/sessioni: ElastiCache for Redis.
    - Database: Amazon RDS for PostgreSQL 
    - Storage documenti: S3
    - Sicurezza dati: KMS per chiavi gestite
    - Segreti: Secrets Manager
    - Identity/Access: Amazon Cognito (pool utenti/identity) oppure identity provider esterno    
    -Integrazioni e-mail/notify: SES (email), SNS (notifiche push/eventi).

]

- #[Rete & Sicurezza
  - VPC con subnet public (ALB, NAT Gateway) e private (ECS/RDS/Redis).
  - Security Groups a “minimo privilegio”. 
  - WAF + AWS Shield su ALB/CloudFront.
  - IAM policy granulari per task role ECS
]
- #[ Observability & Ops
  -CloudWatch Logs/Metrics/Alarms, X-Ray (tracing).
  -AWS Config + GuardDuty (compliance & threat detection).
]


=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni

--------------------------------------------
= Valutazione degli altri capitolati
== Capitolato 2) Code Guardian
=== Descrizione
  L'obiettivo del progetto è la realizzazione di una piattaforma web, basata su un sistema ad agenti, per l'analisi di repository GitHub
=== Dominio applicativo
  Questo capitolato mira alla creazione di uno strumento per monitorare e migliorare la qualità del codice verasionato tramite repository GitHub tramite analisi, valutazoni di vario tipo, reportistica automatica su test, documentazione e sicurezza e la capacità di suggerire soluzioni in caso di lacune o altri problemi.
  Il progetto prevede  l'uso di un sistema ad agenti con orchestratore
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni


== Capitolato 3 DIPReader
=== Descrizione
  Il progetto DIPReader si colloca nell'ambito della gestione documentale di sistemi di archiviazione digitale
=== Dominio applicativo
  L'obiettivo è facilitrare la gestione di archivi digitali massivi a fini gestionali, legali, ecc..
  Si mira a garantire l’autenticità, l’integrità, l’affidabilità, la leggibilità e la reperibilità dei documenti informatici, e a tale scopo è necessario il supporto alla ricerca tramite linguaggio naturale.
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni



== Capitolato 4 L'app che Proteggie e Trasforma
=== Descrizione
Il presente capitolato ha per oggetto l'affidamento dei servizi di progettazione, sviluppo e implementazione di un'applicazione mobile innovativa denominata "L'app che Protegge e Trasforma", finalizzata alla prevenzione e supporto delle vittime di violenza di genere.
=== Dominio applicativo
=== Dominio tecnologico
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni



== Capitolato 6 Second Brain
=== Descrizione
L'obiettivo del capitolato è testare le potenzialità dell'intelligenza artificiale tramite un minimale editor di testo minimale, basato sul linguaggio
di markup MarkDown.
Questo editor di testo deve supportare diverse funzioni basate sull'intelligenza artificaile
=== Dominio applicativo
L'editor di testo deve implementare oprazioni come riscrittura del testo con un diverso stile, creazione di riassunti,analisi, distant writing, ecc.. 
=== Dominio tecnologico
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni



== Capitolato 9 View4Life
=== Descrizione
Il capitolato si concentra nell'ambito dell IoT, in particolare sulle residenze protette e sulla loro gestione.
Si mira a creare un sistema che migliori la qualità di vita della persona
=== Dominio applicativo
=== Dominio tecnologico
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni



