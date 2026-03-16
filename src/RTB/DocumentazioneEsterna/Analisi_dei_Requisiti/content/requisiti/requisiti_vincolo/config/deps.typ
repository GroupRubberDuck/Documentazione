#import "/src/config.typ":slugify,is-test-mode
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":build-map,get-use-case-code
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-label
#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":format-array-as-table,format-array


// #import "/src/TypstTemplate/AnalisiRequisiti/tabellaRequisiti.typ": tabella-requisiti

#let config=yaml("config.yml")

// legge le informazioni di formattazione 
#let default-formatting-setting=(
  padding: 2, 
  separator: ".", 
  prefix: "",
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

#let get-req-code(nome-etichetta:str)={
  format-code(mappa.at(slugify(nome-etichetta))).slice(0,-1)
}

#let get-req-label(nome-etichetta)={
  link(label(get-req-code(nome-etichetta: nome-etichetta)), get-req-code(nome-etichetta:nome-etichetta))
}




#let req-transf=req=>get-req-code(nome-etichetta: req)

#let req-transf-link=if is-test-mode{
  req-transf
}else{
get-req-label
}





#let header-color = rgb("#008080b0")

#let tabella-requisiti(..contenuto) = {
  table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },

    table.header(
      strong("Codice"),
      strong("Descrizione"),
      strong("Fonti"),
    ),

    ..contenuto
  )
}

// #let tabella-requisiti-track(diz) = {
//   format-array-as-table(
//     table-modifiers:(
//       stroke: 0.5pt + black,
//       inset: 8pt,
//       align: left + horizon,
//       fill: (col, row) => if row == 0 { header-color } else { none },
//     ),
//     columns: (1fr, 1fr),
//     header: (
//       strong("Requisito"),
//       strong("Casi d'uso"),

//     ),
//     key-transf: req-transf,
//     val-transf: format-array.with(transf: uc-transform-link),
//     diz
//   )
// }

