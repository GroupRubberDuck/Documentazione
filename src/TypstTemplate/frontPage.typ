// Import using absolute paths from root
#import "/src/config.typ": logo-rd, logo-unipd, fontDaUsare

#set page(
  paper: "a4",
  margin: (top: 1.5in, bottom: 1in, left: 1in, right: 1in)
)

#set text(font: fontDaUsare, size: 13pt)

#let logoUnipd = image(logo-unipd)
#let logoRD = image(logo-rd,width: 30%)
#let giornoRiunione = datetime( year: 2025,
                                month: 10,
                                day:18
)
// Reusable header function

#let frontPage(title ,date) = {
  place(top+left,float:true )[
    
    #box(
    width: 100%,
  )[
    #place(top + left,float: true)[    
      #logoUnipd
            #place(horizon + center, dx:150%)[
            #set text(size: 15pt)
              
            *Università degli studi di Padova*

            Laurea: Informatica

            Corso: Ingegneria del software

            Anno accademico: 2025/2026
              
            ]
    ]
        #place(top + left,float: true)[    
            #logoRD
            #place(horizon + center, dx:170%)[
            #set text(size: 15pt)
              
            *Gruppo RubberDuck*

            email: #link("mailto:grouprubberduck@gmail.com")[
              GroupRubberDuck\@gmail.com
              
            ]
              
            ]
    ]   
    ]
    
  ]
  align(center)[
    #set text(size:20pt)
    *#title*
    
    *#date.display()*
  ]
  // lorem(90)
  pagebreak()
  context counter(page).update(1)
}




