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
#let giornoRiunione = datetime(year: 2025, month: 12, day: 02)



#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "Validato",
    versione: versionNumber,
    autori: ("Filippo Guerra","Davide Lorenzon"),
    verificatori: ("Davide Lorenzon","Aldo Bettega"),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo","BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[2025-12-03],[Filippo Guerra],[Davide Lorenzon],[Stesura del verbale]),
    ([0.1.1],[2025-12-07],[Davide Lorenzon],[Aldo Bettega],[Correzione dei contenuti del verbale]),
    ([1.0.0],[2025-12-09],[Filippo Guerra],[Filippo Guerra],[Approvazione del documento]),
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
- *Data*: 2025-12-02
- *Luogo*: Riunione su Zoom
- *Ora inizio*: 16:00
- *Ora fine*: 17:20
- *Scriba*: Filippo Guerra
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
    + Revisione del documento di Analisi dei Requisiti.

    + Chiarimenti sulla distinzione tra documenti tecnici del dispositivo e decision tree.

    + Discussione sulla gestione dei decision tree (importazione, modifica, validazione) e sui ruoli dell'utente e permessi (utente standard e responsabile tecnico).

      - Gestione delle giustificazioni e requisiti Not Applicable.

    + Struttura della dashboard e comportamento dell’esecuzione dei requisiti.

    + Esportazione dei risultati.

    + Indicazioni sulla gestione del progetto, pianificazione e comunicazione interna.
]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  La riunione si è svolta partendo dalla presentazione del gruppo del documento *Analisi dei Requisiti*, che è stata intervallata da domande riguardo ai requisiti funzionali e non del progetto. \ 
  Successivamente sono state fatte alla proponente delle domande riguardanti la gestione dei documenti e i problemi riscontrati durante questo sprint dai vari membri del gruppo. 
  == Revisione dei riferimenti e gestione del copyright <riferimenti>
  Il gruppo chiede conferma sull’uso di riferimenti normativi nel documento di analisi. \
  BlueWind raccomanda di evitare link a documenti non pubblici o copiati da Drive. \
  Devono essere utilizzati solo link ufficiali, come quelli del sito dell’ente normativo o della pagina di acquisto dello standard EN18031.

  == Distinzione tra documenti tecnici e decision tree <separazioneDT-asset>
  L'azienda chiarisce che :
  - I *Documenti Tecnici* sono file descrittivi (CSV, JSON, XML) contenenti asset, funzioni e configurazioni del dispositivo.
  - I *Decision Tree* sono file strutturati (JSON o XML) contenenti la logica dei requisiti EN18031. \ Essi non devono essere hard-coded nell’applicazione per semplificare aggiornamenti futuri.
  Per quanto riguarda l'importazione dei file viene stabilito che:
  - I *decision tree devono essere importati automaticamente* all’avvio dell’applicazione. \ Non è previsto che l’utente selezioni manualmente quali alberi importare.
  - I *documenti tecnici possono essere importati da più file* e in momenti differenti.
  Per quanto riguarda la gestione degli errori di importazione:
  - Per i documenti tecnici devono essere previsti errori di formato e/o errori di parsing parziale.
  - Per i decision tree un errore è più grave e deve essere trattato come un'anomalia globale di caricamento.

  == Gestione dei Decision Tree e permessi degli User <gestioneDT>
  BlueWind conferma che la modifica dei *Decision Tree* riguarda: i testi delle domande, i nodi e la struttura gerarchica, le foglie e gli esiti finali. \ 
  La modifica è pensata per: 
  - adattamenti dovuti a revisioni della norma EN18031;
  - applicazione della stessa logica ad altri standard.
  La validazione dovrà essere in grado di intercettare errori quali i seguenti :
  - *cicli*,
  - *nodi orfani*,
  - *percorsi interrotti*,
  - *foglie finali mancanti*,
  - *altre incoerenze logiche*.//cosa è un'incoerenza logica
  

  === Gestione dei requisiti Not Applicable e giustificazioni <gestioneNA>
  BlueWind conferma che : 
  - Ove lo standard lo prevede, quando un requisito è Not Applicable, anche i requisiti da esso dipendenti devono diventare automaticamente Not Applicable, le dipendenze sono stabilite nello standard.
  - La documentazione tecnica degli asset determina se un requisito è applicabile o meno.
  - Può essere obbligatoria la compilazione di una giustificazione, come previsto dalla norma.
  L’interfaccia dovrà quindi:
  - mostrare una textbox in caso di esito N/A,
  - memorizzare e rendere consultabili le giustificazioni,
  - includerle nel report finale.

  In merito ai ruoli utente, vengono definiti due tipologie di utenti differenti, 
  *l'utente standard* e un *responsabile tecnico* (nomenclatura temporanea)
  con le relative autorizzazioni:
  - L’utente standard può:
    - inserire asset e relative specifiche tecniche,
    - eseguire i decision tree e consultare i risultati.
  - Il *responsabile tecnico autorizzato* può:
    - accedere all’editor grafico,
    - modificare decision tree,
    - salvare nuove versioni dei file.

  == Struttura della dashboard e comportamento dell’esecuzione dei requisiti. <dashboard>
Viene stabilito che la dashboard deve mostrare:
  - lista asset,
  - requisiti per ogni asset,
  - stato dei requisiti (Non iniziato, In corso, Pass, Fail, N/A),
  - dipendenze dei requisiti,
  - disponibilità all’esecuzione.
La dashboard deve inoltre offrire la possibilità di filtraggio e ordinamento, un 
accesso all’editor grafico (la parte che permette di modificare i DT è disponibile solo per i responsabili tecnici), e la possibilità di rieseguire o cancellare valutazioni.


Per quanto riguarda l'esecuzione dei requisiti e gestione delle dipendenze, 
  BlueWind specifica che *l’esito finale è calcolato solo all’ultimo nodo*.
  Il sistema deve bloccare l’esecuzione se i prerequisiti non sono in stato *Pass* o *Not Applicable*.
  In tal caso il sistema:
  - notifica i requisiti non soddisfatti,
  - li evidenzia in dashboard,
  - impedisce l’avvio del decision tree.
  == Esportazione dei risultati <export>
  BlueWind afferma che sarà possibile anche esportare *risultati parziali* (negli stessi formati ammessi in importazione). \
  I formati supportati per i report includono PDF. \
  Inoltre l’export deve includere i seguenti elementi:
  esiti, percorsi di esecuzione dei decision tree e le eventuali giustificazioni.

  == Indicazioni sulla gestione del progetto, pianificazione e comunicazione interna. <organizzazione>
  Viene consigliata un'analisi dei rischi dettagliata nel "Piano di progetto", una pianificazione realistica delle attività e un'assegnazione chiara dei ruoli. \
  Per quanto riguarda la gestione delle issue, il gruppo ha riscontrato difficoltà a definire issue atomiche quando non si conosce bene il risultato finale.  \
  BlueWind consiglia di creare issue "di indagine" preliminari e di trasformarle in issue atomiche solo successivamente. 
  \ Inoltre suggerisce di suddividere i compiti
  anche tra più persone nella fase di esplorazione, così da prevenire ritardi dovuti a eventuali problemi personali dei membri del gruppo. \
  Relativamente alla comunicazione interna, il gruppo effettua costantemente una riunione lunga alla settimana che non sempre risulta essere efficace. \
  BlueWind consiglia incontri più brevi e frequenti (bigiornalieri) per sincronizzarsi meglio, una revisione costante delle issue e aggiornamenti più rapidi per evitare l'accumulo di problemi che potrebbero 
  sopraggiungere, una definizione chiara di priorità e responsabilità.

]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VE.2."

#let decisioni=(
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [I decision tree saranno importati globalmente e automaticamente.],
  [Su suggerimento della proponente.],
  [@separazioneDT-asset]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [I file dei documenti tecnici possono essere multipli e importati separatamente.],
  [Su suggerimento della proponente.],
  [@separazioneDT-asset]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [L’editor dei decision tree sarà accessibile solo a un responsabile tecnico.],
  [Su suggerimento della proponente.],
  [@gestioneDT]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Le giustificazioni richieste dallo standard sono obbligatorie e devono essere incluse nei report],
  [Su suggerimento della proponente.],
  [@gestioneDT]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Il sistema deve validare in modo rigoroso la struttura dei decision tree.],
  [Su suggerimento della proponente.],
  [@dashboard]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [La dashboard sarà l’elemento centrale di navigazione del sistema.],
  [#upper("è") stato suggerito dalla proponente.],
  [@dashboard]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Aggiunto un nuovo attore, responsabile tecnico.],
  [Su suggerimento della proponente.],
  [@gestioneDT]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Formati supportati per l'import dei DT: JSON, XML.],
  [Su suggerimento della proponente.],
  [@separazioneDT-asset]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Formati supportati per l'import dei documenti tecnici legati agli asset: JSON, XML, CSV.],
  [Su suggerimento della proponente.],
  [@separazioneDT-asset]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Formati supportati per l'export dei risultati parziali: JSON, XML, CSV.],
  [Su suggerimento della proponente.],
  [@export]
),

(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Formati supportati per i report: PDF.],
  [Al gruppo è sembrato un formato opportuno per un report.],
  [@export]
),

)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]

#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.9."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Filippo Guerra],
  [Redazione del verbale di questa riunione.],
  [-],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Deciso in seguito.],
  [Aggiornare il documento Analisi dei Requisiti con tutte le precisazioni ricevute],
  [VE.2.1-VE.2.6],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Deciso in seguito.],
  [Raffinare i casi d’uso su importazione, esecuzione, dashboard, modifiche DT],
  [VE.2.1-VE.2.6],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Deciso in seguito.],
  [Introdurre la distinzione tra utente standard e responsabile tecnico],
  [VE.2.7],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Deciso in seguito.],
  [Aggiornare i casi d’uso],
  [VE.2.1-VE.2.11],
),

  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

La riorganizzazione delle issue GitLab/GitHub e il miglioramento della comunicazione interna tra i membri del gruppo non è stato classificato all'interno dei TODO in quanto è un'attività esclusivamente di "palestra".
]