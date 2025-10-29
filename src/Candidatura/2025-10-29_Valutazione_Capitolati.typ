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
Il progetto si colloca nell'ambito della certificazione dei dispositivi radio, dove la verifica manuale risulta dispendiosa e noiosa. Si vuole automatizzare il processo tramite un tree decisionale che fornisce un chiaro report di confortmità.
=== Dominio tecnologico
Il progetto prevede un'applicazione web based o desktop e viene consigliato l'uso di Pyhton con metodologia Agile. Viene lasciato ampio spazio sulla scelta delle tecnologie, purchè vengano rispettati i requisiti obbligatori.
=== Aspetti positivi
#set list(marker: [--])
- Disponibilità e supporto dell'azienda: sono stati proposti 1-2 incontri settimanali
- Scope ridotto e realistico: è richiesto di coprire un gruppo ristretto di requisiti della norma (ACM e AUM)
- Libertà tecnologica: viene lasciata ampia libertà in materia, consentendo al gruppo di scegliere tecnologie con cui ha più familiarità 
=== Aspetti negativi
=== Conclusioni
Il gruppo ritiene il capitolato una valida proposta perchè ritiene che l'automazione di processi sia un tema di attualità, inoltre l'azienda si è dimostrata disponibile e professionale.
== Capitolato 8: Smart Order
=== Descrizione

=== Dominio applicativo
=== Dominio tecnologico
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni

== Capitolato 5: Nexum
=== Descrizione
=== Dominio applicativo
=== Dominio tecnologico
=== Aspetti positivi
=== Aspetti negativi
=== Conclusioni

--------------------------------------------
= Valutazione degli altri capitolati
== Capitolato 2

== Capitolato 3

== Capitolato 4

== Capitolato 6

== Capitolato 9



