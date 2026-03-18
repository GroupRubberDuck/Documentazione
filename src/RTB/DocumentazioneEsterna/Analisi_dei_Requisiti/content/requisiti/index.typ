#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":unisci-dizionari,inverti-dizionario, format-array,format-dict-as-table
#import "/src/config.typ": is-test-mode
#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ":use-case-label,get-use-case-code,uc-transformation-senza-link,uc-transformation-con-link
#import "/src/TypstTemplate/AnalisiRequisiti/utils/style-theme.typ":req-table-style
#import "/src/TypstTemplate/AnalisiRequisiti/use-case-id-handler.typ":mappa,slugify

#show figure: set block(breakable: true)




#import "requisiti_obbligatori/_index.typ" as r-obb
#import "requisiti_obbligatori/config/deps.typ" as r-obb-deps

#import "requisiti_desiderabili/_index.typ" as r-des
#import "requisiti_desiderabili/config/deps.typ" as r-des-deps

#import "requisiti_opzionali/_index.typ" as r-opz
#import "requisiti_opzionali/config/deps.typ" as r-opz-deps

#set block(breakable: true)

= Requisiti <title-requisiti>
In questa sezione sono presenti i requisiti nati dai casi d'uso trovati grazie allo studio del capitolato, lo studio del dominio di progetto e dal confronto con l'azienda proponente.

== Requisiti funzionali <requisiti-funzionali>
I requisiti funzionali definiscono le funzioni, i comportamenti e le azioni specifiche che il software deve essere in grado di eseguire in risposta a determinati input o eventi.
Questi sono stati divisi in obbligatori (ROF: Requisiti Obbligatori Funzionali - requisiti che devono essere presenti per soddisfare la richiesta della proponente) e desiderabili (RDF: Requisiti Desiderabili Funzionali - requisiti che arricchiscono il sistema con funzionalità utili).
=== Requisiti funzionali obbligatori <funzionali-obbligatori>
#figure(caption:"Tabella requisiti obbligatori")[
#include "requisiti_obbligatori/_index.typ"
]

=== Requisiti funzionali desiderabili <funzionali-desiderabili>
#figure(caption:"Tabella requisiti desiderabili")[
#include "requisiti_desiderabili/_index.typ"
]

=== Requisiti funzionali opzionali <funzionali-opzionali>

#figure(caption:"Tabella requisiti opzionali")[
#include "requisiti_opzionali/_index.typ"
]

== Requisiti di vincolo <requisiti-vincolo>
Questa sezione definisce le restrizioni tecniche, normative e implementative che limitano le scelte progettuali nello sviluppo del sistema. Tali vincoli impongono condizioni obbligatorie, come l'uso di specifiche tecnologie e standard di compatibilità che il prodotto finale deve soddisfare.

#figure(caption:"Tabella requisiti di vincolo")[
#include "requisiti_vincolo/_index.typ"
]

== Requisiti di qualità
#figure(caption:"Tabella requisiti di qualità")[
#include "requisiti_qualita/_index.typ"
]

// ==== Tracciamento requisiti obbligatori
// #figure(caption: "Tabella tracciamento requisiti obbligatori")[

//   #format-dict-as-table(
//     columns: (1fr, 1fr),
//     table-modifiers:req-table-style,
//     header: (
//       strong("Requisito obbligatorio"),
//       strong("Casi d'uso"),

//     ),
//     key-transf: r-obb-deps.req-transf-link,
//     val-transf: format-array.with(transf:uc-transformation-con-link),
//     r-obb.req-uc-dict
//   )
// ]  

// ==== Tracciamento requisiti desiderabili
// #figure(caption: "Tabella tracciamento requisiti obbligatori")[

//   #format-dict-as-table(
//     columns: (1fr, 1fr),
//     table-modifiers:req-table-style,
//     header: (
//       strong("Requisito desiderabile"),
//       strong("Casi d'uso"),

//     ),
//     key-transf: r-des-deps.req-transf-link,
//     val-transf: format-array.with(transf:uc-transformation-con-link),
//     r-des.req-uc-dict
//   )
// ]  


// ==== Tracciamento requisiti opzionali
// #figure(caption: "Tabella tracciamento requisiti opzionali")[

//   #format-dict-as-table(
//     columns: (1fr, 1fr),
//     table-modifiers:req-table-style,
//     header: (
//       strong("Requisito opzionale"),
//       strong("Casi d'uso"),

//     ),
//     key-transf: r-opz-deps.req-transf-link,
//     val-transf: format-array.with(transf:uc-transformation-con-link),
//     r-opz.req-uc-dict
//   )
// ]  

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



== tracciamento casi d'uso <tracciamento-uc>
#figure(caption:"Tabella di tracciamento dei casi d'uso")[#format-dict-as-table(
  header: ([caso d'uso],[requisito]),
  table-modifiers:req-table-style,
  columns: (1fr,1fr),
  uc-dict,
  key-transf:uc-transformation-con-link,
  val-transf: format-array,
  sort: nome=>{
    mappa.at(
      slugify(nome.first()
      )
      )

  }

  )
]
// tracciamento dei casi d'uso non collegati a un requisito
#if is-test-mode {
heading("uc non tracciati")

let lista-completa-uc=mappa.keys().map(nome=>slugify(nome)) 
let lista-uc-tracciati=uc-dict.keys().map(nome=>slugify(nome))

let uc-non-tracciati = lista-completa-uc.filter(uc => uc not in lista-uc-tracciati)

format-dict-as-table(columns: 2,uc-non-tracciati.map(
  it=>{
    (it,uc-transformation-con-link(it))
  }
).to-dict())

}

