// Pronto per la verifica: no
// In verifica :
// 
// Verifica superata:
// 
// Checklist
// Conforme ai contenuti:
// Correttezza grammaticale:
// Correttezza sintattica: 
// 

#set text(lang: "IT")

#import "/src/config.typ": *
#import template_dir + "/frontPage.typ": frontPage
#import template_dir + "/setUpPageLayout.typ": *
#import template_dir + "/registroModifiche.typ": registroModifiche
#import template_dir + "/statusTab.typ": statusTab
#import template_dir + "/utilityTable.typ": getCode, utilityTable

#show link: body => {set text(fill:blue); underline()[#body]}
#show ref: body => { underline()[#strong(body)]}

#set text(size: 12pt)
#set heading(numbering: "1.1)")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 16pt)
#let giornoRiunione = datetime(year: 2025, month: 11, day: 18)
#let doctype="Verbale interno"
#frontPage([Verbale riunione], giornoRiunione)

#insertRomanNumberedPages( "Stato del documento", doctype,giornoRiunione)[
  #statusTab(
    stato: "In stesura",
    versione: "0.1.0",
    autori: ("Davide Lorenzon",),
    revisori: ("",),
    validatori: ("",),
    uso: "Interno",
    destinatari: ("Tutto il gruppo",),
  )
]
#insertRomanNumberedPages("Registro Modifiche",doctype,giornoRiunione )[


  #let modifiche=(

    ([0.1.0],[2025-11-17],[Davide Lorenzon],[Aldo Bettega],[Stesura delle domande]),
    ([0.2.0],[#giornoRiunione.display()],[Davide Lorenzon],[],[Prima stesura]),
      
      )

      #registroModifiche(modifiche)




]

#insertRomanNumberedPages("Indice","Verbale interno",giornoRiunione )[
#outline( depth: 2,title: "Indice")
]

#pagebreak()
  #context counter(page).update(1)


#insertArabicNumberedPages("Informazioni generali","Verbale interno",giornoRiunione )[
  = Informazioni generali
- *Tipo di riunione*: Esterno
- *Motivazione*: Riunione di ripianificazione a seguito dell'incontro con la proponente
- *Data*: 2025-11-18
- *Luogo*: Riunione su Zoom
- *Ora inizio*: 17:00
- *Ora fine*: 18:00
- *Scriba*: Aldo Bettega
- *Partecipanti*:#align(left)[
#set list(marker: [--])
- Davide Lorenzon
- Ana Maria Draghici
- Felician Mario Necsulescu
- Davide Testolin
- Filippo Guerra
- Aldo Bettega  \
]
]


#insertArabicNumberedPages("Ordine del giorno","Verbale interno",giornoRiunione )[
  = Ordine del giorno
  Si è approfittato della riunione per discutere anche di attività non collegate alla riunione con la proponente, tali attività sono aggiustamenti ad alcune parti dei documenti, sono una parte del processo di automiglioramento(in questa riunione si cerca di integrare le nuove informazioni fornite dal professore).
  - Riassunto delle conclusioni tratte dalla riunione con BlueWind.
  - Miglioramento della struttura del registro delle modifiche
  - Cambiamenti nella spartizione ruoli compiti.
  - Introduzione di un verisonamento semantico.
  - Processo di pubblicazione dei documenti.
  - Introduzione di issue template.
  - Nuova definition of Done.

]

#insertArabicNumberedPages("Riassunto della riunione","Verbale interno",giornoRiunione )[
  = Riassunto della riunione
  La gran parte della riunione è stata dedicata all'aggiornamento dei membri del gruppo non presenti alle lezioni di riferimento.
  
  == Conclusioni dell'incontro con BlueWind
   Le conclusioni della riunione con BlueWind sono state riportate nell'apposito verbale, in questa sede è stata solo decisa la ripartizione del lavoro. \ Ovvero ogni membro del gruppo si dedicherà allo studio dei documenti forniti.
  - #upper("è") stato deciso di completare lo studio dei documenti, la loro stesura sarà limitata all'introduzione.
  == Introduzione del versionamento semantico <vers>
  A lezione è stato spiegato il versionamento semantico, questa best practices si adatta bene alle nostre necessità quindi è stato deciso di implementarla.

  #align(center)[
    #text(fill:red)[X].#text(fill:green)[Y].#text(fill:blue)[Z]
  ]
  - #text(fill:red)[X, Major Version]:\
  Modifiche e aggiunte sostanziali, non retrocompatibili
  
  - #text(fill:green)[Y, Minor Version]:\
  Modifiche e aggiunte di minore importanza, retrocompatibili

  - #text(fill:blue)[Z, patch]:\
  Non ci sono aggiunte, solo correzioni, retrocompatibili

  La retrocompatibilità ha molta importanza per l'applicativo software.
  Per la documentazione è meno importante.
  == Ruoli primari nei processi di supporto <ruoli>
  Le attività dei processi di supporto consumanno ore produttive dell'attività di processo primario che li ha generati.
  Tali relazioni sono descritte nel documento norme di progetto.

  == Registro delle modifiche <registro>
  Correzione semantica, non si usa il termine validatore ma bensì verificatore.
  l'approvazione è rappresentata da una riga del registro delle modifiche in cui autore e verificatore coincidono e la descrizione è "Approvazione del documneto"/"Approvazione della sezione X".
  == Modifica del worflow per la stesura dei documenti <workflow>
  La modifica degli stati attraversati dal documento richiede di aggiornare il workflow di conseguenza.
  == Introdotto Issue Template <issueTemplate>
  Introdotta una priuma bozza di issue template, se ne prevede il miglioramento a seguito dell'utilizzo in modo da comprenderne meglio come può essere migliorato.

  == Definition of Done <DD>
  La modifica del workflow per i documenti richiede una modifica nella Definition of Done.
]


#insertArabicNumberedPages("Decisioni","Verbale interno",giornoRiunione )[
= Decisioni
#let contatoreDecisioni= counter("decisioni")
#contatoreDecisioni.update(1)
#let prefisso="VI.6."

#let decisioni=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Aggiornamento del worflow per la redazione dei documenti.],
  [Conseguenza della migliore comprensione dei passi necessari a redarre un documento in modo appropriato],
  [#ref(<workflow>)]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Correlazione documento-ruolo .],
  [Ufficializzare la relazione ruolo-documento.],
  [#ref(<ruoli>)]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Adozione del verisonamento semantico.],
  [#upper("è") una best practice],
  [#ref(<vers>)]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Dare una nuova definition of Done.],
  [Aggiornamento necessario.],
  [#ref(<vers>)]
),
(
  [#getCode(prefisso:prefisso,contatore:contatoreDecisioni)],
  [Modificare il registro delle modifiche.],
  [Aggiornamento necessario.],
  [#ref(<registro>)]
),
)

#utilityTable(decisioni,header:("Codice","Descrizione","Motivazioni","Ref."),columns:(auto,2fr,2fr,auto))

]


#insertArabicNumberedPages("TODO","Verbale interno",giornoRiunione )[

= TODO
#let prefisso="TD.7."
#let contatoreTodo= counter("todo")
#contatoreTodo.update(1)
I TODO sorti da questa riunione sono i seguenti:
#let TODO=(
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Redazione del verbale di questa riunione.],
  [-],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Studio e stesura del nuovo workflow.],
  [VI.6.1],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Aggiornamento delle norme di progetto, aggiunta nuova correlazione ruolo-documento.],
  [VI.6.2],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Aggiornamento Norme di progetto e documenti per RTB, per adottare il vers. semantico.],
  [VI.6.3],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Studio della Definition of Done.],
  [VI.6.4],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Aggiornamento norme di progetto, aggiunta del nuovo registro delle modifiche.],
  [VI.6.5],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [Aggiornare i documenti della RTB per uniformarlo ai nuovi standard.],
  [VI.6.5],
), 
(
  [#getCode(prefisso:prefisso,contatore:contatoreTodo)],
  [-],
  [modificare lo script per la compilazione dei documenti in modo che ignori i documenti per la candidatura.Alcune delle modifiche non sono retrocompatibili.],
  [VI.6.5],
), 
  )
#utilityTable(TODO,header: ("Codice","Assegnatari","Task","Decisione di riferimento"),columns: (auto,auto,1fr,auto),)


]