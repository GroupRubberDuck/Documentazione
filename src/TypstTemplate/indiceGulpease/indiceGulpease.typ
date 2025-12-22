#import "textExtractor.typ":show_smart_text,extract_text_smart

#let count_words(clean_text) = {
// Gestiamo sia l'apostrofo standard (') che quello tipografico (’)
  let text_normalized = clean_text.replace("'", " ").replace("’", " ").replace("\"", " ")
  // Regex per spazi bianchi multipli, tabulazioni o a capo
  let words = clean_text.split(regex("[\s\n\r]+"))
  // Filtra stringhe vuote che potrebbero generarsi dai doppi spazi
  words.filter(w => w != "").len()
}

#let count_letters(clean_text) = {
  // \p{L} è la classe Unicode per "qualsiasi Lettera" (include accentate)
  // Rimpiazza tutto ciò che NON è lettera con stringa vuota
  let letters_only = clean_text.replace(regex("[^\p{L}]"), "")
  letters_only.len()
}

#let count_sentences(clean_text) = {
  // Divide usando i separatori di frase standard italiani
let fragments = clean_text.split(regex("[.?!;\n]+"))  
  // Conta solo i frammenti che contengono testo (evita conteggi doppi per "...")
  let n_sentences = fragments.filter(f => f.trim() != "").len()
  
  // Euristica di sicurezza: se c'è del testo (più di 0 parole) ma nessuna punteggiatura, 
  // conta comunque come almeno 1 frase (es. un titolo o una frase sospesa)
  if n_sentences == 0 and clean_text.trim().len() > 0 {
    1
  } else {
    n_sentences
  }
}

#let compute_gulpease(content) = {
  // 1. Estrazione del testo (passaggio cruciale da Content a String)
  let raw_text = extract_text_smart(content)
  
  // 2. Pulizia preliminare (normalizzazione spazi)
  let clean_text = raw_text.replace(regex(" +"), " ").trim()
  
  // 3. Utilizzo delle funzioni modulari
  let num_parole = count_words(clean_text)
  let num_lettere = count_letters(clean_text)
  let num_frasi = count_sentences(clean_text)
  
  // 4. Calcolo Indice (con protezione divisione per zero)
  let index = 0
  if num_parole > 0 {
    // Formula Gulpease: 89 + (300 * Frasi / Parole) - (10 * Lettere / Parole)
    index = 89 + (300 * num_frasi / num_parole) - (10 * num_lettere / num_parole)
  }
  
  // 5. Return dei dati
  // Restituiamo un oggetto (dictionary) con tutti i dettagli
  return (
    valore: calc.max(0, index), // Evita negativi
    parole: num_parole,
    lettere: num_lettere,
    frasi: num_frasi
  )
}


#let display_gulpease(risultato,nomeDocumento:"") = {
  // Estrai il valore per comodità
  let index = risultato.valore

  // 1. Logica Colori e Testo
  // < 40: Difficile (Rosso)
  // 40 - 80: Medio (Arancione)
  // > 80: Facile (Verde)
  let (colore, stato) = if index < 40 {
    (rgb("#d32f2f"), "Difficile") // Rosso scuro
  } else if index < 80 {
    (rgb("#f57c00"), "Medio")     // Arancione
  } else {
    (rgb("#388e3c"), "Facile")    // Verde
  }

  // 2. Visualizzazione
  align(center)[
    #block(
      breakable: false, // Evita che il box si spezzi tra due pagine
      width: 95%,       // Larghezza del box
      rect(
        fill: luma(248),        // Sfondo grigio chiarissimo
        stroke: (left: 4pt + colore, rest: 1pt + luma(220)), // Bordo colorato a sinistra
        inset: 14pt,
        radius: 4pt,
      )[
        #stack(dir: ltr, spacing: 1fr,
          // --- Lato Sinistro: Titolo e Punteggio ---
          align(left + horizon)[
            #text(size: 0.9em, weight: "bold", fill: luma(100))[#nomeDocumento - INDICE GULPEASE] \
            #v(2pt)
            #text(size: 2.5em, weight: "black", fill: colore)[
              #calc.round(index)
            ]
            #text(size: 1.2em, fill: luma(150))[ 100 ] 
            #text(size: 0.9em, style: "italic", fill: colore)[#stato]
          ],

          // --- Lato Destro: Statistiche ---
          align(right + horizon)[
            #set text(size: 0.9em, fill: luma(80))
            #grid(
              columns: 2,
              column-gutter: 10pt,
              row-gutter: 6pt,
              align: (right, left),
              
              [Totale Parole:], strong(str(risultato.parole)),
              [Totale Frasi:],  strong(str(risultato.frasi)),
              [Totale Lettere:], strong(str(risultato.lettere))
            )
          ]
        )
      ]
    )
  ]
}