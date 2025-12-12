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
#let giornoRiunione = datetime(year: 2025, month: 11, day: 18)




#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Approvato",
    versione: versionNumber,
    autori: ("Davide Lorenzon",),
    verificatori: ("Felician Mario Necsulescu","Aldo Bettega"),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo","BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[2025-11-17],[Davide Lorenzon],[Aldo Bettega],[Stesura delle domande]),
    ([0.2.0],[#giornoRiunione.display()],[Davide Lorenzon],[Felician Mario Necsulescu],[Stesura delle sezioni rimanenti]),
    ([1.0.0],[2025-11-18],[Davide Lorenzon],[Davide Lorenzon],[Approvazione]),

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
- *Motivazione*: Chiarimento di dubbi da parte della proponente
- *Data*: 2025-11-18
- *Luogo*: Riunione su Zoom
- *Ora inizio*: 16:00
- *Ora fine*: 16:45
- *Scriba*: Davide Lorenzon
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega  \
#set list(marker: [#set text(fill:blue) 
•
])
- Alessandro Zappia
- Tobia Fiorese
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  == Domande per la proponente
  + Ci potete dare delle dritte per l’Analisi dei Requisiti?
    Abbiamo avviato l’Analisi dei Requisiti e stiamo definendo l’ambiente generale del sistema. Sono però emersi alcuni dubbi in questa fase iniziale. Nell’introduzione dell’Analisi dei Requisiti è presente una sezione dedicata alla piattaforma/ambiente che verrà utilizzato, nella quale vengono indicate sia una possibile soluzione web-based sia un’applicazione desktop: 

    #pad(left: 1em)[
      - C’è una preferenza che potete fornire, anche dalle vostre esperienze? E dal vostro punto di vista quali sono i pro e contro principali da iniziare a valutare tra soluzione web o desktop?
      - Una soluzione desktop dovrebbe funzionare anche offline (se l'applicazione è divisa in back-end e front-end)? E questo aumenterebbe la complessità? (Per esempio per caricamento, valutazione dei file, visualizzazione futura dei risultati)
      - Infine, nella prospettiva di un futuro testing: nel caso web ipotizziamo compatibilità tra i principali browser (Chrome, Mozilla, Safari) ; nel caso desktop, invece, dobbiamo prevedere più sistemi operativi (windows, linux, macOS)?Eventualmente quali tool consigliate per scrivere desktop app compatibili con più OS?
    ]
  
  + Vorremmo anche capire meglio chi saranno gli utenti finali del sistema, per definire correttamente i casi d’uso. \ Abbiamo ipotizzato tecnici di conformità che eseguono le valutazioni con i decision tree, responsabili qualità/compliance che usano i risultati dei decision tree e nuovi membri del team per familiarizzare con la norma, ma non sappiamo se sono le figure corrette. Ci sono altri ruoli che pensate possano usare la piattaforma?

  + Ci potete dare delle dritte per  la Proof of Concept?

  + È possibile stabilire dei canali di comunicazione asincroni? Si definisce già un giorno di “recap” specifico o ci aggiorniamo successivamente? 

  + Volevamo chiedervi: noi abbiamo provato già a vedere dei possibili metodi per gestirci fra di noi, però data ancora l’inesperienza non sappiamo bene verso che tecnologie orientarci, anche per questione di coordinamento interno, avete delle dritte che potete darci? Dalle vostre esperienze quali ritenete siano gli aspetti fondamentali su cui concentrarsi per lavorare in team in modo efficiente? Noi comunque abbiamo iniziato a lavorare sulla varia documentazione creando una repository github che se serve condividiamo.

  + Per la questione caso di studio machinetta del caffè: si può già avere un esempio di come questi dati verranno forniti? per capire un attimo qual è la struttura e familiarizzarci.  

  + Sarà fornita della documentazione riguardante le normative che dovremo usare, cioè l’Access Control Mechanism e l’Authentication Mechanism?
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  == Risposte della proponente
  #enum(
    [
      La dritta fornita dalla proponente per iniziare l'Analisi dei Requisiti è stata di studiare lo standard tecnico EN 18031, in particolare le sezioni oggetto del capitolato.
      Inoltre sono stati forniti i documenti utili allo studio dello standard:
      - Testo dello standard
      - Caso studio
      - Link utili
      Per quanto riguarda la questione soluzione web-based vs applicazione desktop per motivi di facilità di espansione e flessibilità potrebbe essere preferibile una soluzione web-based (una possibile estensione potrebbe essere il supporto al lavoro multi-utente in contemporanea).
      Nel caso si scelga di sviluppare un’applicazione desktop, è possibile limitare il supporto al solo ambiente Linux.
      Qualora si opti per un’architettura separata tra front-end e back-end, il back-end può comunque essere eseguito sulla stessa macchina del front-end.
    ],
    [
      Gli utenti finali che utilizzeranno l'applicativo sono utenti esperti dell'ambito IT. Il prodotto software serve a questi utenti per semplificare e velocizzare la verifica di standard tecnici. Non ci sono altri destinatari previsti oltre quelli già specificati.
    ],
    [
      Per quanto riguarda la Proof of Concept e le tecnologie back-end si preferisce l'uso di python 3.x, mentre per il front-end non vengono imposti particolari vincoli.
      Le tecnologie consigliate per il front-end sono le seguenti:
      - Flask(python);
      - React(javascript);
      - Angular(typescript).
      Il consiglio della proponente è quello di scegliere le tecnologie più facili da imparare (basandosi sulla qualità della documentazione oppure sulle nostre esperienze passate).
    ],
    [
      Per quanto riguarda le comunicazioni con l'impresa sono state concordate le seguenti modalità:
      - Asincrona, comunicazioni via mail, creazione di un gruppo telegram, uso di GitHub per condividere codice e documenti;
      - Sincrona, incontri bisettimanali (prossimo incontro programmato per martedì 2025-12-02), possibilità di concordare ulteriori incontri qualora siano necessari. Ad esempio, a seguito dello studio del materiale fornito, l'azienda proponente si è resa disponibile ad un incontro per rispondere ai dubbi principali.
    ],
    [
      I consigli organizzativi forniti dalla proponente sono basati sulla loro esperienza personale.
      In genere il loro approccio organizzativo si configura come segue:
      + Creazione di un gruppo di lavoro interno riguardante il progetto, utile per semplificare e velocizzare le comunicazioni di bassa importanza;
      + Codice e documentazione sono versionate con GitHub;
      + Brevi incontri giornalieri;
      + Uso della project board di GitHub per la gestione delle issues.
    ],
    [
      Il caso studio è tra i documenti da studiare forniti dalla proponente. 
    ],
    [
      Lo standard tecnico è tra i documenti da studiare forniti dalla proponente.
    ],
  )

  == Approfondimenti tecnici
  #enum(
    [
      *Logica generale del sistema*: \
      La logica si basa su una serie di documenti (assets, decision tree, template) che descrivono i
      requisiti del dispositivo da verificare. \
      L’applicazione deve leggere questi documenti, interpretare i decision tree e mostrare domande
      all’utente, il quale dovrà rispondere (sì/no). In base alle risposte, il flusso avanza tra i requisiti e si conclude fornendo degli output (Pass, Fail, Not Applicable).\
    ],
    [
      Gli *assets*: \
      Sono file allegati al progetto che descrivono specifiche del dispositivo. \ 
      Ogni dispositivo può avere
      assets diversi. \
      In futuro potrebbero essere raccolti in un CSV o altri formati. \
      Servono come base per generare le domande.\
    ],
    [
      Origine del *template* fornito: \
      Il materiale fornito come esempio deriva da un  
      #link("https://github.com/zealience/IoT-Cybersecurity-Compliance")[progetto open-source]. \
    ],
    [
      Cosa deve studiare il gruppo adesso:
      - cosa e quali sono i requisiti;
      - cosa sono i decision tree;
      - come sono strutturati gli assets;
      - come i requisiti sono collegati tra loro.\
    ],
    [
      Flusso delle domande: \
      Ogni decision tree porta a domande la cui risposta è sì/no. \
      Le risposte determinano se procedere, fermarsi o concludere. \
      Tutti gli assets devono passare attraverso lo stesso set di domande.\
    ],
    [
      Presentazione di bozze per l'analisi dei requisiti: \
      #upper("è") possibile presentare delle bozze per ricevere un feedback.\
    ],


  )
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VE.1."

#let decisioni=(
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Creazione di un gruppo Telegram per la comunicazione asincrona],
  [#upper("è") stato suggerito dalla proponente ed è un punto di partenza appropriato per l'AdR.],
  [-]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Iniziare lo studio dello standard tecnico tramite i documenti forniti],
  [#upper("è") stato suggerito dalla proponente ed è un punto di partenza appropriato per l'AdR.],
  [-]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.7."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Davide Lorenzon],
  [Redazione del verbale di questa riunione.],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Stabilito in seguito],
  [Creazione del gruppo Telegram.],
  [VE.1.1],
), 
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


Lo studio dei documenti forniti è un compito per tutti i membri del gruppo, non è stato classificato all'interno dei TODO in quanto è un'attività esclusivamente di "palestra", la redazione di un documento di studio e sintesi sarà svolto successivamente e ad opera di un singolo membro del gruppo.
]

#insertArabicNumberedPages("Approvazione esterna ","Verbale interno",giornoRiunione )[
= Approvazione esterna 
La presente sezione documenta la conferma e la validazione del verbale da parte del proponente esterno.
Il confronto avvenuto durante la riunione ha permesso di chiarire dubbi e punti critici, rappresentando un'importante occasione di condivisione e collaborazione tra le parti.

Con la firma riportata in seguito, il proponente esterno *attesta l'approvazione del documento* nella sua versione corrente.

#place(right)[#image(images_dir+"/approvazione_Bluewind.png")]

]