#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
== Backend <backend>

#let frontend=(
  "Linguaggio di Programmazione":
    ([Javascript],[],[]),
  "Framework": 
    ([Vue],[],[]),
  "Dipendenze principali":
    (
            ([],[],[]),
    ),
  "Dynamic Testing":(
      ([],[],[]),
  ),
  "Static Testing":(
      ([],[],[]),
  ),
  "Sviluppo":(
      ([],[],[]),
  ),

)




#tabella-tecnologie(caption: "Frontend", 
cells:frontend
)
