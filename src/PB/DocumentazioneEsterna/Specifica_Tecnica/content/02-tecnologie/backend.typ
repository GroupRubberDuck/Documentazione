#import "/src/TypstTemplate/specificaTecnica/tabella-tecnologie.typ": tabella-tecnologie,
== Backend <backend>

#let backend=(
  "Linguaggio di Programmazione":
    ([Python],[3.12.X],[]),
  "Framework": 
    ([Flask],[3.1.3],[]),
  "Dipendenze principali":
    (
      ([waitress],[3.0.2],[]),
      ([fpdf],[],[]),
      ([fpdf2],[],[]),
      ([pymongo],[],[]),
      ([pydantic],[],[]),
      ([python.dotenv],[],[]),
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




#tabella-tecnologie(caption: "Backend", 
cells:backend
)
