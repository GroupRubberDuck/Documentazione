#import "config/deps.typ" as deps

#let req-name="Applicazione web locale"
#let data =(
  codice:[
    #deps.get-req-code(nome-etichetta: req-name)
    #label(deps.get-req-code(nome-etichetta:req-name))
    ],

  descrizione:[
    L'applicazione deve essere distribuita come web app locale, accessibile tramite browser web su indirizzo localhost. L'utente non deve installare software esterno oltre a un browser compatibile e Docker (per containerizzazione).
    
    *Browser supportati:*
    - Google Chrome versione 90+
    - Mozilla Firefox versione 88+
    - Apple Safari versione 14+
    - Microsoft Edge versione 90+
  ],
  
  fonti:[
    Interno
  ]
)