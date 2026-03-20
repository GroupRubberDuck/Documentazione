#import "/src/config.typ":slugify

#let config=yaml("/scripts/use_case_generator/config.yaml")
// #config

// legge le informazioni di formattazione 
#let default-formatting-setting=(
  padding: 2, 
  separator: ".", 
  prefix: "UC",
  title-separator:"_"
)


#let formatting-setting=config.settings.formatting

#let imported-formatting-setting=(
  padding: formatting-setting.padding, 
  separator: formatting-setting.separator, 
  prefix: config.settings.prefix,
  title-separator:formatting-setting.title_separator
)

#let final-formatting-setting=default-formatting-setting+imported-formatting-setting

#final-formatting-setting

#let elenco-use-case=config.structure



#let build-map(items, parent-path: ()) = {
  let map = (:)
  if items == none { return map }

  // enumerate() restituisce coppie (indice, valore). Indice parte da 0.
  for (i, item) in items.enumerate() {
    let count = i + 1
    
    // --- IL CAMBIAMENTO CHIAVE ---
    // Creiamo un NUOVO array aggiungendo il numero corrente a quello del padre
    // Es: padre=(1), count=2 -> current-path=(1, 2)
    let current-path = parent-path + (count,)

    let name = ""
    let children = none

    // Logica di estrazione (uguale a prima)
    if type(item) == str {
      name = item
    } else if type(item) == dictionary {
      for (k, v) in item { name = k; children = v }
    }

    // Normalizziamo la chiave
    let key = lower(name).replace("_", "-").replace(" ", "-")
    
    // Inseriamo l'ARRAY DI INTERI nella mappa
    map.insert(key, current-path)

    // Ricorsione
    if children != none {
      map += build-map(children, parent-path: current-path)
    }
  }
  return map
}



#let mappa=build-map(elenco-use-case)
#mappa



#let format-code(code-array,settings:final-formatting-setting) = {
  // Se l'array è vuoto, ritorna errore
  if code-array.len() == 0 { return "XX" }

  let stringa=""+settings.prefix
  // Il primo numero (Capitolo)
  let primo-numero= code-array.remove(0)
  stringa=stringa+"0"*(settings.padding - str(primo-numero).len())+str(primo-numero)+"."

  for n in code-array {
    stringa=stringa+str(n)+settings.separator
  }

  stringa=stringa.slice(0,-1)+settings.title-separator


 stringa
}

#let get-use-case-code(nome-etichetta:str)={
  format-code(mappa.at(slugify(nome-etichetta))).slice(0,-1)
}

#let get-uc-depth(nome-etichetta: str) = {
  let key = slugify(nome-etichetta)
  
  // Controllo di sicurezza: se esiste nella mappa, restituisce la lunghezza dell'array
  if key in mappa {
    return mappa.at(key).len()
  } else {
    // Se non lo trova, puoi restituire 0 o generare un errore custom
    return 0 
  }
}