#import "config/deps.typ" as deps

#let req-name="Applicazione desktop o web based"
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
  // Per facilitare l'automazione, gli use case associati vanno riferiti solo per nome
  // La conversione in codice con label sarà effettuata in una fase successiva
  fonti:[
    #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; 
  ]
)