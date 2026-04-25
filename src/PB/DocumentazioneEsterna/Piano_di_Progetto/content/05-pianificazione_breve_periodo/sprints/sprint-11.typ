#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "11",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 04, day: 21),
    finePrevista: datetime(year: 2026, month: 04, day: 27),
    fineEffettiva: datetime(year: 2026, month: 04, day: 27),
  ),
  TODO: [
    In questo sprint l'obiettivo principale è l'avvio della codifica del dominio (MVP) e il consolidamento della documentazione tecnica.
  ],
  rischiAttesi: [
    - *R.T.2 - Complessità tecnica della codifica*: l'inizio dell'attività di traduzione dei requisiti in codice potrebbe richiedere più tempo del previsto per l'allineamento sulle convenzioni di naming.
  ],
  rischiEffettivi: [
    Nessuno in particolare.
  ],
  oreProduttive: (

    (persona: persone.ANA, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 4, oreEffettive: 4),
    (persona: persone.FILIPPO, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4), 
    (persona: persone.DT, ruolo: ruoli.Progettista, orePreviste: 2, oreEffettive: 2),      
    (persona: persone.DL, ruolo: ruoli.Progettista, orePreviste: 6, oreEffettive: 6),      
    (persona: persone.ALDO, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4),    
    (persona: persone.FELIX, ruolo: ruoli.Progettista, orePreviste: 4, oreEffettive: 4),  
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 11 sono state svolte le seguenti attività:
    - *Codifica*:
      - Avvio dell'attività di codifica del dominio 
      - Setup dell'ambiente MVP 
      - Definizione delle Naming convention su NdP
    - *Documentazione*:
      - Redazione ST- frontend e sezione design pattern 
    *Miglioramento della pianificazione futura*
    - *Breve termine*:
      - Proseguire con l'implementazione delle funzionalità core del dominio.
      - Iniziare i primi test di unità sulle classi codificate.
    - *Lungo termine*:
      - Completamento dell'MVP per la validazione delle scelte progettuali.
      - Completamento del documento della Specifica Tecnica.
  ],
)