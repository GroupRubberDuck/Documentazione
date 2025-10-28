#import "/src/config.typ":*
#import template_dir+"/frontPage.typ": frontPage
#import template_dir+"/setUpPageLayout.typ": insertRomanNumberedPages, insertArabicNumberedPages
#import template_dir +"/registroModifiche.typ":registroModifiche


#let giornoRiunione = datetime(year:2025, month:10 , day:22)

#let enfasi(doc) = {
  align()[
    #set text(weight: "bold", size: 18pt)
    #doc
  ]
}
#frontPage("Verbale Riunione con M31",giornoRiunione)

#insertRomanNumberedPages("Registro modifiche","Verbale esterno",giornoRiunione)[
  
    #let color=rgb("#b8babb")
  #registroModifiche(colore:color,
  (  ("0.1", "2025-10-28", "Prima stesura", "Davide Testolin", ""),
  )
  )
]

#insertRomanNumberedPages("Indice","Verbale esterno",giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]
#context counter(page).update(1)



#insertArabicNumberedPages("Informazioni generali","Verbale esterno",giornoRiunione)[
  
  = Informazioni generali
- *Tipo di riunione* : Esterno
- *data*: #giornoRiunione.display()
- *luogo*: Riunione su Zoom
- *Ora inizio*: 15:00
- *Ora fine*: 15:45
- *Portavoce*: -
- *Scriba*: Davide Testolin
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Testolin
- Filippo Guerra
- Aldo Bettega
- Cristian Pirlog (M31)

]
  
]

#insertArabicNumberedPages("Ordine del giorno","Verbale esterno",giornoRiunione)[
  = Ordine del giorno
  #set list(marker: [‣])
  - Esporre 13 domande precedentemente preparate dal gruppo
]

#insertArabicNumberedPages("Riassunto della riunione ","Verbale interno",giornoRiunione )[
= Riassunto della riunione 
Le domande poste sono state le seguenti:


== Domanda 1
Nel documento viene detto “Il progetto deve prestarsi a molteplici estensioni future, tra cui l’integrazione con sistemi di analisi avanzata e algoritmi predittivi”. Quali sono questi sistemi di analisi avanzata e algoritmi predittivi? in che cosa devono essere predittivi?

#enfasi[Risposta 1]
Si tratta di un "nice to have". I dati potrebbero passare attraverso una serie di stadi di "processing" prima di arrivare al cliente finale.

\ \


== Domanda 2
Nella pratica in che modo e quali strumenti vengono utilizzati per realizzare una segregazione tra tenant?

#enfasi[Risposta 2]
Ogni tenant sostanzialmente è un cliente. Tenere i dati in un singolo DB potrebbe essere problematico se si hanno ad esempio centinaia di migliaia di sensori che generano dati contemporaneamente. Quindi sia a livello logico di codice che a livello fisico di DB separati (oppure #link("https://www.postgresql.org/docs/current/ddl-rowsecurity.html")[Row Security Policy] di Postgres).

\ \

== Domanda 3
La configurazione di nuovi sensori o gateway deve essere disponibile anche a lato client? se sì perché?

#enfasi[Risposta 3]
- Direi che questi dettagli potremo definirli insieme piu avanti, poichè in uno dei primi incontri sara necessario anche discutere e concordare i requisiti elencati. Tali requisiti non sono incisi nella pietra. Sta a voi valutarli e segnare tempestivamente eventuali difficolta nel realizzarli. In sostanza, ci aspettiamo di avere una dashboard dove possiamo vedere i dati trasmessi dai sensori attivi in real time, magari con qualche filtro, per il tenant corrente.

\ \

== Domanda 4
Nei requisiti opzionali si parla di integrazione di third-party-app, in che punto del sw ci si aspetta che vengano integrate? ci sono consigli su quali applicare?

#enfasi[Risposta 4]
A livello di API, alla fine di tutta la catena. Una volta che il dato è stato filtrato e processato, il cliente potrà accedervi attraverso le API del cloud.

\ \ 

== Domanda 5
Nei requisiti opzionali di sicurezza si parla di resilienza agli attacchi tramite failover automatico -> questo implica che il sw deve essere dotato di un sistema di riserva? se sì quali parti del sistema devo duplicare e in che modo?

#enfasi[Risposta 5]
Dovete studiare voi una strategia per mitigare questi attacchi.

\ \

== Domanda 6
Nei requisiti generici si parla di scalabilità.

#enfasi[Risposta 6]
Sì, il sistema deve essere pensato per essere scalabile. I servizi devono essere "stateless" e i dati letti/scritti dal DB. Tutti i servizi devono poter accedere allo stesso stato.

\ \

== Domanda 7
Nella parte di documentazione si parla di “documentazione del codice”, nell’atto pratico che cosa ci si aspetta che contenga? una spiegazione dettagliata del funzionamento del codice per chi dovrà guardarlo, una specie di guida pratica?

#enfasi[Risposta 7]
Un README con la struttura del repository, organizzazione, principi base, istruzioni per compilare il codice e test. Inoltre la documentazione nel codice: i commenti (es. Javadoc).

\ \

== Domanda 8
E' possibile avere delle dritte per il requisito analisi dello stato dell’arte, esempi di piattaforme da analizzare, quale dovrebbe essere la struttura approssimativa?

#enfasi[Risposta 8]
Sicuramente, all'occorrenza, possiamo darvi delle indicazioni al momento opportuno. Anche se avete gia un esempio di quella che è l'architettura a grandi linee.

\ \

== Domanda 9
Sarebbe possibile organizzare degli incontri con i referenti tecnici del progetto e se si con quale frequenza? Con quale sistema ci teniamo in contatto per eventuali aggiornamenti (Email, telegram, ecc.)?

#enfasi[Risposta 9]
Sicuramente, all'occorrenza, possiamo darvi delle indicazioni al momento opportuno, anche se avete già un esempio di quella che è l'architettura a grandi linee. Per la frequenza due tipi di incontri in giorni settimanali fissi:
- incontro "formale" bisettimanale di stato avanzamento lavori e allineamento;
- incontro bisettimanale breve (nelle settimane in cui non c'è l'incontro "formale") per risolvere i problemi insieme, preferibilmente inviando qualche giorno prima le domande.

\ \

== Domanda 10
Per quanto riguarda i test di sicurezza elencati a pagina 12 avete delle preferenze riguardo alla tipologia di penetration test sulla quale dovremo concentrarci maggiormente (es cloud testing, API testing )?

#enfasi[Risposta 10]
Solo nei punti più critici dell'applicazione, che dovrete individuare voi.

\ \ 

== Domanda 11
Capitolo 2, verso la fine è scritto: “Nel contesto del progetto, gli studenti non realizzeranno un gateway fisico ma svilupperanno un simulatore di gateway, in grado di riprodurre in maniera verosimile il comportamento di un nodo BLE–WiFi. Tale simulatore sarà utilizzato per validare l’infrastruttura cloud e per testare i flussi di comunicazione previsti”. Per quanto riguarda il simulatore del gateway BLE–WiFi:
- Saranno forniti esempi o specifiche dei flussi di comunicazione tra il gateway (Edge Layer) e il cloud (Control & Management Layer)?
- Quale livello di complessità è richiesto per il simulatore? Deve anche gestire scenari di errore (es. perdita di connessione con i sensori o con il cloud), oppure è sufficiente simulare un comportamento ideale per la validazione del sistema?

#enfasi[Risposta 11]
- No, perchè è uno degli ottetti del capitolato, ma se necessario si puo venire incontro per definire il flusso al momento opportuno.
- Il grado di complessità richiesto è il minimo indispensabile. Ci aspettiamo, oltre al caso ideale, almeno di gestire almeno qualche caso di errore come il caso di interruzione della comunicazione tra Gateway e Cloud (es. salta la corrente in casa e il gateway continua a raccogliere dati grazie alla propria batteria interna, per poi inviarli quando sarà stata ristabilita la connessione al cloud). Tutto ciò che comprende la connessione tra sensori e gateway è fuori scope. Il simulatore deve essere configurabile (es. attraverso un file YAML/JSON), per poter indicare i tipi di sensori connessi da simulare e generare dati verosimili. Tipi di sensori possono essere quelli per misurare i parametri vitali di una persona (es. battito cardiaco, ECG, pressione sanguinia, saturazione ossigeno, livelli glicemia, peso, ecc.). 

== Domanda 12
Avete una preferenza sul protocollo di comunicazione tra gateway e cloud (HTTPS o MQTT)? Meglio solo uno o entrambi?

#enfasi[Risposta 12]
Sì, MQTT, purchè non produca ritardi, in quel caso meglio HTTPS.

\ \ 

== Domanda 13
Capitolo 3.3 è scritto: “Include un sistema di persistenza temporanea dei dati, con possibilità di estensione a database a lungo termine.” Quindi nell’MVP non è richiesto che l’applicazione salvi i dati su database a lungo termine?

#enfasi[Risposta 13]
Sì è richiesto che nell'MVP l'applicazione salvi i dati su database a lungo termine.

]
