#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche






#tabellaMetriche((
  (codice: "MPD-12",
    nome: "Cyclomatic Complexity",
    accettabile: $<= 10$,
    preferibile: $<= 8$
  ),
  (codice: "MPD-13",
    nome: "Instability Index",
    accettabile: [$I>= 0.7 $\ $or $ \ $I<=0,30$],
    preferibile: [$I>= 0.85 $\ $or $\ $I<=0,15$],
  ),
  (codice: "MPD-14",
    nome: "Coefficient of Coupling",
    accettabile: $<= 0.4$,
    preferibile: $<= 0.2$
  ),
  (codice: "MPD-15",
    nome: "Code Smells",
    accettabile: $<= 10$ ,
    preferibile: $<= 5$ 
  ),
),[Metriche manutenibilità del prodotto])

#include "MPD/12-cyclomatic_complexity.typ"
#include  "MPD/13-instability_index.typ"
#include  "MPD/14-coefficient_of_couplings.typ"
#include  "MPD/15-code_smell.typ"