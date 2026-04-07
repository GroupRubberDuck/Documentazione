#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "5",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 02, day: 05),
    finePrevista: datetime(year: 2026, month: 02, day: 24),
    fineEffettiva: datetime(year: 2026, month: 02, day: 24),
  ),
  TODO: [
    Le attività previste per il presente sprint mirano al consolidamento dell'Analisi dei Requisiti e al contestuale allineamento del Piano di Progetto. L'obiettivo è garantire la perfetta coerenza tra la documentazione ufficiale e l'effettivo stato di avanzamento del progetto. Nello specifico, si prevede di:

    - Analisi dei Requisiti (AdR): revisione e modellazione dei casi d'uso (Use Case), integrando direttamente i riscontri emersi dal confronto con l'azienda proponente BlueWind.

    - Piano di Progetto (PdP): aggiornamento della pianificazione di breve periodo, classificazione ROAM e rendicontazione oraria multiruolo.
  ],
  rischiAttesi: [
    - *R.P.1 – Disponibilità variabile dei membri (Alta probabilità)*: La sovrapposizione con la sessione d'esami universitaria rappresentava la minaccia principale al completamento dei task, con una prevista riduzione drastica delle ore lavorabili.
    - *R.T.2 – Inesperienza con le tecnologie (Media probabilità)*: L'adozione di nuove tecnologie per il PoC comporta il rischio di rallentamenti dovuti alla curva di apprendimento.
    - *R.O.1 – Pianificazione ottimistica*: Rischio di sovrastimare la capacità produttiva del gruppo nel periodo della sessione esami.
  ],
  rischiEffettivi: [
    Durante lo Sprint 5 si sono concretizzati i seguenti rischi:

    - *R.P.1 – Disponibilità variabile dei membri*:
      - *Classificazione*: *Accepted*.
      - *Azione*: La sessione esami ha impedito quasi la totale operatività dei membri del gruppo, il lavoro mancante slitta al prossimo sprint.
  ],
  oreProduttive: (
    (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 5, oreEffettive: 5),
    (persona: persone.DL, ruolo: ruoli.Responsabile, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 0, oreEffettive: 1),
    (persona: persone.DL, ruolo: ruoli.Analista, orePreviste: 7, oreEffettive: 10),
    (persona: persone.ALDO, ruolo: ruoli.Amministratore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 1, oreEffettive: 1),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FILIPPO, ruolo: ruoli.Analista, orePreviste: 1, oreEffettive: 1),
  ),
  retrospettiva: [
    - *Gestione risorse e rischi (impatto esami):* 
      L'inizio del periodo è stato pesantemente segnato dalla sessione d'esami. Il gruppo ha dovuto prendere atto di una disponibilità "bassa" o "nulla" da parte di quasi tutti i membri. Questo rischio concretizzato ha costretto a un riallineamento delle aspettative e a una riorganizzazione delle priorità.
    
    - *Focalizzazione sulla Requirement Baseline:* 
      Per ottimizzare le scarse risorse produttive, il team ha deciso di dare priorità assoluta alla revisione e all'ultimazione dei Casi d'Uso e dell'Analisi dei Requisiti. Questa scelta è stata strategica, in quanto questi documenti costituiscono una dipendenza bloccante per le fasi successive del progetto.

    - *Miglioramenti di Processo (workflow e metriche):*
      Nuovo Workflow Git: Per risolvere le rigidità del precedente iter di approvazione, è stato discusso e definito un nuovo workflow basato su una migliore gestione dei branch.
      Tracciamento Ore: È stato introdotto un Google Spreadsheet condiviso per tracciare rigorosamente le ore. Questo strumento permette di distinguere in modo oggettivo tra "ore di orologio" e "ore produttive", agevolando la raccolta di dati realistici per le metriche.

    - *Avanzamento del Proof of Concept (PoC):*
      Nella seconda metà del periodo sono riprese le attività tecniche. È stata creata una repository dedicata esclusivamente al PoC (separata dalla documentazione) per mantenere il codice di test isolato. Inoltre, è stato completato il setup di un ambiente di sviluppo containerizzato e riproducibile, adottando tecnologie come Docker, Poetry, MyPy/BearType e Ruff.
    
    - *Integrazione Documentale:* 
      È stato aggiornato il Piano di Progetto (PdP) e il Piano di Qualifica (PdQ) ha visto un importante avanzamento pratico con l'inserimento dei primi grafici delle metriche raccolte.
  ],
)
