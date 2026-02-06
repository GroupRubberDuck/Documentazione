#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche




#tabellaMetriche((
  (codice: "MPD-01",
    nome: "Requisiti obbligatori soddisfatti",
    accettabile: $100 percent$,
    preferibile: $100 percent$
  ),
  ( codice: "MPD-02",
    nome: "Requisiti desiderabili soddisfatti",
    accettabile: $>= 50 percent$,
    preferibile: $100 percent$
  ),
  (codice: "MPD-03",
    nome: "Requisiti opzionali soddisfatti",
    accettabile: $>= 0 percent$,
    preferibile: $>= 75 percent$
  ),
),[Metriche funzionalità del prodotto])

#include "MPD/01-requisiti_obbligatori_soddifatti.typ"

#include "MPD/02-requisiti_desiderabili_soddisfatti.typ"

#include "MPD/03-requisiti_opzionali_soddifatti.typ"

