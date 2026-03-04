
#import "/src/config.typ": he
#set heading(numbering: "1.1)")

=== Introduzione
Il Processo di Gestione del Processo definisce il quadro organizzativo entro cui vengono pianificate, coordinate e monitorate tutte le attività di progetto. \
Esso fornisce le linee guida per governare l’evoluzione del progetto, assicurando coerenza tra i processi adottati, le risorse disponibili e gli obiettivi stabiliti, e supporta l’interazione tra i diversi processi organizzativi, primari e di supporto.

=== Scopo del processo
Lo scopo del processo di Gestione del Processo è:

- *Definire e strutturare le attività* necessarie allo svolgimento del progetto;

- *Assegnare responsabilità e ruoli* in modo chiaro e coerente;

- *Pianificare e monitorare l’avanzamento* delle attività;

- *Garantire una comunicazione efficace* sia interna al gruppo sia verso gli stakeholder esterni;

- Assicurare il controllo del progetto nel *rispetto di tempi, costi e standard di qualità* stabiliti.

#he(body: "Attività del processo", level: 3)

Lo standard #link("https://www.iso.org/standard/63712.html")[ISO/IEC/IEEE 12207:1997] definisce la gestione del processo come un insieme di attività organizzate che permettono di pianificare, controllare e valutare l’esecuzione dei processi di progetto.

Nel contesto del progetto, tali attività coprono l’intero ciclo di vita del processo e sono strutturate in fasi successive, ciascuna con obiettivi e responsabilità ben definite.
Esse consentono di garantire il corretto avanzamento delle attività, il rispetto delle risorse disponibili e la conformità agli standard di qualità stabiliti.

Le attività individuate dallo standard e adottate dal gruppo sono:

+ *Inizializzazione* \ Rappresenta la prima fase del processo. In questa fase vengono definiti i requisiti del processo oggetto di analisi. Una volta stabiliti, il responsabile ne valuta la fattibilità in relazione alle risorse disponibili.

+ *Pianificazione* \ Il responsabile pianifica le attività del processo.  \ I piani definiscono le attività e i task associati, nonché le caratteristiche del prodotto software. \ Ogni piano deve includere le seguenti informazioni:
#pad(left: 1em)[
  - tabella di marcia per il completamento dei task;
  - stima dello sforzo richiesto;
  - risorse necessarie;
  - assegnazione dei compiti;
  - assegnazione delle responsabilità (si veda la sezione @ruoli-di-progetto);
  - quantificazione dei rischi;
  - metriche di controllo della qualità;
  - costi associati all’esecuzione del processo;
  - fornitura dell’ambiente e delle infrastrutture.
]

3. *Esecuzione e controllo*
Il responsabile avvia le attività del processo in conformità a quanto stabilito nella fase di pianificazione e ne monitora l’andamento.
- *Controllo interno*: verifica il progresso delle attività e ne mantiene la tracciabilità.
  Eventuali criticità o impedimenti che possano causare ritardi devono essere segnalati tempestivamente al responsabile.
- *Comunicazione esterna*: gestisce i flussi comunicativi con la *proponente* e il *committente*, garantendo chiarezza e coerenza informativa.

4. *Revisione e valutazione*\ Al completamento delle attività, il verificatore controlla che i risultati ottenuti siano conformi alle metriche di qualità e agli standard definiti.
5. *Chiusura*  \ Un'attività si ritiene completa dopo aver superato l'attività di verifica. Si veda la definition-of-done per maggiori dettagli. La chiusura delle issue legate alle attività avviene tramite merge sul main a intervalli prefissati.

=== Procedure operative
==== Ruoli di Progetto <ruoli-di-progetto>
La seguente sezione descrive le fasi della progettazione software.
All’interno del team, per garantire coerenza, efficienza e qualità, ogni ruolo ha compiti specifici e interviene in momenti diversi del progetto.

Nel contesto del corso di Ingegneria del Software, tutti i membri del team devono ricoprire almeno una volta ciascun ruolo definito.

La tabella sottostante riassume in maniera chiara i compiti associati a ciascun ruolo.

// -------- TIMELINE VISIVA --------
#align(center)[
  *Fasi di progetto*\
  #v(6pt)
  #sym.bar.h ● *Analisi* #sym.arrow.r ● *Progettazione* #sym.arrow.r ● *Implementazione* #sym.arrow.r ● *Verifica*
  #{
    show table.cell: set text(size: 11pt)
    table(
      columns: 3,
      align: horizon,
      table.header([*Ruolo*], [*Compiti*], [*Presenza*]),

      [Responsabile],
      "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione documenti",
      [Tutto il progetto],

      [Amministratore],
      "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme",
      [Tutto il progetto],

      [Verificatore],
      "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti",
      [Tutto il progetto],

      [Analista],
      "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali",
      [Fase iniziale],

      [Progettista],
      "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica",
      [Dopo analisi],

      [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Implementazione],
    )
  }

]
==== Rendicontazione delle ore <Rendicontazione_delle_ore>
La pianificazione e il monitoraggio delle ore produttive del progetto sono gestiti tramite il documento "Piano di progetto", in cui vengono registrate sia le ore previste sia quelle effettivamente svolte per ciascun ruolo e membro del gruppo.

La ripartizione oraria è accompagnata dai relativi costi, consentendo una visione completa delle risorse economiche impiegate.
Al fine di rendere rigorosa, oggettiva e verificabile la rendicontazione oraria, il team ha implementato un foglio di calcolo Google Sheets avanzato dedicato al tracciamento dell'effort. Per alimentare questo documento, è stato sviluppato uno script automatizzato che estrae i dati dal repository e genera dei file CSV dedicati per ogni singolo sprint, i quali vengono poi importati nel foglio. Questo strumento aggrega i dati operativi con lo storico e la gestione delle issue (dimensione, tipologia e scadenze). Tale sistema integrato permette non solo di mappare con precisione l'impegno effettivo di ciascun membro, ma anche di classificare le ore in produttive e non produttive, scalandole dinamicamente dal budget preventivato per i vari ruoli di progetto.
Questa organizzazione strutturata favorisce una gestione chiara, trasparente e collaborativa della distribuzione dei ruoli all'interno del team.


==== Assegnazione Ruolo-Documento <ruolo-documento>
La seguente sezione chiarisce i documenti associati a ciascun ruolo.\
L’assegnazione viene rappresentata tramite una *legenda* e una *tabella riassuntiva*. \

*Legenda* :\
Azioni:
- R = Redazione.
- V = Verifica.
- A = Approvazione.
- C = Contribuente.
Ruoli:
- Responsabile = RESP.
- Amministratore = AMM.
- Analista = ANL.
- Progettista = PRG.
- Programmatore = PGRmm.
- Verificatore = VRF.

#{
  show table.cell: set text(size: 11pt)
  table(
    columns: 7,
    align: horizon,
    table.header([*Documento*], [*RESP*], [*AMM*], [*ANL*], [*PRG*], [*PRGmm*], [*VRF*]),
    [Norme di Progetto (NdP)], [R/A], [R], [-], [-], [-], [V],
    [Analisi dei Requisiti (AdR)], [A], [-], [R], [-], [-], [V],
    [Piano di Progetto (PdP)], [R/A], [-], [C (supporto rischi)], [-], [-], [V],
    [Piano di Qualifica (PdQ)], [A], [R], [-], [-], [-], [V],
    [Design Document (DD)], [A], [-], [C (per coerenza requisiti)], [R], [C], [V],
    [Manuale Utente (MU)], [A], [-], [-], [R], [C], [V],
    [Verbali interni], [R/A], [R], [-], [-], [-], [V],
    [Verbali esterni], [R/A], [R], [-], [-], [-], [V],
    [Test Report (TR)], [A], [-], [-], [C], [R], [V],
    [Documentazione tecnica interna], [A], [R (per strumenti e template)], [R], [C], [-], [V],
  )
}

==== Issue Tracking System  <issue-tracking>
L’Issue Tracking System è lo strumento utilizzato dal team per pianificare, assegnare, monitorare e controllare l’avanzamento delle attività di progetto.
Il sistema è accessibile tramite la repository GitHub e si basa su un template di issue condiviso, così da garantire uniformità, tracciabilità e chiarezza operativa.

Ogni issue rappresenta un’attività, un task o una modifica da realizzare e segue un flusso di stato predefinito:

- *Backlog*: attività pianificate ma non ancora avviate;

- *In lavorazione*: attività attualmente in esecuzione;

- *In verifica*: attività completate e sottoposte a controllo;

- *In approvazione*: attività in attesa di validazione finale;

- *Done*: attività concluse e integrate.

Le issue possono essere organizzate in modo gerarchico tramite *relazioni parent/child*, consentendo di suddividere attività complesse in sotto-attività più semplici e gestibili.

La chiusura di un’issue avviene esclusivamente al soddisfacimento dei criteri definiti nella Definition of Done (DoD), che garantisce il rispetto degli standard di qualità e di completezza stabiliti.

Inoltre, il sistema di gestione delle issue prevede:

- La *definizione delle milestone*, utilizzate per raggruppare attività e monitorare il raggiungimento degli obiettivi intermedi;

- L'’*uso della retrospettiva*, al termine di iterazioni o sprint, per analizzare le attività completate, individuare criticità e definire azioni di miglioramento per le fasi successive.

Questo approccio consente una gestione strutturata, trasparente e verificabile dell’intero ciclo di vita delle attività di progetto.

===== Creazione e struttura di un’issue

La creazione delle issue avviene a seguito di riunioni interne o incontri con la proponente, durante i quali il gruppo individua le attività su cui concentrarsi.
L’*amministratore* è responsabile della creazione delle issue nel sistema, utilizzando l’apposito *template* definito dal gruppo.

Ogni nuova issue deve includere le seguenti informazioni:

+ *Assegnatario/i* \
  Generalmente l’issue viene assegnata a una singola persona.
  In casi particolari, come attività di formazione o di esercitazione (*palestra*), l’issue può essere assegnata a più membri o all’intero gruppo.

+ *Descrizione* \
  Una descrizione chiara, dettagliata e non ambigua delle attività da svolgere.

+ *Scopo* \
  Specifica il risultato atteso al termine dell’issue e indica dove tale risultato deve essere documentato (ad esempio un documento, una sezione specifica o una modifica al repository).

+ *Autore* \
  Il membro del gruppo incaricato di svolgere l’issue.

+ *Verificatore* \
  Il membro incaricato di verificare il corretto completamento dell’issue secondo i criteri definiti nella @DOD  *Definition of Done (DoD)*.
  Salvo eccezioni motivate, il verificatore deve essere una persona diversa dall’autore.

+ *Label (ambito/destinazione)*  #footnote()[
    Le label possono essere aggiornate nel corso del progetto: label non più utili possono essere rimosse e nuove label introdotte in base alle esigenze. ]\ #[
    Le label permettono di classificare le issue in base al loro ambito all’interno del progetto, facilitandone l’organizzazione e la ricerca.
    Le principali label adottate sono:
    - Analisi dei Requisiti
    - Piano di Progetto
    - Piano di Qualifica
    - Norme di Progetto
    - Verbale
    - Diario di Bordo
    - Glossario
    - Generale → attività non direttamente riconducibili ai documenti principali (studio di materiale, gestione repository, sito web, attività varie)


  ]

+ *Tipo di issue (Type)* \ #[
    Consente di distinguere la natura dell’attività:
    - *Palestra* → attività formative non rendicontate;
    - *Produttivo* → attività rendicontate che producono risultati concreti;
    - *Bug* → individuazione e risoluzione di errori o malfunzionamenti;
    - *Correzione* → modifiche e miglioramenti a materiali o documenti esistenti.

  ]

+ *Priorità* (Bassa, Media, Alta) \ #[
    La priorità ha un duplice scopo:
    - supportare la valutazione dell’importanza dell’issue;
    - comunicare all’assegnatario il livello di urgenza dell’attività.
  ]

+ *Dimensione* (ExtraSmall, Small, Medium, Large) \
  Fornisce una stima indicativa della quantità di lavoro necessaria per completare l’issue.

+ *Data di scadenza* \
  Generalmente coincide con la fine dello sprint di riferimento o con una milestone pianificata.

===== Flusso operativo

Il flusso operativo standard per la gestione di un’issue è il seguente:

+ L’amministratore crea una nuova issue tramite il template dedicato;
+ Vengono assegnati autore/i e verificatore/i;
+ Vengono compilati tutti i campi richiesti (descrizione, scopo, label, tipo, priorità, dimensione, scadenza);
+ L’issue viene inserita nello stato iniziale *Backlog*;
+ L’issue avanza attraverso gli stati del workflow fino al completamento;
+ La chiusura dell’issue avviene esclusivamente al soddisfacimento dei criteri definiti nella *Definition of Done*.
