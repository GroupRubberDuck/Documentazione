#import "/src/config.typ":slugify,snakify

#let config=yaml("config.yaml")
// #config

// legge le informazioni di formattazione 
#let default-formatting-setting=(
  padding: 2, 
  separator: ".", 
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
#import "/src/config.typ":template_dir

#import template_dir + "/PdQ/metricaDescrizione.typ":descrizione-metrica


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




#let get-MPC-code(nome-metrica)={
  format-code(mappa.at(slugify(nome-metrica))).slice(0,-1)
}

#let get-metrica-path(nome-metrica)={

  "/"+config.settings.output_dir+"/"+get-MPC-code(nome-metrica)+final-formatting-setting.title-separator+snakify(nome-metrica)+".typ"
}


#for nome in mappa.keys() {
  get-MPC-code(nome) 

  [ \ ]
get-metrica-path(nome)
[ \ ]
}


