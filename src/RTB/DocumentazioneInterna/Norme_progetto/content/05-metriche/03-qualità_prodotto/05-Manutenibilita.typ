#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
#import "MPD/config/deps.typ" as deps

#let targets=(
"Cyclomatic Complexity",
"Instability Index",
"Coefficient of Coupling",
"Code Smell",
"Code Coverage",
)


#let metriche=()
#for metric in targets{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPD-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}

#tabellaMetriche((
..metriche
),[Metriche manutenibilità del prodotto])

#for metric in targets{
  include deps.get-metrica-path(metric)
}