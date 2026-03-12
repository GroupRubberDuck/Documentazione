#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche

 == Processi primari
  I processi primari riguardano le attività di sviluppo del software, come requisiti, progettazione, implementazione, integrazione e manutenzione. Per valutarne andamento ed efficacia si utilizzano metriche di processo che permettono di monitorare tempi, costi e progressi, evidenziando eventuali scostamenti rispetto agli obiettivi.

 === Fornitura

#tabellaMetriche((
  (codice: "MPC-01",
  nome: "Planned Value (PV)", 
  accettabile: $>=0$, 
  preferibile: $<="BAC"$),

  (codice: "MPC-02",
  nome: "Earned Value (EV)", 
  accettabile: $>="PV"*0.75$, 
  preferibile: $>="PV"$ ),

  (codice: "MPC-03",
  nome: "Actual Cost (AC)", 
  accettabile: $0<= "AC" <= 1.2*"EV" $, 
  preferibile: "<= EV"),

  (codice: "MPC-04",
  nome: "Schedule Performance Index (SPI = EV / PV)",
  accettabile: $>= 0.9$, 
  preferibile: $>= 1.0$),

  (codice: "MPC-05",
  nome: "Cost Performance Index (CPI = EV / AC)", 
  accettabile: $>= 0.9$, 
  preferibile: $>= 1.0$),

  (codice: "MPC-06",
  nome: "Estimate at Completion (EAC)", 
   accettabile: $<= 1.1*"BAC"$, 
   preferibile: $<= "BAC"$),

  (codice: "MPC-07",
  nome: "To Complete Performance Index (TCPI)", 
  accettabile: $tilde 1.0$, 
  preferibile: $<= 1.0$),

  (codice: "MPC-08",
  nome: "Estimate to Complete (ETC)", 
  accettabile: $<= ("BAC"-"AC")*1.1$, 
  preferibile: $<= "BAC"-"AC"$),
),[Metriche processo di Fornitura])

#include "MPC/01-planned_value.typ"
#include "MPC/02-earned_value.typ"
#include "MPC/03-actual_cost.typ"
#include "MPC/04-schedule_performance_index.typ"
#include "MPC/05-cost_performance_index.typ"
#include "MPC/06-estimate_at_completion.typ"
#include "MPC/07-to_complete_performance_index.typ"
#include "MPC/08-estimate_to_complete.typ"


 === Sviluppo

#tabellaMetriche((
  (codice: "MPC-09",
    nome: "Requirements Stability Index (RSI)",
    accettabile: $>= 0.7$,
    preferibile: $1.0$
  ),
),[Metriche processo di Sviluppo])


#include "MPC/09-requirements_stability.typ"

  == Processi di supporto
 Questi includono attività che garantiscono controllo, tracciabilità e affidabilità del processo stesso, come la verifica, la validazione, la gestione della configurazione, la documentazione tecnica e l’assicurazione qualità. Questi processi consentono di monitorare e ridurre gli scostamenti rispetto agli standard pianificati. Le metriche associate ai processi di supporto sono definite per consentire una valutazione oggettiva della conformità e del controllo delle attività di supporto rispetto ai processi e alle procedure stabilite.
  
  === Documentazione
  #tabellaMetriche((
  (codice: "MPC-10",
    nome: "Indice di Gulpease",
    accettabile:$>= 60$,
    preferibile: $>= 70$
  ),
  (codice: "MPC-11",
    nome: "Correttezza ortografica",
    accettabile: $<= 0.01$,
    preferibile: $=0$
  ),
  ),[Metriche processo di Documentazione])
#include "MPC/10-indice_gulpease.typ"
#include "MPC/11-correttezza_ortografica.typ"

  === Verifica 

  #tabellaMetriche((
  (codice: "MPC-12",
    nome: "Test Success Rate",
    accettabile: $>= 90 percent$,
    preferibile: $100 percent$
  ),
  (codice: "MPC-13",
    nome: "Code Coverage",
    accettabile: $>= 80 percent$,
    preferibile: $>= 90 percent$
  ),
  ),[Metriche processo di Verifica])

#include "MPC/12-test_success_rate.typ"
#include "MPC/13-code_coverage.typ"

  == Processi organizzativi
  Riguardano il miglioramento continuo del processo, la definizione degli standard interni, la gestione della qualità complessiva e lo sviluppo delle competenze del personale. Questi processi assicurano la sostenibilità e la maturità del modello di sviluppo nel tempo. Le metriche associate ai processi organizzativi sono definite per consentire una valutazione oggettiva della conformità e dell’efficacia dei processi di gestione e governance interna.


  === Gestione dei processi
  #tabellaMetriche((
    (codice: "MPC-14",
    nome: "Time Efficiency",
    accettabile: $>= 80 percent$,
    preferibile: $>= 100 percent$
    ),
    (codice: "MPC-15",
     nome: "Task Completion on Time",
     accettabile: $>= 90 percent$,
     preferibile: $=100 percent$
    ),
 ),[Metriche processo di Gestione dei Processi ])

#include "MPC/14-time-efficiency.typ"
#include "MPC/15-task_completion_on_time.typ"


