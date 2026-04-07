#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
#import "MPD/config/deps.typ" as deps

#let targets=(
"Response Time",
"CPU Utilization",
"Memory Utilization",
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
),[Metriche di efficienza del prodotto #footnote()[
  I valori soglia di questa sezione sono espressi in termini assoluti, non come percentuali relative.

  // L'utilizzo di percentuali senza un riferimento in questa sezione è paragonare al condividere un sito web girando il link localhost:8080
]])

#for metric in targets{
  include deps.get-metrica-path(metric)
}