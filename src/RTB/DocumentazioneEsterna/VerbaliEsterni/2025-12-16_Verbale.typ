#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)




// 
//Info del documento 
// 
#let currentVersion=(
  major:1,
  minor:0,
  patch:0,
)
//converte dizionario in stringa
#let versionNumber=currentVersion.values().map(n=>{str(n)}).join(".")
#metadata(versionNumber)<versionNumber>
#let doctype="Verbale esterno"
#let giornoRiunione = datetime(year: 2025, month: 12, day: 16)



#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: ("Felician Mario Necsulescu",),
    verificatori: (persone.DT,),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo","BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[2025-12-17],[Felician Mario Necsulescu],persone.DT,[Stesura del verbale]),
    ([1.0.0],[2025-12-23],[Felician Mario Necsulescu],persone.FELIX,[Approvazione interna ed esterna del documento]),
    
    )
    

      #registroModifiche(modifiche)




]

#insertRomanNumberedPages("Indice","Verbale esterno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale esterno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Esterno
- *Motivazione*: Chiarimento di dubbi da parte della proponente
- *Data*: 2025-12-16
- *Luogo*: Riunione su Zoom
- *Ora inizio*: 16:00
- *Ora fine*: 16:40
- *Scriba*: Felician Mario Necsulescu
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Filippo Guerra
- Davide Testolin
- Aldo Bettega
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu \
#set list(marker: [#set text(fill:blue) 
•
])
- Alessandro Zappia
- Tobia Fiorese
]
]

#insertArabicNumberedPages("Ordine del giorno","Verbale esterno",giornoRiunione )[
  = Ordine del giorno
    - Presentazione dello stato di avanzamento.

    - Discussione e chiarimenti su tematiche emerse durante l’analisi dei requisiti.

    - Definizione delle attività successive.
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale esterno",giornoRiunione )[
  = Riassunto della riunione
  La riunione è stata dedicata all’analisi e al chiarimento di alcune tematiche rilevanti emerse durante l'attività di analisi dei requisiti, con particolare riferimento alla gestione delle valutazioni nei decision tree, all’organizzazione delle informazioni a supporto dell’utente e alle modalità di trattamento degli input. L’incontro ha consentito di allineare le interpretazioni condivise e di definire indicazioni utili per la prosecuzione delle attività.
  #upper("è") stato anche delimitato lo scope del progetto al solo ambito di valutazione concettuale, escludendo le altre valutazioni definite nello standard (completezza funzionale e sufficienza funzionale, in quanto meno adatte all'automazione e con criteri meno oggettivi).

  == Gestione dello stato dei decision tree <stato>
 Uno dei temi affrontati riguarda la *possibilità di salvare lo stato di avanzamento* durante l’esecuzione degli alberi decisionali. Si discute se il salvataggio debba avvenire esclusivamente al termine dell’albero oppure anche *in modo intermedio*. Viene condivisa l’idea che il salvataggio a metà percorso sia sensato, ad esempio nel caso in cui l’utente debba interrompere l’analisi per mancanza di tempo o preferisca rimandare una decisione. Questa funzionalità permetterebbe di riprendere il lavoro esattamente dal punto in cui era stato lasciato.

 == Alberi decisionali AUM1 (1.1 e 1.2) <interfacce>
 Chiarita la distinzione tra:#pad(left: 1em)[
  - AUM1.1 → *interfacce di rete* (porte, protocolli).
  - AUM1.2 → *interfacce fisiche / utente* (schermi, tastiere).
 ]
  Dunque in base al tipo di interfaccia, verranno applicati requisiti diversi. Il tipo di interfaccia può essere determinato in due modi:#pad(left: 1em)[
  - scelta iniziale da parte dell’utente;
  - lettura da parte del sistema di un *campo nel file di documentazione* che ne indica il tipo.
  ]
  È stata confermata la scelta della seconda opzione, rendendo così il *processo automatizzabile*.

  == Area utente e funzionalità correlate <utente>
  Si è discussa la possibilità di introdurre un’*area utente* con:#pad(left: 1em)[
    - Cronologia delle esecuzioni.
    - Stato di avanzamento degli alberi.
    - Report finali.
  ]
  Utile soprattutto per riprendere esecuzioni interrotte e consultare valutazioni precedenti.
  Questa è stata valutata come funzionalità utile ma *non prioritaria* (eventualmente per sviluppi futuri).
 
 ==  Caricamento dei file e validazioni
  Un’ampia parte della riunione è dedicata al caricamento dei file e ai possibili controlli da effettuare. Si parla di *validazioni preliminari lato client*, come il controllo del formato, della dimensione del file e della presenza di file vuoti. Viene inoltre discusso il tema del parsing e della natura dei file caricati, arrivando alla conclusione che adottare un formato strutturato (ad esempio JSON) semplifica l’elaborazione da parte del sistema e permette di includere informazioni utili, come il tipo di interfaccia.
  Per quanto riguarda la *sicurezza* (file malevoli, doppie estensioni), si riconosce che tali controlli *non sono prioritari*, dato che l’applicazione è destinata ad un *uso interno*.
 
== Giustificazioni per i verdetti “pass” <giustificazione>
  Si affronta il tema delle giustificazioni richieste dalla norma per alcuni verdetti “pass” nei decision tree. Si concorda che la possibilità di inserire una *giustificazione testuale* a fine esecuzione dell’albero sia *rilevante*, soprattutto a fini documentali, e che tale giustificazione possa essere allegata al report finale. Questa funzionalità viene considerata accessoria e *non necessaria per il Proof of Concept*, né è prevista una validazione formale della giustificazione stessa.

== Prossimi passi consigliati <passi>
  Come primo passo concreto per il Proof of Concept, viene suggerito di definire chiaramente la struttura degli alberi e di implementarne l’esecuzione, mostrando *dinamicamente* le domande e il percorso seguito in base alle risposte. Questo permetterà di validare il funzionamento di un singolo requisito. La scelta se partire dal motore logico o dall’interfaccia grafica viene lasciata al gruppo.


]


#insertArabicNumberedPages("Decisioni","Verbale esterno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VE.3."

#let decisioni=(
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [I decision tree possono essere salvati anche se non sono stati completati.],
  [Su suggerimento della proponente.],
  [@stato]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Il sistema andrà a riconoscere in automatico il tipo di interfaccia tramite campo apposito nei file caricati dall'utente.],
  [Su suggerimento della proponente.],
  [@interfacce]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Possibilità di avere un'area utente con cronologia delle esecuzioni, stato di avanzamento degli alberi e report finali.],
  [Su suggerimento della proponente.],
  [@utente]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Aggiungere la possibilità di inserire giustificazioni testuali per i nodi che le richiedono.],
  [Su suggerimento della proponente.],
  [@giustificazione]
),

)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]

#insertArabicNumberedPages("TODO","Verbale esterno",giornoRiunione )[

= TODO
#let prefisso="TD.13."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Felician Mario Necsulescu],
  [Redazione del verbale di questa riunione.],
  [-],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Aldo Bettega, Filippo Guerra ],
  [Aggiornare il documento Analisi dei Requisiti con tutte le precisazioni ricevute.],
  [VE.3.1-VE.3.4],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Deciso in seguito.],
  [Iniziare a capire come implementare la struttura degli alberi decisionali e la loro esecuzione.],
  [@passi],
), 

)
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,2fr,auto),)
]

#insertArabicNumberedPages("Approvazione esterna ","Verbale esterno",giornoRiunione )[
= Approvazione esterna 
La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.
#place(right)[#image(images_dir+"/approvazione_Bluewind_Tobia.png")]

]

