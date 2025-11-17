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
#let giornoRiunione = datetime(year: 2025, month: 11, day: 10)
#let doctype="Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: "0.1.0",
    autori: ("Davide Lorenzon",),
    revisori: ("",),
    validatori: ("",),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo","BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let header=("Versione","Data","Descrizione","Autore","Revisore","Validatore")
  #let modifiche=(

    ([0.1.0],[#giornoRiunione.display()],[Stesura delle domande],[Davide Lorenzon],[],[]),
      
      )

      #registroModifiche(modifiche)




]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Esterno
- *Motivazione*: 
- *Data*: 2025-11-18
- *Luogo*: Riunione su Zoom
- *Ora inizio*: 15:00
- *Ora fine*: 17:20
- *Scriba*: Aldo Bettega
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega
- 

]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  == Domande per la proponente
  - Ci potete dare delle dritte per  l’analisi dei requisiti ?
  - Abbiamo iniziato l’Analisi dei Requisiti e stiamo definendo l’ambiente generale del sistema. \ Ci sono però sorti dei dubbi su questa prima valutazione. Una sezione nell’introduzione dell’Analisi dei requisiti è dedicata alla piattaforma/ambiente che andremo a utilizzare. Il capitolo indica sia una possibile soluzione web-based sia un’applicazione desktop. Vorremmo quindi chiedervi: #list([C’è una preferenza che potete fornire, anche dalle vostre esperienze?
E dal vostro punto di vista quali sono i pro e contro principali da iniziare a valutare tra soluzione web o desktop?],
[Una soluzione desktop dovrebbe funzionare anche offline (se l'applicazione è divisa in back-end e front-end)? E questo aumenterebbe la complessità? (Per esempio per caricamento, valutazione dei file, visualizzazione futura dei risultati)],
[Infine, nella prospettiva di un futuro testing: nel caso web ipotizziamo compatibilità tra i principali browser (chrome,mozilla,safari) ; nel caso desktop, invece, dobbiamo prevedere più sistemi operativi (windows, linux,  MacOs)?Eventualmente quali tool consigliate per scrivere desktop app compatibili con più OS],
)
- Vorremmo anche capire meglio chi saranno gli utenti finali del sistema, per definire correttamente i casi d’uso. \ Abbiamo ipotizzato tecnici di conformità che eseguono le valutazioni con i decision tree, responsabili qualità/compliance che usano i risultati dei decision tree e nuovi membri del team per familiarizzare con la norma, ma non sappiamo se sono le figure corrette. Ci sono altri ruoli che pensate possano usare la piattaforma?

- Ci potete dare delle dritte per  la proof of concept (ad esempio requisiti minimi che questa deve avere)?

- È possibile stabilire dei canali di comunicazione asincroni ? Si definisce già un giorno di “recap” specifico o ci aggiorniamo successivamente? 

- Volevamo chiedervi: noi abbiamo provato già a vedere dei possibili metodi per gestirci fra di noi, però data ancora l’inesperienza non sappiamo bene verso che tecnologie orientarci, anche per questione di coordinamento interno, oppure l’uso di tecnologie per dashboard, monitoraggio attività e qualità…avete delle dritte che potete darci? Dalle vostre esperienze quali ritenete siano gli aspetti fondamentali su cui concentrarsi per lavorare in team in modo efficiente? Noi comunque abbiamo iniziato a lavorare sulla varia documentazione creando una repository github che se serve condividiamo.
- Per la questione caso di studio machinetta del caffè  : si può già avere un esempio di come questi dati veranno forniti? per capire un attimo qual è la struttura e familiarizzarci.  
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  == Risoluzione degli argomenti dell'ordine del giorno
  
  
  == Altre questioni emerse
 
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.5."

#let decisioni=(

)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Riferimenti"),columns:(auto,2fr,2fr,1fr))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.5."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I punti da approfondire nelle prossime riunioni o in vista di esse individuati sono stati i seguenti:
#let TODO=(
  
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task (GitHub)","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

]