// 
// Piano di Progetto 
// = Sezione 4 - Pianificazione di breve periodo
// == Sottosezione 1 - Requirements and Technology Baseline
// 
#import "/src/config.typ":template_dir
#import template_dir+"/PdP/sprint.typ":sprint,ruoli


#let date=(inizio:datetime(year: 2025,month: 11,day:10),
finePrevista:datetime(year: 2025,month: 11,day:25),
fineEffettiva:datetime(year: 2025,month: 11,day:25))





#sprint()
  ==== Sprint 1
  #grid( columns: 2, inset:0.7em,
    [Inizio:],[2025-11-10],
    [Fine prevista:],[2025-11-25],
    [Fine reale:],[],
    [Ritardo:],[],
    )
  ===== Attività da svolgere
  In questo primo periodo di avanzamento, gli sforzi del gruppo si concentreranno nello studio dei documento e altre attività di studio.
  Il fine di questa fase è la creazione di buone basi per svolgere in maniera efficacie ed efficiente le attività di sprint successivi.
  - Studio e prima redazione dei documenti#list(
    [Norme di Progetto],
    [Piano di Progetto],
    [Piano di Qualifica],
    [Analisi dei Requisiti],
    [Glossario],
    )  
  - Revisione delle pratiche di versionamento.
  - Revisione tracciamento delle modifiche. 
  - Revisione del sito web.
  - Studio degli strumenti offerti da GitHub, al fine di sfruttare le funzionalità utili della piattaforma.
  - Primo incontro con la proponente, *BlueWind*.
  - Ricerca di standard.
  - Raffinamento del workflow.  
  ===== Rischi attesi




  ===== Rischi incontrati



  ===== Preventivo
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  }
  else{
    1pt + black
  },
  align: (x, y) => (
    if y == 0 {center+horizon }
    else { left }
  ),
  fill:(x,y)=>{
    if calc.odd(y){
      luma(90%)
    }
  }
)

#let preventivo

  #show table.cell.where(y:0):header=>{

    align(center+bottom)[#rotate(header,360deg-45deg, reflow:true)]

  }
  #figure(caption:"Preventivo Sprint 1")[
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  [Davide Lorenzon],[Responsabile],[1],
  [Ana Maria Draghici],[Analista],[1],
  [Felician Mario Necsulescu],[Verificatore],[1],
  [Davide Testolin],[Verificatore],[1],
  [Filippo Guerra],[Amministratore],[1],
  [Aldo Bettega ],[Amministratore],[1],
  )]


  ===== Consuntivo
  #figure(caption:"Consuntivo Sprint 1")[
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  [Davide Lorenzon],[Responsabile],[1],
  [Ana Maria Draghici],[Analista],[1],
  [Felician Mario Necsulescu],[Verificatore],[1],
  [Davide Testolin],[Verificatore],[1],
  [Filippo Guerra],[Amministratore],[1],
  [Aldo Bettega ],[Amministratore],[1],
  )]

  ===== Retrospettiva


    ==== Sprint 2
  #grid( columns: 2, inset:0.7em,
    [Inizio:],[2025-11-26],
    [Fine prevista:],[],
    [Fine reale:],[],
    [Ritardo:],[],
    )
  ===== Attività da svolgere

  ===== Rischi attesi




  ===== Rischi incontrati



  ===== Preventivo
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  }
  else{
    1pt + black
  },
  align: (x, y) => (
    if y == 0 {center+horizon }
    else { left }
  ),
  fill:(x,y)=>{
    if calc.odd(y){
      luma(90%)
    }
  }
)

#figure(caption:"Preventivo Sprint 2")[
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  [Davide Lorenzon],[Verificatore],[],
  [Ana Maria Draghici],[Amministratrice],[],
  [Felician Mario Necsulescu],[Analista],[],
  [Davide Testolin],[Analista],[],
  [Filippo Guerra],[Responsabile],[],
  [Aldo Bettega ],[Verificatore],[],
  )]


  ===== Consuntivo
  #table(columns: (1fr,1fr,auto),
  [Persona],[Ruolo],[Ore],
  [Davide Lorenzon],[Verificatore],[],
  [Ana Maria Draghici],[Amministratrice],[],
  [Felician Mario Necsulescu],[Analista],[],
  [Davide Testolin],[Analista],[],
  [Filippo Guerra],[Responsabile],[],
  [Aldo Bettega ],[Verificatore],[],
  )

  ===== Retrospettiva