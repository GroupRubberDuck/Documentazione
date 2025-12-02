#import "/src/config.typ":glossario,flagMarcaturaAutoamticaTerminiGlossario
#import glossario:*
#let insertPages(PageTitle:str, documentType:str, date:"" , doc, numbering:str )={
  set page(
    paper: "a4",
    header: place(
      horizon,
    )[
      #box(width: 100%)[
        #place(left)[*#PageTitle*]
        #place(right)[*RubberDuck*]
      ]
      #line(length: 100%)
    ],
    footer: align(top, [
      #line(length: 100%)
      #box(width: 100%)[
        #place(horizon + left)[#documentType]
        #place(horizon + right)[#date]
      ]
      #align(center)[#context counter(page).display()]
    ]),
    numbering: numbering,
  )

  set par(justify: true)



  // inizio show rule per la marcatura dei termini del glossario
  // per motivi di performance la marcatura può essere attivata o disattivata tramite una flag apposita
  if flagMarcaturaAutoamticaTerminiGlossario and documentType!="Glossario"{  let  chiavi=dict.keys().map(key=>{
    "(?i)\\b" + key + "\\b"
  
    }
    )
    let reg=regex(chiavi.join("|"))
    show reg:name=>{
    name+sub(strong("G"))
    }
    doc
    }
    // fine della show rule
  else{
    doc
  }
}



#let insertRomanNumberedPages(PageTitle, documentType, date, doc) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"i" ,date:date.display(),doc)

}


#let insertArabicNumberedPages(PageTitle, documentType, date, doc) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"1" ,date:date.display(),doc)

}

#let insertRomanNumberedPagesSenzaData(PageTitle:"Titolo della pagina", documentType:"Tipo di documento", doc) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"i" ,doc)

}


#let insertArabicNumberedPagesSenzaData(PageTitle:"Titolo della pagina", documentType:"Tipo di documento", doc) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"1" ,doc)
}




#insertPages(numbering:"i")[best practices]
#insertPages(numbering:"i")[ggggg]
#insertPages(numbering:"i")[ggggg]
#insertPages(numbering:"i")[ggggg]
