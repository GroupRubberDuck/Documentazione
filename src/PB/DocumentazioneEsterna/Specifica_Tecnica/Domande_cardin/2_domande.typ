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


#let giornoRiunione = datetime(year: 2026, month: 04, day: 30)
#let doctype = "Riunione"
#frontPage([Dubbi su Specifica Tecnica], giornoRiunione)

#insertRomanNumberedPages("Indice", "Domande", giornoRiunione)[
  #outline(depth: 2, title: "Indice")
]

#pagebreak()
#context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali", "Domande", giornoRiunione)[
  = Informazioni generali
  - *Tipo di riunione*: Esterna
  - *Motivazione*: Chiarimento dubbi
  - *Data*: #giornoRiunione.display()
  - *Luogo*: Riunione su Meet
  - *Ora inizio*: 9.10
  - *Ora fine*: 9.30
  - *Partecipanti*:#align(left)[
      #set list(marker: [--])
      - Aldo Bettega
      - Davide Lorenzon
      - Riccardo Cardin
      \
    ]
]

#insertArabicNumberedPages("Informazioni generali", "Domande", giornoRiunione)[
  = Diagrammi delle classi
  == Outbound Port
  Nella definizione delle outbound port è corretto creare un’interfaccia che eredita da alcune outbound port e poi realizzare un singolo adapter che implementa questa porta,
  ad esempio  le porte che interagiscono con il sistema di permanenza dichiarano ognuna un metodo: save, get, delete e create.

  poi si aggiunge un’interfaccia che eredita da tutte 4 che chiameremo repository e il ConcreteRepository implementa quest’ultima interfaccia

  == Socket ball
  È corretto l’utilizzo di socket ball per rappresentare l’interfaccia (ball) + utilizzo dei metodi esposti della porta (socket)

  #image("assets/image5.png")

  #pagebreak()
  = Architettura
  == Oggetti di passaggio tra adapter e service
  È giusto usare un oggetto DeviceCommand e DeviceReturn che contiene vari campi dati che passa tra service e adapter?
  Queste classi non hanno comportamento, hanno solo lo scopo di standardizzare la comunicazione attraverso le porte inbound, ad esempio una porta che richiede la visualizzazione di un asset manda i dati necessari a trovare l’asset come un oggetto getAssetCommand che in questo caso avrà solo un attributo id poi la porta dichiara che ritornerà un oggetto di tipo getAssetResponse contenente tutti dati che dovranno essere mostrati all’utente

  == Dominio
  Noi all’interno del dominio abbiamo un oggetto device annidato, è composto da Asset che a loro volta sono composti da Answer.

  È stato valutato il pattern aggregate root, ma poi è stato scartato per complessità eccessiva di realizzazione e mancanza di un reale motivo di utilizzo allo stato attuale.
  Tuttavia abbiamo deciso di mantenere le operazioni di modifica accessibili all’esterno solo tramite la classe device, in modo da avere un solo punto centrale dove vengono effettuate le modifiche in modo da semplificare successive transazioni.

  Tuttavia per evitare modifiche che bypassano la classe root e per mantenere l’incapsulamento senza impedire la lettura dei dati dei figli abbiamo introdotto delle classi snapshot delle entità, sono delle copie di sola lettura delle classi possedute dal device.

  ci domandavamo se questo approccio fosse accettabile


]
