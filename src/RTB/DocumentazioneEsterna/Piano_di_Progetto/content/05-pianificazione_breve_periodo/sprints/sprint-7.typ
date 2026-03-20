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

    - Analisi dei Requisiti (AdR): completamento di casi d'uso e dei requisiti funzionali.

    - Proof of Concept (PoC): realizzazione delle pagine concordate (Import, Decision Tree, Dashboard e Report) e collegamento con il database MongoDB.
  ],
  rischiAttesi: [
    - *R.T.2 – Inesperienza con le tecnologie (Alta frequenza, Alta pericolosità)*: Lo sviluppo del PoC richiede l'utilizzo di tecnologie con cui il gruppo ha ancora poca dimestichezza.
  ],
  rischiEffettivi: [
    // fine sprint
  ],
  oreProduttive: (
    // fine sprint
  ),
  retrospettiva: [
    // fine sprint
  ],
)
