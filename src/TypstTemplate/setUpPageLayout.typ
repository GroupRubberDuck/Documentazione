#import "/src/config.typ":glossario,flagMarcaturaAutoamticaTerminiGlossario
#import glossario:*
#let insertPages(PageTitle:str, documentType:str, date:"" , doc, numbering:str , gloss-flag:true)={
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
set text(lang: "IT")
show ref: riferimento=>{
  underline(strong(riferimento))
}
// show link: riferimento=>{
//   underline(text(riferimento, fill: blue))
// }
set par(justify: true)



  // inizio show rule per la marcatura dei termini del glossario
  // per motivi di performance la marcatura può essere attivata o disattivata tramite una flag apposita
  if flagMarcaturaAutoamticaTerminiGlossario and gloss-flag and documentType!="Glossario"{  let  chiavi=dict.keys().map(key=>{
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



#let insertRomanNumberedPages(PageTitle, documentType, date, doc, gloss-flag:true) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"i" ,date:date.display(),doc,gloss-flag: gloss-flag)

}


#let insertArabicNumberedPages(PageTitle, documentType, date, doc,gloss-flag:true) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"1" ,date:date.display(),doc,gloss-flag:gloss-flag)

}

#let insertRomanNumberedPagesSenzaData(PageTitle:"Titolo della pagina", documentType:"Tipo di documento", doc, gloss-flag:true) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"i" ,doc, gloss-flag: gloss-flag)

}


#let insertArabicNumberedPagesSenzaData(PageTitle:"Titolo della pagina", documentType:"Tipo di documento", doc,gloss-flag:true) = {
insertPages(PageTitle:PageTitle,documentType:documentType,numbering:"1 " ,doc, gloss-flag: gloss-flag)
}




#insertPages(numbering:"i")[best practices]
#insertPages(numbering:"i")[ggggg]
#insertPages(numbering:"i")[ggggg]
#insertPages(numbering:"i")[ggggg]
