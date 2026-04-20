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
    - *R.T.2 - Inesperienza con le tecnologie*: a seguito dell'incontro col professor Cardin è stato necessario verificare e studiare più a fondo la validità delle scelte tecnologiche effettuate.
    - *R.O.1 - Pianificazione iniziale errata o ottimistica*: lo studio delle tecnologie è un'attività difficilmente scomponibile e di costo poco prevedibile.
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
      Lo sprint si è articolato attorno a tre assi principali: la chiusura della fase RTB,
  l'elaborazione dei feedback ricevuti dal Prof. Cardin e la preparazione all'incontro
  con il Prof. Vardanega.

  *Decisioni tecnologiche.*
  A seguito della valutazione dell'architettura del PoC, è stato scelto di adottare
  Vue.js per il frontend, al fine di conferire maggiore struttura e manutenibilità
  al codice. Lo stack backend rimane invariato.

  *Aggiornamenti organizzativi.*
  La data di consegna del progetto è stata ufficialmente posticipata al 15 maggio.

  *Attività operative.*
  Il gruppo ha completato con successo l'aggiornamento e l'approvazione definitiva
  della documentazione ufficiale — NdP, PdP, PdQ e AdR — e ha prodotto la relativa
  presentazione per il Prof. Vardanega.
  ],
)
