#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":unisci-dizionari,inverti-dizionario, format-array,format-array-as-table
#import "/src/config.typ": is-test-mode
#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":use-case-label,get-use-case-code,uc-transformation-senza-link,uc-transformation-con-link
#import "/src/TypstTemplate/AnalisiRequisiti/utils/style-theme.typ":req-table-style
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":mappa

#show figure: set block(breakable: true)




#import "requisiti_obbligatori/_index.typ" as r-obb
#import "requisiti_obbligatori/config/deps.typ" as r-obb-deps

#import "requisiti_desiderabili/_index.typ" as r-des
#import "requisiti_desiderabili/config/deps.typ" as r-des-deps

#import "requisiti_opzionali/_index.typ" as r-opz
#import "requisiti_opzionali/config/deps.typ" as r-opz-deps

#set block(breakable: true)


#figure(caption:"Tabella requisiti obbligatori")[
#include "requisiti_obbligatori/_index.typ"
]
#figure(caption:"Tabella requisiti desiderabili")[
#include "requisiti_desiderabili/_index.typ"
]
#figure(caption:"Tabella requisiti opzionali")[
#include "requisiti_opzionali/_index.typ"
]


=== Tracciamento requisiti
==== Tracciamento requisiti obbligatori
#figure(caption: "Tabella tracciamento requisiti obbligatori")[

  #format-array-as-table(
    columns: (1fr, 1fr),
    table-modifiers:req-table-style,
    header: (
      strong("Requisito obbligatorio"),
      strong("Casi d'uso"),

    ),
    key-transf: r-obb-deps.req-transf-link,
    val-transf: format-array.with(transf:uc-transformation-con-link),
    r-obb.req-uc-dict
  )
]  

==== Tracciamento requisiti desiderabili
#figure(caption: "Tabella tracciamento requisiti obbligatori")[

  #format-array-as-table(
    columns: (1fr, 1fr),
    table-modifiers:req-table-style,
    header: (
      strong("Requisito desiderabile"),
      strong("Casi d'uso"),

    ),
    key-transf: r-des-deps.req-transf-link,
    val-transf: format-array.with(transf:uc-transformation-con-link),
    r-des.req-uc-dict
  )
]  


==== Tracciamento requisiti opzionali
#figure(caption: "Tabella tracciamento requisiti opzionali")[

  #format-array-as-table(
    columns: (1fr, 1fr),
    table-modifiers:req-table-style,
    header: (
      strong("Requisito opzionale"),
      strong("Casi d'uso"),

    ),
    key-transf: r-opz-deps.req-transf-link,
    val-transf: format-array.with(transf:uc-transformation-con-link),
    r-opz.req-uc-dict
  )
]  

#let uc-dict=unisci-dizionari(
    inverti-dizionario(
      r-obb.req-uc-dict,
      key-transform: r-obb-deps.req-transf-link
      // value-transform: format-array.with(transf:uc-transformation-con-link)
      ),
      inverti-dizionario(
      r-des.req-uc-dict,
      key-transform: r-des-deps.req-transf-link

      // value-transform: format-array.with(transf:uc-transformation-con-link)
      ),    
      inverti-dizionario(
      key-transform: r-opz-deps.req-transf-link,
      r-opz.req-uc-dict,
      ),
)



== tracciamento casi d'uso
#format-array-as-table(
  header: ([caso d'uso],[requisito]),
  table-modifiers:req-table-style,
  columns: (1fr,1fr),
  uc-dict,
  key-transf:uc-transformation-con-link,
  val-transf: format-array,
  sort: nome=>{mappa.at(slugify(nome))

  }

  )