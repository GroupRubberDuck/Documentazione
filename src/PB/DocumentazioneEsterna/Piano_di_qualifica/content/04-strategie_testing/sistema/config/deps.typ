#import "/src/config.typ":slugify,is-test-mode
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":build-map

#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":unisci-dizionari

#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_desiderabili/config/deps.typ" as deps-des : get-req-code as des 

#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_opzionali/config/deps.typ" as deps-opz : get-req-code as opz

#import "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/content/requisiti/requisiti_obbligatori/config/deps.typ" as deps-obb: get-req-code as obb

#let requisiti=deps-obb.mappa.keys().map(
    (it)=>{
      (it,deps-obb.get-req-code(nome-etichetta:it))
    }
  ).to-dict() +   deps-des.mappa.keys().map(
    (it)=>{
      (it,deps-des.get-req-code(nome-etichetta:it))
    }
  ).to-dict() +  deps-opz.mappa.keys().map(
    (it)=>{
      (it,deps-opz.get-req-code(nome-etichetta:it))
    }
  ).to-dict()


)

#let numero-duplicati=requisiti.len()-(deps-obb.mappa.len()+deps-des.mappa.len()+deps-opz.mappa.len())
#numero-duplicati
#requisiti
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

#let get-test-code(nome-etichetta:str)={
  format-code(mappa.at(slugify(nome-etichetta))).slice(0,-1)
}

#let get-test-label(nome-etichetta)={
  link(label(get-test-code(nome-etichetta: nome-etichetta)), get-test-code(nome-etichetta:nome-etichetta))
}




#let test-transf=test=>get-test-code(nome-etichetta: test)

#let test-transf-link=if is-test-mode{
  test-transf
}else{
test=>get-test-label(nome-etichetta: test)
}





#let header-color = rgb("#008080b0")

#let tabella-test(..contenuto) = {
  table(
    columns: (auto, 3fr, 1fr,1fr),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },

    table.header(
      strong("Codice"),
      strong("Descrizione"),
      strong([Requisito di \ riferimento]),
      strong([Stato \ del test]),
      
    ),    ..contenuto
  )
}

#let tabella-tracciamento(..contenuto) = {
  table(
    columns: (auto,auto),
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left + horizon,
    fill: (col, row) => if row == 0 { header-color } else { none },

    table.header(
      strong("Codice Test"),
      strong("Codice Requisito"),
      
    ),

    ..contenuto
  )
}

