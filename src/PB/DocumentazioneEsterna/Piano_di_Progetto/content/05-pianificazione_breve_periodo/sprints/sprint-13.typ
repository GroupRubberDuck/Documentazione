#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "13",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 05, day: 05),
    finePrevista: datetime(year: 2026, month: 05, day: 11),
    fineEffettiva: datetime(year: 2026, month: 05, day: 11),
  ),
  TODO: [
    Il focus dello sprint è stato il completamento della fase di codifica del backend e una buona parte del frontend.
  ],
  rischiAttesi: [
      - *R.O.1 - Pianificazione errata o ottimistica*: L'implementazione delle classi potrebbe essere più complessa del previsto, se qualcuno trova difficoltà eccessive nella codifica di una parte del sistema backend dovrà parlarne con gli altri componenti del gruppo in modo da poter risolvere il problema.
      - *R.T.3 - Errori nel codice*: Durante una fase di codifica così intensa è facile che vengano introdotti errori all'interno delle singole parti del codice, sia nell'integrazione con le altre parti del progetto, a tal fine è stata predisposta la pipeline di test automatica tramite GitHub Actions in modo da realizzare una integrazione continua.

      In questo modo è sempre possibile monitorare lo stato delle singole classi e che l'integrazione tra esse sia funzionante. 
  ],
  rischiEffettivi: [
    - *R.T.3 - Errori nel codice*: Come previsto si sono verificati errori nel codice, questi sono stati individuati tramite test e tool automatici per lo sviluppo assistito.
  ],
  oreProduttive: (
    (persona: persone.FELIX, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Programmatore, orePreviste: 11, oreEffettive: 10),
    (persona: persone.FILIPPO, ruolo: ruoli.Verificatore, orePreviste: 3, oreEffettive: 3),
    // FIX sull'excel è segnato 8
    (persona: persone.FILIPPO, ruolo: ruoli.Programmatore, orePreviste: 7, oreEffettive: 8),
    (persona: persone.DT, ruolo: ruoli.Programmatore, orePreviste: 3, oreEffettive: 4),
    (persona: persone.ALDO, ruolo: ruoli.Programmatore, orePreviste: 11, oreEffettive: 10),
    (persona: persone.ALDO, ruolo: ruoli.Verificatore, orePreviste: 7, oreEffettive: 7),
    (persona: persone.ALDO, ruolo: ruoli.Analista, orePreviste: 1, oreEffettive: 1),
    (persona: persone.DL, ruolo: ruoli.Responsabile, orePreviste: 4, oreEffettive: 4),
    (persona: persone.DL, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 6),
    (persona: persone.DL, ruolo: ruoli.Programmatore, orePreviste: 9, oreEffettive: 9),
    (persona: persone.ANA, ruolo: ruoli.Progettista, orePreviste: 7, oreEffettive: 8),
    (persona: persone.ANA, ruolo: ruoli.Programmatore, orePreviste: 5, oreEffettive: 5),
  ),
  retrospettiva: [
    *Consuntivo di periodo*:
    Nel corso dello sprint 13 sono state svolte le seguenti attività:
    - *Progettazione*:
      - #upper("è") stata rifinita la progettazione del frontend
    - *Codifica*:
      - Implementazione del sistema backend completo.
      - Implementazione del database rispettando le naming convention.
      - Definita pipeline per il testing continuos integration.
      - Aggiunto script per il tracking delle metriche
    - *Documentazione*:
      - Aggiornamento della specifica tecnica.

    *Miglioramento della pianificazione futura*
    - *Breve termine*:
      - Miglioramento della progettazione del sistema frontend.
    - *Lungo termine*:
      - Migliorare la capacità di pianificare sprint in contesti di forte interdipendenza tra attività, riducendo il rischio di sottostima dovuto a propagazione di modifiche tra progettazione, codifica e validazione.
  ],
)