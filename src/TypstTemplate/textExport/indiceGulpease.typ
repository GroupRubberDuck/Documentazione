// #import "/src/config.typ":images_dir


// // 1. Funzione Ricorsiva per estrarre il testo puro
// #let extract_text(elem) = {
//   if type(elem) == str {
//     // Se è già una stringa, ritornala
//     elem
//   } else if elem.has("text") {
//     // Se è un elemento di testo base, prendi il testo
//     elem.text
//   } else if elem.has("children") {
//     // Se è una sequenza (es. un paragrafo o lista), unisci i figli
//     elem.children.map(extract_text).join(" ")
//   } else if elem.has("child") {
//     // Se è un elemento 'styled' (es. testo colorato o font diverso)
//     extract_text(elem.child)
//   } else if elem.has("body") {
//     // Se è un blocco, un rettangolo, o una cella di tabella
//     extract_text(elem.body)
//   } else if elem == linebreak() or elem == parbreak() {
//     // Converte interruzioni di riga in spazi/newline
//     " "
//   } else if elem.func() == smartquote {
//     // Gestisce le virgolette intelligenti
//     "\""
//   } else {
//     // Per immagini o altri elementi non testuali, ritorna uno spazio per evitare che le parole si incollino
//     " " 
//   }
// }

// #let extract_text_for_export(elem) = {
//   if elem == none {
//     ""
//   } else if type(elem) == str {
//     elem
//   }else if elem.func() == table or elem.func() == grid {
//     "" // Ritorna stringa vuota, saltando tutto il contenuto della tabella
//   } else if elem.has("text") {
//     elem.text
//   } else if elem.func() == linebreak {
//     "\n" // Mantiene l'a capo manuale
//   } else if elem.func() == parbreak {
//     "\n\n" // Doppio a capo per i paragrafi (i tool lo vedono come fine frase)
//   } else if elem.func() == smartquote {
//     "\""
//   } else if elem.has("children") {
//     // Unisce i figli. 
//     // NON aggiungiamo spazi arbitrari qui perché Typst gestisce gli spazi come elementi a sé stanti (" ")
//     elem.children.map(extract_text_for_export).join("")
//   } else if elem.has("body") {
//     // Gestisce celle di tabelle, rect, box, etc.
//     // Aggiungiamo un " " dopo il corpo per evitare che le celle si incollino (es. "Data" + "2025" -> "Data 2025")
//     extract_text_for_export(elem.body) + " " 
//   } else if elem.has("child") {
//     // Gestisce styled elements
//     extract_text_for_export(elem.child)
//   } else {
//     // Fallback per elementi sconosciuti (immagini, ecc.)
//     " "
//   }
// }
// // 2. La tua funzione Gulpease aggiornata

// #let extract_text_smart(elem) = {
//   if elem == none {
//     ""
//   } else if type(elem) == str {
//     elem
  
//   // === 1. Elementi da Ignorare ===
//   // Tabelle, Griglie, Codice grezzo, Indici, Figure
//   } else if elem.func() == table or elem.func() == grid or elem.func() == raw or elem.func() == outline or elem.func() == figure {
//     "" 

//   // === 2. Elementi Strutturali che richiedono A CAPO ===
  
//   // Titoli: Aggiungiamo un doppio a capo dopo il titolo per staccarlo dal paragrafo
//   } else if elem.func() == heading {
//     extract_text_smart(elem.body) + "\n\n"

//   // Liste (Puntate, Numerate, Termini): Aggiungiamo un a capo dopo ogni elemento
//   } else if elem.func() == list.item or elem.func() == enum.item or elem.func() == terms.item {
//     extract_text_smart(elem.body) + "\n"

//   // === 3. Gestione Testo e Spazi standard ===
//   } else if elem.has("text") {
//     elem.text
//   } else if elem.func() == linebreak {
//     "\n" 
//   } else if elem.func() == parbreak {
//     "\n\n"
//   } else if elem.func() == smartquote {
//     "\""
    
//   // === 4. Ricorsione Generica ===
//   } else if elem.has("children") {
//     elem.children.map(extract_text_smart).join("")
//   } else if elem.has("body") {
//     extract_text_smart(elem.body)
//   } else if elem.has("child") {
//     extract_text_smart(elem.child)
//   } else {
//     " " // Fallback per sicurezza
//   }
// }

// // Funzione di visualizzazione
// #let show_smart_text(content) = {
//   let raw_string = extract_text_smart(content)
//   // Pulizia: Rimuovi spazi multipli ma mantieni i newline
//   let clean_string = raw_string.replace(regex(" +"), " ").trim()
  
//   [
//     #pagebreak()
//     = Testo per Analisi (Con Liste e Titoli corretti)
    
//     #raw(clean_string, block: true)
//   ]
// }
// #let gulpease_analyzer(content) = {
//   // === PASSO CRUCIALE: Usiamo l'estrattore ricorsivo ===
//   let raw_text = extract_text_smart(content)
  
//   // Normalizzazione: rimuovi spazi duplicati e caratteri invisibili
//   let normalized_text = raw_text.replace(regex("[\s\n\r\t]+"), " ").trim()

//   // Controllo testo vuoto
//   if (normalized_text.len() == 0) {
//     return (index: 0, content: content) // 0 o 100 a scelta
//   }

//   // === Conteggio ===
//   // 1. Parole: divisione per spazi
//   let words_list = normalized_text.split(" ").filter(w => w != "")
//   let NP = words_list.len()

//   // 2. Frasi: divisione per punteggiatura forte (. ? ! ;)
//   // Nota: split rimuove il delimitatore, ma per il conteggio va bene
//   let sentences_list = normalized_text.split(regex("[.?!;]+")).filter(s => s.trim() != "")
//   let NF = sentences_list.len()
  
//   // Euristica: se c'è testo ma nessuna punteggiatura, conta come 1 frase
//   if (NF == 0 and NP > 0) { let NF = 1 }

//   // 3. Lettere: rimuovi tutto ciò che non è alfanumerico
//   let letters_only = normalized_text.replace(regex("[^a-zA-ZàèéìòùÀÈÉÌÒÙ]"), "")
//   let NL = letters_only.len()

//   // === Formula Gulpease ===
//   // G = 89 - (300 * Frasi / Parole) - (10 * Lettere / Parole)
//   // Nota: controlliamo NP != 0 per evitare divisione per zero
//   let result = 0
//   if NP > 0 {
//     result = 89 + ((300 * NF) - (10 * NL))/NP
//   }

//   return (
//     index: result,
//     words: NP,     // Utile per debug
//     sentences: NF, // Utile per debug
//     letters: NL,   // Utile per debug
//     content: content
//   )
// }



// // ----------------------------------------------------
// // TEST
// // ----------------------------------------------------

// #let daanalizzare = include "../RTB/DocumentazioneEsterna/VerbaliEsterni/2025-12-02_Verbale-v0.1.1.typ"

// #let analisi = gulpease_analyzer(daanalizzare)

// #set text(font: "Roboto", size: 11pt)

// // Mostra il risultato in un box carino
// #align(center)[
//   #rect(fill: luma(240), stroke: luma(200), inset: 12pt, radius: 5pt)[
//     #text(size: 1.2em, weight: "bold")[Report Leggibilità (Gulpease)] \
//     #v(5pt)
//     Indice: #text(fill: if analisi.index < 40 { red } else if analisi.index < 80 { orange } else { green }, weight: "bold")[#calc.round(analisi.index, digits: 2)] / 100 \
//     #text(size: 0.8em, style: "italic")[
//       (Parole: #analisi.words, Frasi: #analisi.sentences, Lettere: #analisi.letters)
//     ]
//   ]
// ]
// // #extract_text_for_export(daanalizzare)
// // Mostra il contenuto originale
// // #analisi.content
// // 
// // 
// // 
// // 
// // 
// #let show_raw_text(content) = {
//   let raw_string = extract_text_for_export(content)
  
//   // Pulizia finale: Riduciamo spazi multipli eccessivi ma manteniamo i newline
//   // I tool Gulpease spesso considerano il punto elenco (che va a capo) come una frase.
//   let clean_string = raw_string.replace(regex(" +"), " ") 
  
//   // Visualizza il testo in un blocco di codice copiabile
//   [
//     #pagebreak()
//     = Testo Estratto per Analisi Esterna
//     _Copia il contenuto del box qui sotto e incollalo nel tuo tool online._
    
//     #raw(clean_string, block: true)
//   ]
// }

// // ---------------------------------------------------------
// // UTILIZZO
// // ---------------------------------------------------------

// #let daanalizzare = include "../RTB/DocumentazioneEsterna/VerbaliEsterni/2025-12-02_Verbale-v0.1.1.typ"

// // Mostra il documento originale


// // Mostra la pagina extra con il testo da copiare
// #show_smart_text(daanalizzare)