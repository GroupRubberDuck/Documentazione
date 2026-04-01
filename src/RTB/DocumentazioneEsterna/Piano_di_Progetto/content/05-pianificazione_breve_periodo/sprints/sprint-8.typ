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
    // fine sprint
  ],
  oreProduttive: (
    // fine sprint
  ),
  retrospettiva: [
    // fine sprint
  ],
)
