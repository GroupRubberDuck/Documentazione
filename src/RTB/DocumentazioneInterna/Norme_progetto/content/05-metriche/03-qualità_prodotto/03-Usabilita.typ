#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche




#tabellaMetriche((
  (codice: "MPD-07",
    nome: "User Error Rate",
    accettabile: $<= 3 percent$,
    preferibile: $<= 1 percent$
  ),
  (codice: "MPD-08",
    nome: "Time to Complete Task",
    accettabile: "TODO",
    preferibile: "TODO"
  ),
),[Metriche usabilità del prodotto])

#include "MPD/07-user_error_rate.typ"

#include "MPD/08-time_to_complete_task.typ"