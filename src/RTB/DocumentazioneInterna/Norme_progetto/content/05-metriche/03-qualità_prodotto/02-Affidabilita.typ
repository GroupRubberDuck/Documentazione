#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche




#tabellaMetriche((
  (codice: "MPD-04",
    nome: "Failure Density",
    accettabile: $<= 50 percent$,
    preferibile: $<= 20 percent$
  ),
  (codice: "MPD-05",
    nome: "Statement Coverage",
    accettabile: $>= 80 percent$,
    preferibile: $>= 95 percent$
  ),
  (codice: "MPD-06",
    nome: "Branch Coverage",
    accettabile: $>= 70 percent$,
    preferibile: $>= 90 percent$
  ),
),[Metriche affidabilità del prodotto])


#include "MPD/04-failure_density.typ"
#include "MPD/05-statement_coverage.typ"
#include "MPD/06-branch_coverage.typ"

