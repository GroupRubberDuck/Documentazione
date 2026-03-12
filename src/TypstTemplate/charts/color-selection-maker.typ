#let get-gradient-colors(n:1, color-map: color.map.spectral) = {
  let map-len = color-map.len()
  
  // 1. Itera esattamente n volte (Garantisce la lunghezza corretta)
  range(n).map(i => {
    
    // 2. Calcola l'indice proporzionale (Interpolazione lineare)
    // Usiamo calc.max(1, n-1) per evitare la divisione per zero se n=1
    // senza dover usare un 'if'
    let index = int(i * (map-len - 1) / calc.max(1, n - 1))
    
    color-map.at(index)
  })
}
