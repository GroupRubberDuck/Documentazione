#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "7",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 03, day: 10),
    finePrevista: datetime(year: 2026, month: 03, day: 24),
    fineEffettiva: datetime(year: 2026, month: 03, day: 24),
  ),
  TODO: [
    Le attività dello sprint si sono concentrate principalmente su ultimare i requisiti per l'RTB:

    - Analisi dei Requisiti (AdR): completamento dei casi d'uso e dei requisiti funzionali.

    - Proof of Concept (PoC): realizzazione delle pagine concordate (Import, Decision Tree, Dashboard e Report) e collegamento con il database MongoDB.
  ],
  rischiAttesi: [
    - *R.T.2 – Inesperienza con le tecnologie (Alta frequenza, Alta pericolosità)*: Lo sviluppo del PoC richiede l'utilizzo di tecnologie con cui il gruppo ha ancora poca dimestichezza.
  ],
  rischiEffettivi: [
    Nessun particolare rischio si è presentato in questo sprint.
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
    (persona: persone.ALDO, ruolo: ruoli.Programmatore, orePreviste: 3, oreEffettive: 3),
    (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
    (persona: persone.FELIX, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 7, oreEffettive: 7),
    (persona: persone.FILIPPO, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DL, ruolo: ruoli.Analista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DT, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 5, oreEffettive: 5),
  ),
  retrospettiva: [
    - *Completamento dell'Analisi dei Requisiti (AdR):*
    Al fine di presentare l'RTB sono stati migliorati i requisiti funzionali in modo da raggiungere uno stato definitivo.

    - *Realizzazione del Proof of Concept (PoC):*
    Il Proof of Concept è stato realizzato dividendosi le pagine da creare tra i membri del gruppo. Si è implementato MongoDB come database e D3js per la visualizzazione e interattività dei decision tree, oltre alle altre tecnologie già confermate in precedenza. In seguito sono stati aggiunti alcuni test per dimostrare l'utilizzo della libreria pytest ed il tracciamento dei requisiti con la libreria strictdoc.

    - *Presentazione RTB con il Prof. Cardin:*
    Lo sprint si è concluso con la presentazione della Requirement and Technology Baseline al Prof. Cardin per l'approvazione. In seguito sono stati analizzati e considerati i suggerimenti forniti dal professore ed è stato deciso di mantenere le tecnologie scelte.
  ],
)
