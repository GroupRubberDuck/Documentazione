#import "/src/config.typ":*
#import template_dir+"/frontPage.typ": frontPage
#import template_dir+"/setUpPageLayout.typ": insertRomanNumberedPages, insertArabicNumberedPages
#import template_dir +"/registroModifiche.typ":registroModifiche


#let giornoRiunione=datetime(year:2025, month:10 , day:20)

#let enfasi(doc)={
  align()[
    #set text(weight: "bold", size: 18pt)
    #doc
  ]
}

#frontPage("Verbale Riunione con Ergon",giornoRiunione)


#insertRomanNumberedPages("Registro modifiche","Verbale esterno",giornoRiunione)[
  
    #let color=rgb("#dddfe0")
  #registroModifiche(colore:color,
  (  ("0.1", giornoRiunione.display(), "Prima stesura", "Aldo Bettega", "Davide Lorenzon"),
  ("1.0", giornoRiunione.display(), "Correzione typo", "Davide lorenzon  Aldo Bettega ", "???????"),
  ("2.0", "2025-10-22" , "Aggiunto registro delle modifiche", "Davide Lorenzon", " ???? "),
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
- *Ora inizio*: 16:45
- *Ora fine*: 17:00
- *Portavoce*: -
- *Scriba*: Aldo Bettega
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega
- Gianluca Carlesso (Ergon)

]
  
]

#insertArabicNumberedPages("Ordine del giorno","Verbale esterno",giornoRiunione)[
  = Ordine del giorno
  #set list(marker: [‣])
  - Esporre 17 domande precedentemente preparate dal gruppo
]

#insertArabicNumberedPages("Riassunto della riunione ","Verbale interno",giornoRiunione )[
= Riassunto della riunione 
Le domande poste sono state le seguenti:

#enfasi[== Domanda 1]
Nel capitolato viene suggerito di iniziare concentrandosi su una o due modalità di input per poi estendere gradualmente il sistema. In base alla vostra esperienza da quale fonte dati consigliate di partire prioritariamente tra testo, immagini e audio?\

#enfasi[Risposta 1]
L'ordine è testo, audio e poi immagine \ \

== Domanda 2
Il documento presenta un'ampia gamma di tecnologie suggerite per ciascun layer dell'architettura. Esistono quindi tecnologie specifiche che, in base alla vostra esperienza o ai requisiti tecnici aziendali, ritenete preferibili o più adatte rispetto ad altre tra quelle elencate nel capitolato?

#enfasi[Risposta 2]
Sul documento ci sono una serie di tecnologie suggerite, ma siete liberi di utilizzarne altre. Influisce molto LLM che andrete a scegliere. \
Nella parte di frontend sono consigliati react o angular. Per la parte di AI è consigliato Pyhton e viene sconsigliato di provare altre tecnologie. \ \


== Domanda 3
Ci sono delle metriche di performance considerate prioritarie per il sistema? Ad esempio se si fa più attenzione all'accuratezza nell'estrazione dati, nella velocità di elaborazione, nella user experience oppure nella robustezza e gestione di input incompleti o ambigui.

#enfasi[Risposta 3]
La priorità è l'accuratezza che di conseguenza da un grande vantaggio nella User Experience. Mentre passa in secondo piano la performance e velocitò di elaborazione. \ \

== Domanda 4
Come si deve comportare il sistema con input troppo ambigui o incompleti? Ci sono procedure di fallback specifiche? Si può avere anche validazione manuale in questi casi? O sempre esclusivamente automatizzata?

#enfasi[Risposta 4]
Più avanti potremo definire i vari requisiti In caso di troppa ambiguità il sistema può dire che non ha capito e chiedere all'utente di ripetere meglio l'ordine. L'utente può confermare o variare la proposta che il sistema ha fatto o anche richiedere l'intervento di un operatore.

== Domanda 5
Cosa si intende per interfaccia utente? come si gestiscono gli input provenienti da diverse piattaforme in un'unica interfaccia?

#enfasi[Risposta 5]
Sicuramente un'interfaccia web su cui l'utente può caricare foto o video, poi, perchè no, si può implementare un audio via whatsapp e il sistema risponde con il link dell'ordine che l'utente dovrà confermare o modificare. \ \

== Domanda 6
Qual è il target dell'utenza? di quale lingua?

#enfasi[Risposta 6]
Minimo lingua italiana, il resto è un di più. Poi in generale gli LLM sono multilingua, quindi non dovrebbero avere questi problemi, al massimo l'interfaccia. \ \

== Domanda 7.
Avete per caso dei test specifici che vorreste che fossero coperti oppure volete solo test funzionali come test delle performance, test per la validazione degli input nel caso della sicurezza?

#enfasi[Risposta 7]
Si può pensare ad un insieme di test di input e verificare l'output, quindi solo test funzionali. Invece a livello di sicurezza usando canali HTTPS si è già abbastanza coperti. \ \

== Domanda 8
Potete fornirci una stima iù o meno del valore atteso degli ordini da processare?

#enfasi[Risposta 8]
Circa un migliaio al giorno.\ \

== Domanda 9
Esiste uno schema o protocollo standard utilizzato dalla maggior parte degli RP per inserire gli ordini oppure se ognuno ha le proprie API dato che era scritto nel capitolato che il formato di output deve essere JSON, XML o tabella per il database? se c'è già un formato o dobbiamo decidere noi?

#enfasi[Risposta 9]
Noi abbiamo i nostri ERP che hanno il loro formato, poi ogni ERP ha un proprio formato di inserimento di ordine \ \

== Domanda 10
Avete una preferenza per la piattaforma di scalabilità, quindi Docker, Kubernetes, Terraform, Ansible 

#enfasi[Risposta 10]
Fra queste Docker, ma siete liberi di scegliere. Docker è quella che va per la maggiore \ \

== Domanda 11
Era specificato che il codice deve essere pubblico e quidni ci chiedevamo che tipo di licenza consigliate.

#enfasi[Risposta 11]
Potete decidere voi.

== Domanda 12
si dice che il sw dovrà essere in grado di riconoscere etichette, codici a barre o documenti, quindi deve riconoscere solo caratteri e simboli oppure deve ricavare informazioni da oggetti presenti in immagini?

#enfasi[Risposta 12]
Il sistema deve essere in grado di leggere testo e immagini come QR code o a barre, ma non è pensato per la ricerca di immagini come google Lens?\ \

== Domanda 13
Nella parte di architettura ci sono 8 punti guida che deve seguire il sw. I primi 6 punti riportano a vari strumenti IA. In queste parti dovremo andare a sfruttare funzionalità di strumenti già esistenti (cioè dare in pasto dati e gestire l’output generato da questi strumenti) oppure dovremo crearne altre o specializzarli in quello che richiede il progetto?

#enfasi[Risposta 13]
Al massimo specializzarli (fine tuning) perchè non avreste la capacità di calcolo per addestrarli, infatti motori come GPT sono già in grado di eseguire certe indicazioni. Dovete adattarli alla realtà del progetto, quindi descrivere il tipo di prodotti dell'azienda. Si parte sempre da qualcosa di pre addestrato. \ \

== Domanda 14
Quale degli 8 punti risulta secondo voi più importante? Quale più complesso e con maggior richiesta di lavoro?

#enfasi[Risposta 14]
Il più importante è il 5, mentre quello più complesso il 4 perchè la parte di trasformazione da informazione scritta/vocale/immagine a token risulta complessa, ci saranno difficoltà soprattutto con le immagini. Mentre per l'audio, salvo che non sia disturbato, è semplice. \ \

== Domanda 15
Su richiesta nostra ci potete fornire tutti i dati d'addestramento per fare il fine tuning?

#enfasi[Risposta 15]
Sì. \ \

== Domanda 16
Siccome il formato finale può cambiare da azienda a azienda, serve che tramite interfaccia utente sia possibile impostare come deve risultare il formato?

#enfasi[Risposta 16]
Volendo sì, però lo metterei come requisito facoltativo. \ \

== Domanda 17
Con quale frequenza avverrano gli incontri? in che modalità?

#enfasi[Risposta 17]
Siamo a vostra disposizione in base a come volete organizzarvi e ai vostri impegni. Vanno bene sia incontri via zoom che in presenza. Ogni 3-4 settimane sarebbe utile fare il punto della situazione se non ci siamo ancora sentiti, mentre per tutto il resto, quando avete necessità mi mandate una mail.


]

