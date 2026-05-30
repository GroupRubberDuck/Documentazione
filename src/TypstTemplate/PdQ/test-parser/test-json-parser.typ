#let parse-test-file(
  dati-json,
  target: none
) = {
  // 1. Identifichiamo la lista base:
  // Se esiste 'tests', usiamo quella (backend), altrimenti appiattiamo 'testResults' (frontend)
  let lista-grezza = if "tests" in dati-json {
    dati-json.tests
  } else {
    dati-json.testResults.map(file => file.assertionResults).flatten()
  }

  // 2. Mappiamo i dati normalizzandoli
  let lista-test = lista-grezza.map(it => {
    // Se il frontend non ha 'nodeid' o 'metadata', usiamo dei fallback sicuri
    let nome = if "nodeid" in it {
      it.nodeid.split("/").last().split(":").last()
    } else {
      it.title // il frontend usa 'title'
    }

    let descrizione = if "metadata" in it and "descrizione" in it.metadata {
      it.metadata.descrizione.replace(regex("[ \t]+"), " ").trim()
    } else {
      it.fullName // fallback per il frontend
    }

    let tipo = if "metadata" in it and "tipo_test" in it.metadata {
      it.metadata.tipo_test
    } else {
      "Unitario" // Forza il target per il frontend
    }

    let esito = if "outcome" in it {
      it.outcome
    } else {
      it.status // il frontend usa 'status' ("passed" o "failed")
    }

    (
      nome: nome,
      descrizione: descrizione,
      tipo: tipo,
      esito: esito
    )
  })
  
  // 3. Applica il filtro se target è specificato
  if target != none {
    lista-test = lista-test.filter(it => it.tipo == target)
  }
  
  return lista-test
}