#import "@preview/cheq:0.3.0": checklist
#import "/src/config.typ":he
#set heading(numbering: "1.1)")
#he(body:"Scopo", level:3)
La *gestione dei processi* ha l'obiettivo di individuare le attività, i compiti da svolgere e i ruoli ai quali questi saranno assegnati.

Stabilisce come un processo vada gestito e monitorato.

Nonché permettere una comunicazione interna ed esterna efficacie.



#he(body:"Attività previste", level:3)
Lo standard #link("https://www.iso.org/standard/63712.html")[ISO ISO/IEC/IEEE 12207:1997] individua le seguenti attività.

#he(body:"Inizializzazione", level:4)
#upper("è") la prima fase del processo. \
Vanno stabiliti i requisiti di ogni processo che sta venendo analizzato.
Una volta stabiliti i requisiti, il responsabile ne valuta la fattibilità in base alle risorse disponibili.

#he(body:"Pianificazione", level:4)
Il responsabile deve pianificare le attività del processo.

I piani devono contenere la descrizione delle attività e dei task associati, oltre a descrivere il prodotto software.

I piani devono contenere le seguenti informazioni:
- La tabella di marcia per il completamento dei task;
- Stima dello sforzo;
- Risorse necessarie;
- Assegnazione del compito;
- Assegnazione delle responsabilità, maggiori dettagli alla @ruoli-di-progetto
- Quantificazione dei rischi;
- Metriche di controllo della qualità;
- Costi associati al processo di esecuzione;
- Fornitura di ambiente e infrastrutture.



#he(body:"Esecuzione e Controllo", level:4)
Il responsabile avvia le attività di processo, in modo congruo a quanto stabilito nella fase di  pianificazione, e le monitora.

- #[*Internamente* \ Controlla il progresso delle attività e ne tiene traccia. \
   In caso un membro del gruppo incontri problemi che rischino di rallentare le attività deve riferirlo al responsabile.]

- #[*Esternamente* \
   Gestisce le comunicazioni con la *proponente* e il *committente*.]
#he(body:"Revisione e valutazione", level:4)
Al completamento dell'attività il verificatore si assicura che sia conforme alle metriche di qualità stabilite.
#he(body:"Chiusura", level:4)
Un'attività si ritiene completa dopo aver superato l'attività di verifica.
Si veda la @definition-of-done per maggiori dettagli.

La chiusura delle issue legate alle attività avviene tramite merge sul main a intervalli prefissati.


#he(body:"Ruoli di Progetto",level:3)
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
    table.header([*Ruolo*],[*Compiti*],[*Presenza*]),

    [Responsabile], "- Coordinamento piani e scadenze\n- Approvazione release\n- Comunicazione col committente\n- Uso efficiente delle risorse\n- Redazione documenti", [Tutto il progetto],

    [Amministratore], "- Garanzia efficienza strumenti\n- Gestione tecnologie di supporto\n- Verifica procedure secondo norme", [Tutto il progetto],

    [Verificatore], "- Testing e validazione\n- Controllo qualità deliverable\n- Conformità ai requisiti", [Tutto il progetto],

    [Analista], "- Analisi dei requisiti\n- Definizione bisogni del sistema\n- Redazione specifiche funzionali", [Fase iniziale],

    [Progettista], "- Progetta architettura sistema\n- Design e modellazione\n- Traduzione requisiti in struttura tecnica", [Dopo analisi],

    [Programmatore], "- Codifica software\n- Implementazione design\n- Sviluppo funzionalità", [Implementazione],
  )
}

]
=== Rendicontazione delle ore <Rendicontazione_delle_ore> 
La pianificazione e il monitoraggio delle ore produttive del progetto sono gestiti tramite il documento "Piano di progetto", in cui vengono registrate sia le ore previste sia quelle effettivamente svolte per ciascun ruolo e membro del gruppo.

 La ripartizione oraria è accompagnata dai relativi costi, consentendo una visione completa delle risorse economiche impiegate. Per facilitare l'analisi e garantire trasparenza durante l'eventuale rotazione dei ruoli, il gruppo utilizza inoltre un foglio di calcolo Google Sheet in cui ogni componente può rendicontare e consultare le proprie ore, sia pianificate sia effettive.  Questa organizzazione strutturata favorisce una gestione chiara, trasparente e collaborativa della distribuzione dei ruoli all'interno del team.


=== Assegnazione Ruolo-Documento
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
    table.header([*Documento*],[*RESP*],[*AMM*],[*ANL*],[*PRG*],[*PRGmm*],[*VRF*]),
  [Norme di Progetto (NdP)],[R/A],[R],[-],[-],[-],[V],
  [Analisi dei Requisiti (AdR)],[A],[-],[R],[-],[-],[V],
  [Piano di Progetto (PdP)],[R/A],[-],[C (supporto rischi)],[-],[-],[V],
  [Piano di Qualifica (PdQ)],[A],[R],[-],[-],[-],[V],
  [Design Document (DD)],[A],[-],[C (per coerenza requisiti)],[R],[C],[V],
  [Manuale Utente (MU)],[A],[-],[-],[R],[C],[V],
  [Verbali interni],[R/A],[R],[-],[-],[-],[V],
  [Verbali esterni],[R/A],[R],[-],[-],[-],[V],
  [Test Report (TR)],[A],[-],[-],[C],[R],[V],
  [Documentazione tecnica interna],[A],[R (per strumenti e template)],[R],[C],[-],[V],
  )
}

#he(body:"Definition of Done",level:3)

La *Definition of Done (DoD)* è un elemento molto importante nello sviluppo software, perché definisce le azioni che devono essere completate affinché i requisiti — espressi tramite un *Product Backlog Item (PBI)* — siano considerati conclusi. \
I criteri che la compongono devono essere concreti, verificabili e di dimensione ridotta, e hanno l’obiettivo di garantire un livello minimo di qualità per ogni rilascio o incremento del prodotto.

Di seguito viene riportata la Definition of Done per la fase RTB:

#show: checklist.with(marker-map: (" ": sym.ballot, "x": sym.ballot.cross, "-": sym.bar.h, "/": sym.slash.double))

- [ ] Controllare a livello semantico e grammaticale che tutto sia corretto (grammatica, punteggiatura, sintassi, rivedere frasi ripetute/ mal espresse)

- [ ] Controllare di aver incluso tutte le sezioni definite del WoW nel documento su cui si lavora 

- [ ] *Nei verbali*: Controllare di aver aggiornato nello status TAB: 
  - stato
  - versione
  - ruoli
- [ ] Controllare di aver aggiunto le ultime modifiche anche sulla “tabella delle modifiche del documento”
- [ ] *Nei verbali*: controllare di aver aggiornato la versione nel nome del file
- [ ] *Nei verbali*, controllare che tutte le decisioni corrispondano a issue specifiche nell'issue template.
- [ ] Un documento (o una sua sezione) è considerato completato quando:
  - È stato scritto;
  - È stato verificato;
  - È stata aggiunta una riga nelle tabelle documentarie con il validatore finale.

- [ ] Quando il documento/prodotto è completato, chiudere la issue con #block(
  fill: rgb("#f9f9f9"), // Colore di sfondo (grigio chiaro)
  stroke: 1pt + black, // Bordo nero da 1 punto
  inset: 10pt          // Padding interno di 10 punti
)[`git commit -m "commento. Close #numero_issue"`] Verificare poi effettivamente la chiusura nel Projects Board.

- [ ] Quando tutti i punti sopra sono completati e tutte le issue sono spostate in “Done”:
- Il branch develop può essere unito a main
- Controllare l’incremento dello sprint corrispondente ( e il website)
  
La seguente *Definition of Done* non è statica, ma dinamica: evolve in base alle esigenze del team di sviluppo.

#link("https://www.atlassian.com/agile/project-management/definition-of-done")[Definition-of-done-Guide]
=== Issue tracking System – Guida Operativa
L'*Issue Tracking System* è lo strumento utilizzato dal nostro team di sviluppo per tracciare in maniera efficiente tutte le issue da svolgere e il loro stato di completamento.
Il sistema è accessibile a tutti i membri del gruppo attraverso la repository GitHub, dove è disponibile un *template di issue condiviso e centrale*, in modo da evitare incongruenze o confusione.
