#import "/src/config.typ": is-test-mode
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-label,get-use-case-code
#import "style-theme.typ":req-table-style
#let inverti-dizionario(
  diz, 
  key-transform: key => key,
  value-transform: value => value
) = {
  let nuovo-diz = (:) 
  
  for (vecchia-chiave, lista-vecchi-valori) in diz.pairs() {
    
    // 1. Applichiamo la trasformazione alla vecchia chiave (es. il Requisito). 
    // Questo diventerà il contenuto del nostro nuovo array di valori.
    let valore-da-salvare = key-transform(vecchia-chiave)
    
    for vecchio-valore in lista-vecchi-valori {
      
      // 2. Applichiamo la trasformazione al vecchio valore (es. il Caso d'Uso).
      // Questa diventerà la nostra nuova chiave nel dizionario invertito.
      let nuova-chiave = value-transform(vecchio-valore)
      
      // 3. Popoliamo il nuovo dizionario
      if nuova-chiave in nuovo-diz {
        let array-esistente = nuovo-diz.at(nuova-chiave)
        nuovo-diz.insert(nuova-chiave, array-esistente + (valore-da-salvare,))
      } else {
        nuovo-diz.insert(nuova-chiave, (valore-da-salvare,))
      }
    }
  }
  
  nuovo-diz
}



#let unisci-dizionari(..dizionari) = {
  // Inizializziamo il dizionario finale vuoto
  let risultato = (:)

  // dizionari.pos() restituisce un array con tutti i dizionari passati alla funzione
  for diz in dizionari.pos() {
    
    // Cicliamo su ogni coppia del dizionario corrente
    for (chiave, valore) in diz.pairs() {
      
      // 1. Normalizziamo il valore: ci assicuriamo che sia SEMPRE un array
      let array-valore = if type(valore) == array { valore } else { (valore,) }

      // 2. Inseriamo o aggiorniamo la chiave nel dizionario finale
      if chiave in risultato {
        // La chiave esiste: concateniamo i due array
        let array-esistente = risultato.at(chiave)
        risultato.insert(chiave, array-esistente + array-valore)
      } else {
        // La chiave è nuova: la aggiungiamo
        risultato.insert(chiave, array-valore)
      }
    }
  }

  risultato
}

// dato un array applica una trasformazione a ciascun elemento e li unisce in un blocco di content
#let format-array(ar, transf: it => it, separator: linebreak()) = {
  // 1. Ci assicuriamo che 'ar' sia un array, altrimenti lo "impacchettiamo"
  let safe-ar = if type(ar) == array { ar } else { (ar,) }
  
  // 2. Mappiamo e uniamo invocando correttamente 'transf'
  safe-ar.map(item => transf(item)).join(separator)
}

#let map-values(dict, transf:x=>x) = {
  let new-dict = (:)
  for (k, v) in dict.pairs() {
    new-dict.insert(k, transf(v))
  }
  new-dict
}


/// Prende un dizionario e lo stampa in una tabella a due colonne.
/// Applica in automatico il flatten() necessario per la funzione table().
#let format-array-as-table(
  diz, 
  header:(),
  key-transf: k => k, 
  val-transf: v => v,
  columns:2,
  table-modifiers:(:),
  sort:none
) = {
  table-modifiers.insert("columns",columns)
  // Creiamo l'array piatto per le celle usando map() e flatten()
  let celle = diz.pairs()
  if sort!=none{
    celle=celle.sorted(key: sort)
    }
  celle=celle.map(pair => {
    let chiave = pair.at(0)
    let valore = pair.at(1)
    
    // Ritorniamo una tupla con i due elementi trasformati
    (key-transf(chiave), val-transf(valore))
  }).flatten()

  // Generiamo la tabella passandogli le celle "esplose" con ..
  table(
    table.header(..header),
    ..table-modifiers,
    ..celle
  )
}

// wrapper per i test degli usecase
#let uc-transformation-senza-link=uc=>get-use-case-code(nome-etichetta: uc)

#let uc-transformation-con-link= if is-test-mode{
  uc-transformation-senza-link
} else {
  uc=>use-case-label(nome-etichetta: uc)
}
