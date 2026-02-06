#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche

#tabellaMetriche((
  (codice: "MPD-09",
    nome: "Response Time",
    accettabile: $<= 2 sec$,
    preferibile: $<= 1 sec$
  ),
  (codice: "MPD-10",
    nome: "CPU Utilization",
    accettabile: $<= 75%$,
    preferibile: $<= 60%$
  ),
  (codice: "MPD-11",
    nome: "Memory Utilization",
    accettabile: $<= 4,0 "GB"$,
    preferibile: $<= 1,5 "GB"$
  ),
),[Metriche efficienza del prodotto #footnote()[
  Qualsiasi metrica percentuale interna a questa sezione ha un termine di paragone assoluto.

  // L'utilizzo di percentuali senza un riferimento in questa sezione è paragonare al condividere un sito web girando il link localhost:8080
]])

#include "MPD/09-response_time.typ"
#include "MPD/10-CPU_utilization.typ"
#include "MPD/11-memory_utilization.typ"