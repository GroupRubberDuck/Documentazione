#let extract_text_smart(elem) = {
  if elem == none {
    ""
  } else if type(elem) == str {
    elem
  
  // === 1. Elementi da Ignorare ===
  // Tabelle, Griglie, Codice grezzo, Indici, Figure
  } else if elem.func() == table or elem.func() == grid or elem.func() == raw or elem.func() == outline or elem.func() == figure {
    "" 

  // === 2. Elementi Strutturali che richiedono A CAPO ===
  
  // Titoli: Aggiungiamo un doppio a capo dopo il titolo per staccarlo dal paragrafo
  } else if elem.func() == heading {
    extract_text_smart(elem.body) + "\n\n"

  // Liste (Puntate, Numerate, Termini): Aggiungiamo un a capo dopo ogni elemento
  } else if elem.func() == list.item or elem.func() == enum.item or elem.func() == terms.item {
    if elem.has("body") {extract_text_smart(elem.body) + "\n"}

  // === 3. Gestione Testo e Spazi standard ===
  } else if elem.has("text") {
    elem.text
  } else if elem.func() == linebreak {
    "\n" 
  } else if elem.func() == parbreak {
    "\n\n"
  } else if elem.func() == smartquote {
    "\""
    
  // === 4. Ricorsione Generica ===
  } else if elem.has("children") {
    elem.children.map(extract_text_smart).join("")
  } else if elem.has("body") {
    extract_text_smart(elem.body)
  } else if elem.has("child") {
    extract_text_smart(elem.child)
  } else {
    " " // Fallback per sicurezza
  }
}

// Funzione di visualizzazione
#let show_smart_text(content) = {
  let raw_string = extract_text_smart(content)
  // Pulizia: Rimuovi spazi multipli ma mantieni i newline
  let clean_string = raw_string.replace(regex(" +"), " ").trim()
  
  [
    #pagebreak()
    = Testo per Analisi (Con Liste e Titoli corretti)
    
    #raw(clean_string, block: true)
  ]
}

// #show_smart_text(include("/src/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v0.8.0.typ"))