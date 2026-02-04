//Configurazione per i nomi delle chiavi
#let header-key="x-labels"
#let series-names-label="series-names"



#let to-float(str-val,digits:2) = {
  let clean-str = str-val.replace(",", ".")
  calc.round(float(clean-str),digits:digits)
}

#let parse-csv(path) = {
  let raw-data = csv(path)
  
  // 1. Separazione Header e Righe
  let header = raw-data.at(0)
  let rows = raw-data.slice(1)

  // 2. Struttura di output
  // Restituiamo un dizionario strutturato per facilitare il plotting
  (
    header: header,
    
    // Estraiamo le etichette X (date) separatamente
    x-labels: rows.map(r => r.at(0)),
    
    // Dataset convertito in numeri
    // Restituisce una matrice di float, ignorando la prima colonna (date)
    dataset: rows.map(row => {
      row.slice(1).map(cell => to-float(cell))
    }),

    // Helper per ottenere target (se esiste, assumiamo sia l'ultima colonna in grafici semplici)
    // Logica personalizzabile
    rows-raw: rows // Manteniamo i dati grezzi se servono
  )
}
#let parse-csv-to-columns(path) = {
  let raw = csv(path)
  let header = raw.at(0)
  let body = raw.slice(1)

  let result = (:)
  
  // 1. Asse X (Speciale)
  result.insert("x-labels", body.map(r => r.at(0)))

  // 2. Accumulatore per i nomi delle serie
  let series-names = ()

  // 3. Parsing Colonne Dati
  for (idx, col-name) in header.slice(1).enumerate() {
    let col-values = body.map(r => {
      let val = r.at(idx + 1)
      if val == "" { 0 } else { float(val.replace(",", ".")) }
    })
    
    result.insert(col-name, col-values)
    
    // Aggiungiamo il nome alla lista "sicura"
    series-names.push(col-name)
  }

  // 4. Inseriamo la lista di servizio nel dizionario
  result.insert("series-names", series-names)

  return result
}

#csv("../data/mockup-multi.csv")
#parse-csv-to-columns("../data/mockup-multi.csv") 