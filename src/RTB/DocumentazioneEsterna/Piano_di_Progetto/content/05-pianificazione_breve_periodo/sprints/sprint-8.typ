#import "/src/config.typ": template_dir
#import template_dir + "/PdP/sprint.typ": persone, ruoli

#let sprint_data = (
  numero: "8",
  usaMatrice: true,
  timeline: (
    inizio: datetime(year: 2026, month: 03, day: 24),
    finePrevista: datetime(year: 2026, month: 04, day: 06),
    fineEffettiva: datetime(year: 2026, month: 04, day: 06),
  ),
  TODO: [
    Le attività di questo sprint si sono concentrate sullo studio della validità delle tecnologie usate nel PoC, in seguito alle indicazioni del professor Cardin.
  ],
  rischiAttesi: [
    - *R.T.2 - Inesperienza con le tecnologie*: a seguito dell'incontro col professor Cardin è stato necessario verificare e studiare più a fondo la validità delle scelte tecnologiche effettuate
    - *R.O.1 - Pianificazione iniziale errata o ottimistica*: lo studio delle tecnologie è un'attività difficilmente scomponibile e di costo poco prevedibile
  ],
  rischiEffettivi: [
     - *R.T.2 – Inesperienza con le tecnologie*:
      - *Classificazione*: *Resolved*.
      - *Azione*: È stato condotto uno studio approfondito per convalidare le tecnologie scelte: il processo ha previsto l'identificazione preventiva dei quesiti critici necessari a una scelta consapevole e la successiva risoluzione degli stessi tramite ricerca mirata.
  ],
  oreProduttive: (
    (persona: persone.ALDO, ruolo: ruoli.Responsabile, orePreviste: 6, oreEffettive: 10),
    (persona: persone.ANA, ruolo: ruoli.Analista, orePreviste: 2, oreEffettive: 2),
    (persona: persone.FELIX, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 5),
    (persona: persone.FILIPPO, ruolo: ruoli.Verificatore, orePreviste: 4, oreEffettive: 5),
    (persona: persone.DL, ruolo: ruoli.Verificatore, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Verificatore, orePreviste: 3, oreEffettive: 3),
    (persona: persone.DT, ruolo: ruoli.Amministratore, orePreviste: 2, oreEffettive: 2),
  ),
  retrospettiva: [
    Durante questo sprint, il team si è concentrato sulla chiusura della fase RTB e sull'assimilazione dei feedback ricevuti dal Prof. Cardin. Dal punto di vista tecnologico, si è valutata l'architettura del PoC: è stato deciso di adottare Vue.js per il frontend al fine di garantirne una maggiore struttura, mantenendo invece inalterato lo stack backend corrente.
    A livello organizzativo, la data di consegna del progetto è stata ufficialmente posticipata al 15 maggio.
    Le attività operative si sono focalizzate massivamente sulla preparazione per l'incontro con il Prof. Vardanega. Come si evince dal registro delle task, il gruppo ha completato con successo l'aggiornamento e l'approvazione definitiva della documentazione ufficiale (NdP, PdP, PdQ, AdR) e la stesura della relativa presentazione.
  ],
)
