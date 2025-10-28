#let statusTab(versione:"", stato:"",autori:("",""), 
verificatori:("",""),uso:"",destinatari:("",""),colore:rgb("#4e5b5e"))={

  set table(
  fill: (_, y) => if calc.odd(y) { colore } )

  show table.cell.where(x: 0): strong

  table(
    columns: (2fr,6fr),
    [Stato],[#stato],
    [Versione],[#versione],
    [Autori],[
      #for a in autori {
        a 
        [\ ]
      }
    ],
    [Verificatori],[
      #for a in verificatori {
        a 
        [\ ]
      }
    ],
    [Uso],[#uso],
    [Destinatari],[
      #for a in destinatari {
        a 
        [\ ]
      }
    ],
    
  )
}

#statusTab(versione:"0.1",stato: "In lavorazione",
        autori:("Davide Lorenzon","Aldo Bettega"),
        verificatori:(""),uso:"interno")