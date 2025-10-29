#let insertRomanNumberedPages(PageTitle, documentType, date,doc)={
set page(
  paper: "a4",
  header: place(
    horizon
  )[
    #box(width: 100%)[
          #place(left)[*#PageTitle*]
    #place(right)[*RubberDuck*]
    ]
 #line( length: 100%)
],
  footer:align(top,[
 #line( length: 100%)
    #box(width:100%)[
     #place(horizon + left)[#documentType]
    #place(horizon + right)[#date.display()]     
    ]

    
    #align(center)[#context counter(page).display()]
    
  ]),
  numbering: "i",
 

)
  doc
} 


#let insertArabicNumberedPages(PageTitle, documentType, date,doc)={
  set page(
  paper: "a4",
  header: place(
    horizon
  )[
    #box(width: 100%)[
          #place(left)[*#PageTitle*]
    #place(right)[*RubberDuck*]
    ]
 #line( length: 100%)
],
  footer:align(top,[
 #line( length: 100%)
    #box(width:100%)[
     #place(horizon + left)[#documentType]
    #place(horizon + right)[#date.display()]     
    ]

    
    #align(center)[#context counter(page).display()]
    
  ]),
  numbering: "1",
 

)
  doc
} 











#let insertRomanNumberedPages_v2(PageTitle:"Titolo", documentType:"Tipo documento", date:"",doc)={
set page(
  paper: "a4",
  header: place(
    horizon
  )[
    #box(width: 100%)[
          #place(left)[*#PageTitle*]
    #place(right)[*RubberDuck*]
    ]
 #line( length: 100%)
],
  footer:align(top,[
 #line( length: 100%)
    #box(width:100%)[
     #place(horizon + left)[#documentType]
    #place(horizon + right)[#date]     
    ]

    
    #align(center)[#context counter(page).display()]
    
  ]),
  numbering: "i",
 

)
  doc
} 


#let insertArabicNumberedPages_v2(PageTitle:"Titolo", documentType:"Tipo documento", date:"",doc)={
  set page(
  paper: "a4",
  header: place(
    horizon
  )[
    #box(width: 100%)[
          #place(left)[*#PageTitle*]
    #place(right)[*RubberDuck*]
    ]
 #line( length: 100%)
],
  footer:align(top,[
 #line( length: 100%)
    #box(width:100%)[
     #place(horizon + left)[#documentType]
    #place(horizon + right)[#date]     
    ]

    
    #align(center)[#context counter(page).display()]
    
  ]),
  numbering: "1",
 

)
  doc
} 

