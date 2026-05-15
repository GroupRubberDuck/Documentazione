#let parse-test-file(
  dati-json,
  target: none
) = {
  let lista-test = dati-json.tests.map(it => {
    (
      nome: it.nodeid.split("/").last().split(":").last(),
      
      // Sostituisce solo gli spazi multipli e le tabulazioni con uno spazio singolo,
      // lasciando intatti i ritorni a capo (\n).
      descrizione: it.metadata.descrizione.replace(regex("[ \t]+"), " ").trim(),
      
      tipo: it.metadata.tipo_test,
      esito: it.outcome
    )
  })
  
  // Applica il filtro se target è specificato
  if target != none {
    lista-test = lista-test.filter(it => it.tipo == target)
  }
  
  return lista-test
}