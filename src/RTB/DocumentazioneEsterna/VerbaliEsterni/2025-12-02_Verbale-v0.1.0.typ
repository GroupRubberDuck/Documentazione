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
#let giornoRiunione = datetime(year: 2025, month: 12, day: 02)
#let doctype="Verbale esterno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In Verifica",
    versione: "0.1.0",
    autori: ("Filippo Guerra",),
    verificatori: (""),
    uso: "Esterno",
    destinatari: ("Tutto il gruppo","BlueWind srl"),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[2025-12-03],[Filippo Guerra],[],[Stesura del verbale]),
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
  La riunione si è svolta partendo dalla presentazione del gruppo del documento *Analisi dei Requisiti*, che è stata intervallata da domande riguardo ai requisiti funzionali e non del proggetto. Successivamente sono state fatte alla proponente delle domande riguardanti la gestione dei documenti e i problemi riscontrati durante questo sprint dai vari membri del gruppo. 
  == Revisione dei riferimenti e gestione del copyright
  Il gruppo chiede conferma sull’utilizzo di riferimenti normativi nel documento di analisi.
  BlueWind raccomanda di evitare link a documenti non pubblici o copiati da Drive.
  Devono essere utilizzati solo link ufficiali, come quelli del sito dell’ente normativo o della pagina di acquisto dello standard EN18031.

  == Distinzione tra documenti tecnici e decision tree
  L'azienda chiarisce che :
  - I *Documenti Tecnici* sono file descrittivi (CSV, JSON, XML) contenenti asset, funzioni e configurazioni del dispositivo.
  - I *Decision Tree* sono file strutturati (JSON o XML) contenenti la logica dei requisiti EN18031. \ Essi non devono essere hard-coded nell’applicazione per garantire aggiornabilità futura.
  Per quanto riguarda l'importazione dei file viene stabilito che:
  - I *decision tree devono essere importati automaticamente* all’avvio dell’applicazione. \ Non è previsto che l’utente selezioni manualmente quali alberi importare.
  - I *documenti tecnici possono essere importati da più file* e in momenti differenti.
  Per quanto riguarda la gestione degli errori di importazione:
  - Per i documenti tecnici devono essere previsti errori di formato e/o errori di parsing parziale.
  - per i decision tree un errore è più grave e deve essere trattato come un'anomalia globale di caricamento.

  == Gestione dei Decision Tree e permessi degli User
  BlueWind conferma che la modifica dei *Decision Tree* riguarda: i testi delle domande, i nodi e la struttora gerarchica, le foglie e gli esiti finali. \ 
  La modifica è pensata per: 
  - adattamenti dovuti a revisioni della norma EN18031;
  - applicazione della stessa logica ad altri standard.
  La validazione dovrà essere in grado di intercettare errori quali i seguenti :
  - *cicli*,
  - *nodi orfani*,
  - *percorsi interrotti*,
  - *foglie finali mancanti*,
  - *incoerenze logiche*.
  Per quanto riguarda l'esecuzione dei requisiti e gestione delle dipendenze, 
  BlueWind specifica che *l’esito finale è calcolato solo all’ultimo nodo*.
  Il sistema deve bloccare l’esecuzione se i prerequisiti non sono in stato *Pass* o *Not Applicable*.
  In tal caso il sistema:
  - notifica i requisiti non soddisfatti,
  - li evidenzia in dashboard,
  - impedisce l’avvio del decision tree.

  === Gestione dei requisiti Not Applicable e giustificazioni
  BlueWind conferma che : 
  - Se un requisito è Not Applicable, anche i requisiti figli devono diventare automaticamente Not Applicable.
  - La lista degli asset determina se un requisito è applicabile o meno.
  - Quando un requisito risulta Not Applicable, è obbligatoria la compilazione di una giustificazione, prevista dalla norma.
  L’interfaccia dovrà quindi:
  - mostrare una textbox in caso di esito N/A,
  - memorizzare e rendere consultabili le giustificazioni,
  - includerle nel report finale.

  Riguardante i ruoli degli utenti vengono definiti due tipologie di utenti differenti, 
  *l'utente standard* e un *responsabile tecnico* (BlueWind suggerisce di definire formalmente tale ruolo come “amministratore”, ma lascia libertà di nomenclatura)
  con le relative aurotizzazioni:
  - L’utente standard può eseguire i decision tree e consultare i risultati.
  - Il *responsabile tecnico autorizzato* può:
    - accedere all’editor grafico,
    - modificare decision tree,
    - salvare nuove versioni dei file.

  == Struttura della dashboard e comportamento dell’esecuzione dei requisiti.
Viene stabilito che la dashboard deve mostrare:
  - lista asset,
  - requisiti per ogni asset,
  - stato dei requisiti (Non iniziato, In corso, Pass, Fail, N/A),
  - dipendenze dei requisiti,
  - disponibilità all’esecuzione.
La dashboard deve inoltre offrire la possibilità di filtraggio e ordinamento, un 
accesso all’editor grafico (solo per responsabile tecnico), e la possibilità di rieseguire o cancellare valutazioni.

  == Esportazione dei risultati
  BlueWind afferma che sarà possibile anche esportare *risultati parziali*. \
  I formati supportati includono PDF, CSV e JSON/XML. Inoltre l’export deve includere i seguenti elementi:
  esiti, percorsi decisionali e le eventuali giustificazioni.

  == Indicazioni sulla gestione del progetto, pianificazione e comunicazione interna.
  Viene consigliata un analisi dei rischi dettagliata nel Project Plan, una pianificazione realistica delle attività e un'assegnazione chiara dei ruoli.
  Per quanto riguarda la gestione delle issue, il gruppo ha riscontrato difficoltà a definire issue atomiche quando non si conosce bene il risultato finale. 
  BlueWind consiglia di creare issue "di indagine" preliminari e di trasformarle in issue atomiche solo successivamente. Inoltre suggerisce di suddividere i compiti
  anche tra più persone nella fase di esplorazione, così da prevenire ritardi dovuti da eventuali problemi personali dei membri del gruppo.
  Relativamente alla comunicazione interna, il gruppo effettua costantemente una riunione lunga alla settimana che non sempre risultà essere efficace.
  BlueWind consiglia incontri più brevi e frequenti (bi-daily) per sincronizzarsi meglio, una revisione costante delle issue e aggiornamenti più rapidi per evitare l'accumulo di problemi che potrebbero 
  sopraggiungere, una definizione chiara di priorità e responsabilità.

]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VE.1."

#let decisioni=(
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [I decision tree saranno importati globalmente e automaticamente.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [I file dei documenti tecnici possono essere multipli e importati separatamente.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [L’editor dei decision tree sarà accessibile solo a un responsabile tecnico.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Le giustificazioni sono obbligatorie per esiti N/A e devono essere incluse anche nei report.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
  (
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Il sistema deve validare in modo rigoroso la struttura dei decision tree.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [La dashboard sarà l’elemento centrale di navigazione del sistema.],
  [#upper("è") stato suggerito dalla proponente.],
  [-]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]

#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.8."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [Filippo Guerra],
  [Redazione del verbale di questa riunione.],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Aggiornare il documento Analisi dei Requisiti con tutte le precisazioni ricevute],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Raffinare i casi d’uso su importazione, esecuzione, dashboard, modifiche DT],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Introdurre la distinzione tra utente standard e responsabile tecnico],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [Implementare gestione giustificazioni nei casi d’uso],
  [],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [],
  [],
  [],
), 
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)

La riorganizzazione delle issue GitLab/GitHub e il miglioramento della comunicazione interna tra i membri del gruppo non è stato classificato all'interno dei TODO in quanto è un'attività esclusivamente di "palestra", il compito è ad opera di un singolo membro del gruppo.
]