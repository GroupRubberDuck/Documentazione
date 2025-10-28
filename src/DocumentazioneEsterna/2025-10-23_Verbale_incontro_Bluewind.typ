#import "/src/config.typ":*
#import template_dir+"/frontPage.typ": frontPage
#import template_dir+"/setUpPageLayout.typ": insertRomanNumberedPages, insertArabicNumberedPages
#import template_dir +"/registroModifiche.typ":registroModifiche


#let giornoRiunione=datetime(year:2025, month:10, day:23)

#let enfasi(doc)={
  align()[
    #set text(weight: "bold", size: 18pt)
    #doc
  ]
}

#frontPage("Verbale Riunione con Bluewind S.r.l.",giornoRiunione)


#insertRomanNumberedPages("Registro modifiche","Verbale esterno",giornoRiunione)[
  #let color=rgb("#646869")
  #registroModifiche(colore:color,
  (
    ("0.1", giornoRiunione.display(), "Prima stesura", "Felician Mario Necsulescu", "Tutto il gruppo"),
    ("1.0", "2025-10-26", "Aggiunta registro delle modiche e piccole correzioni", "Felician Mario Necsulescu ", "Tutto il gruppo"),
    ("2.0", "Da definire", "Firma dell'azienda", "Alessandro Zappia", "Tutto il gruppo"),
  )
  )
]



#insertRomanNumberedPages("Indice","Verbale esterno",giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]
#context counter(page).update(1)



#insertArabicNumberedPages("Informazioni generali","Verbale esterno",giornoRiunione)[
  
  = Informazioni generali
- *Tipo di riunione*: Esterno
- *Data*: #giornoRiunione.display()
- *Luogo*: Riunione online su Zoom
- *Ora inizio*: 15:00
- *Ora fine*: 15:25
- *Portavoce*: -
- *Scriba*: Felician Mario Necsulescu
- *Partecipanti*:
  #align(left)[
    #set list(marker: [--])
    - Ana Maria Draghici
    - Davide Lorenzon
    - Felician Mario Necsulescu
    - Alessandro Zappia (Bluewind S.r.l.)
  ]
  
]

#insertArabicNumberedPages("Ordine del giorno","Verbale esterno",giornoRiunione)[
  = Ordine del giorno
  #set list(marker: [‣])
  - Chiarimenti sui requisiti del progetto EN18031 Compliance Verification
  - Discussione sulle funzionalità opzionali
  - Definizione delle modalità di collaborazione
  - Approfondimenti sulla struttura della norma EN18031
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale esterno",giornoRiunione)[
  = Riassunto della riunione 
  Le domande poste sono state le seguenti:

  == Domanda 1
  Per la funzionalità opzionale della giustificazione delle risposte, sarebbero sufficienti delle note testuali oppure anche altro di più specifico, magari qualche file particolare?

  #enfasi[Risposta 1]
  Sono sufficienti note testuali che giustificano il motivo della risposta, aggiungendo un po' più di descrizione alla giustificazione. \ \

  == Domanda 2
  Quando un utente modifica una risposta già fornita e cambia il risultato finale di un requisito ad esempio da Pass a Fail, i requisiti che dipendono logicamente da esso devono essere completamente cancellati e l'utente deve rifarli, oppure si mantengono le risposte ma si ricalcolano i risultati finali?

  #enfasi[Risposta 2]
  La procedura prevede un rilancio dall'inizio. Se vengono fatte modifiche sul comportamento, si ripercorre tutto il percorso e anche i requisiti successivi verranno ricreati. Se il primo requisito non passava precedentemente e sono state fatte modifiche, si rifà la procedura e anche i successivi che dipendono da quello avranno un risultato diverso. Principalmente verrà rifatta la procedura del percorso delle domande del Decision Tree. \ \

  == Domanda 3
  Se implementiamo l'editor grafico per i Decision Tree, questo deve includere un sistema di validazione della correttezza logica? Cioè ogni percorso aggiunto deve terminare obbligatoriamente in un nodo risultato?

  #enfasi[Risposta 3]
  Sì, sarà necessario controllare che quello che è stato modificato graficamente abbia un senso. L'editor deve impedire il salvataggio se non viene rispettata la logica. \ \

  == Domanda 4
  Nel caso della versione web-based, potrebbe essere incluso un sistema di monitoraggio attraverso piattaforme esterne come Grafana o Prometheus?

  #enfasi[Risposta 4]
  Non ci sono limitazioni su cosa volete usare per quella parte. Principalmente è utile suddividere le parti: una parte che si occupa della logica (che può essere scritta in Python) e la parte web-oriented che si aggancia per la rappresentazione grafica. Potete usare quello che preferite. \ \

  == Domanda 5
  Con quale frequenza siete disposti a tenere gli incontri e in che modalità?

  #enfasi[Risposta 5]
  Per noi potrebbe andare bene 1-2 volte a settimana, dipende da voi e dal vostro carico. Una frequenza maggiore permette incontri più brevi, mentre una frequenza minore porta a riunioni più lunghe. Si può pensare a una volta a settimana. Ovviamente ci sarà un incontro iniziale per presentare il tutto e far vedere come è strutturata la norma, che è la parte più corposa. Gli incontri possono essere principalmente online dato che voi siete a Padova e noi a Castelfranco Veneto. Se necessario ci si può trovare in presenza organizzando un punto d'incontro. \ \

  == Domanda 6
  Quanti requisiti dobbiamo coprire? Dobbiamo ricoprirli tutti?

  #enfasi[Risposta 6]
  No, è un gruppo ristretto, altrimenti la norma è troppo corposa. Nel capitolato sono state indicate due sezioni di requisiti Access Control Mechanism [ACM] e Authentication Mechanism [AUM] descritti in EN18031-1. In base a come si prosegue, si vedrà se riusciamo a coprire tutti o solo un gruppo. L'interesse è intanto coprire quel gruppo, che è solo una sottosezione di tutta la norma. \ \

  == Domanda 7
  Per l'aspetto delle tecnologie, avete suggerito Python 3 per il backend. Per il frontend ci sono tecnologie preferite?

  #enfasi[Risposta 7]
  No, viene lasciata libertà se sfruttare sempre Python o usare altre tecnologie. Non ci sono limitazioni. \ \

  == Domanda 8
  Nei requisiti minimi al punto 5 viene indicato che bisogna rispettare le gerarchie fra i requisiti. Cosa significa?

  #enfasi[Risposta 8]
  Sarà chiaro quando si entra nella norma. I requisiti dipendono uno dall'altro: ogni requisito ha dei Decision Tree ed è legato a requisiti precedenti in base a come descritto nella norma. Ci sono collegamenti tra uno e l'altro, quindi il percorso fatto dai requisiti precedenti si ripercuote su quelli successivi se c'è correlazione. Questo dovrà essere descritto nei file che descrivono i Decision Tree e creerà vincoli sulle parti successive. Ci saranno anche vincoli relativi ai file forniti in ingresso che descrivono interfacce o servizi del dispositivo da analizzare (come l'esempio della macchina del caffè). La gerarchia è descritta nella norma e bisogna scriverla nei file relativi ai Decision Tree. \ \

  == Domanda 9
  Per l'editor grafico, c'è un'idea di come andrebbero modificati i Decision Tree? Si pensa a drag and drop per la questione grafica?

  #enfasi[Risposta 9]
  Non c'è un'idea fissa. Dipende da quanta complessità si vuole aggiungere: si può fare un editor semplice dove si agisce in modalità testuale, o un passo successivo con parte grafica dove si agganciano i vari blocchetti con drag and drop. La scelta è lasciata a voi in base a cosa risulta più semplice. Lo step più importante è avere file testuali che descrivono i Decision Tree, che verranno poi importati e su cui si può agire per modifiche e risalvataggio nello stesso formato. La parte più corposa è creare questi file. Per questo motivo quella parte è stata messa come opzionale. Basta che vengano fatte verifiche sulla correttezza del flusso dopo le modifiche. \ \

  == Domanda 10
  Si parlava di costruire un manuale tecnico e documentazione del codice. Come ci si deve aspettare questa documentazione?

  #enfasi[Risposta 10]
  La documentazione si articola su più livelli:
  - Commentare il codice per capire cosa sta facendo;
  - Un piccolo manuale d'uso dell'applicazione che descrive le funzionalità, quindi una manualistica su come utilizzare l'applicazione.
  \ \

  == Domanda 11
  Sui documenti che fornirete che descrivono il caso d'uso del dispositivo da analizzare, che informazioni conterranno?

  #enfasi[Risposta 11]
  I documenti forniranno principalmente le interfacce del dispositivo. Ad esempio: tipo di interfacce di ingresso (WiFi, Bluetooth o altro), tipo di servizi interni, possibilità di accesso dall'esterno. Nel caso della macchina del caffè: WiFi e MQTT come punti da considerare. Queste informazioni si collegheranno ai Decision Tree, perché per ognuna di queste interfacce dovranno essere richiamati i vari Decision Tree, quindi per ogni interfaccia. I documenti saranno in formato testuale come CSV o JSON. \ \

  == Domanda 12
  I Decision Tree sono specifici per la macchinetta del caffè o possono essere allargati ad altri dispositivi che funzionano in modo diverso?

  #enfasi[Risposta 12]
  L'applicazione è generica. La macchinetta del caffè è un esempio di cosa si va ad analizzare attraverso l'applicazione. Si possono considerare anche altri esempi diversi, dispositivi collegati in modo diverso. È un caso concreto ma si può prendere anche un altro caso concreto come un dispositivo IoT connesso remoto via Bluetooth. L'applicazione deve essere generica, poi il risultato dipende dal dispositivo che si vuole analizzare. \ \

  == Commento referente sulla documentazione
  
  La documentazione può ampliarsi in base a come volete. Ci sarà tutta la parte di requisiti di quello che si vuole andare a implementare. Questo è un discorso più ampio che può essere toccato ed entrare nei dettagli. Può essere un altro punto di documentazione richiesta: requisiti su come si vuole implementare alcune sezioni, o meglio, che cosa è necessario implementare. Può esserci anche una parte su come si vuole fare, agganciando un aspetto con l'altro. Su come ampliare in futuro: se ci sono questi punti, in base a quello che è stato messo, si può partire da quelli per aggiungere funzionalità. \ I macro blocchi della documentazione sono:
  - Documentazione a livello di codice;
  - Documentazione a livello di progetto che può includere anche analisi dei requisiti e su come si vuole fare la parte implementativa;
  - Alla fine del progetto, manualistica su come utilizzare l'applicazione.
  \ \

  == Domanda 13
  Per i documenti che fornirete che descrivono il caso d'uso del dispositivo da analizzare, oltre alle interfacce del dispositivo, ci sono altre informazioni specifiche?

  #enfasi[Risposta 13]
  I documenti forniranno principalmente le interfacce che avrà il dispositivo, che dipendono ovviamente dal dispositivo stesso. Possono essere: tipo di interfacce di ingresso (WiFi, Bluetooth o altro), tipo di servizi interni. Potrebbe essere nel caso della macchina del caffè MQTT come possibilità di accesso dall'esterno, quindi WiFi. Bisogna considerare questi punti. Queste informazioni si collegheranno ai Decision Tree perché per ognuna di queste interfacce dovranno essere richiamati i vari Decision Tree, quindi per ogni interfaccia. \ \

  == Domanda 14
  I documenti saranno sempre sotto forma di JSON, XML o altri formati?

  #enfasi[Risposta 14]
  Sì, pensavamo di fornirli in formato CSV o JSON, comunque un formato testuale di questo genere da analizzare in ingresso. \ \

]