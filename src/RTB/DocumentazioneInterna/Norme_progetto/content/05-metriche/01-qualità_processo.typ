#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche

 == Processi primari
  I processi primari riguardano le attività di sviluppo del software, come requisiti, progettazione, implementazione, integrazione e manutenzione. Per valutarne andamento ed efficacia si utilizzano metriche di processo che permettono di monitorare tempi, costi e progressi, evidenziando eventuali scostamenti rispetto agli obiettivi.

 === Fornitura

#tabellaMetriche((
  (codice: "MPC-01",
  nome: "Planned Value (PV)", 
  accettabile: ">=0", 
  preferibile: "<=BAC"),

  (codice: "MPC-02",
  nome: "Earned Value (EV)", 
  accettabile: ">=PV*0.75", 
  preferibile: ">=PV" ),

  (codice: "MPC-03",
  nome: "Actual Cost (AC)", 
  accettabile: "0<= AC <= 1.2*EV, ", 
  preferibile: "<= EV"),

  (codice: "MPC-04",
  nome: "Schedule Performance Index (SPI = EV / PV)",
  accettabile: ">= 0.9", 
  preferibile: ">= 1.0"),

  (codice: "MPC-05",
  nome: "Cost Performance Index (CPI = EV / AC)", 
  accettabile: ">= 0.9", 
  preferibile: ">= 1.0"),

  (codice: "MPC-06",
  nome: "Estimate at Completion (EAC)", 
   accettabile: "<= 1.1*BAC", 
   preferibile: "<= BAC"),

  (codice: "MPC-07",
  nome: "To Complete Performance Index (TCPI)", 
  accettabile: "~ 1.0", 
  preferibile: "<= 1.0"),

  (codice: "MPC-08",
  nome: "Estimate to Complete (ETC)", 
  accettabile: "<= (BAC-AC)*1.1", 
  preferibile: "<= BAC-AC"),
),[Metriche processo di Fornitura])

 === Sviluppo

#tabellaMetriche((
  (codice: "MPC-09",
    nome: "Requirements Stability Index (RSI)",
    accettabile: ">= 0.7",
    preferibile: "1.0"
  ),
  (codice: "MPC-10",
    nome: "Requirements Coverage",
    accettabile: ">= 90%",
    preferibile: "100%"
  ),
),[Metriche processo di Sviluppo])



  == Processi di supporto
 Questi includono attività che garantiscono controllo, tracciabilità e affidabilità del processo stesso, come la verifica, la validazione, la gestione della configurazione, la documentazione tecnica e l’assicurazione qualità. Questi processi consentono di monitorare e ridurre gli scostamenti rispetto agli standard pianificati. Le metriche associate ai processi di supporto sono definite per consentire una valutazione oggettiva della conformità e del controllo delle attività di supporto rispetto ai processi e alle procedure stabilite.
  
  === Documentazione
  #tabellaMetriche((
  (codice: "MPC-11",
    nome: "Indice di Gulpease",
    accettabile: ">= 60",
    preferibile: ">= 70"
  ),
  (codice: "MPC-12",
    nome: "Correttezza ortografica",
    accettabile: "<= 0.01",
    preferibile: "0"
  ),
  ),[Metriche processo di Documentazione])

  === Verifica 

  #tabellaMetriche((
  (codice: "MPC-13",
    nome: "Test Success Rate",
    accettabile: ">= 90%",
    preferibile: "100%"
  ),
  (codice: "MPC-14",
    nome: "Code Coverage",
    accettabile: ">= 80%",
    preferibile: "100%"
  ),
  ),[Metriche processo di Verifica])


  == Processi organizzativi
  Riguardano il miglioramento continuo del processo, la definizione degli standard interni, la gestione della qualità complessiva e lo sviluppo delle competenze del personale. Questi processi assicurano la sostenibilità e la maturità del modello di sviluppo nel tempo. Le metriche associate ai processi organizzativi sono definite per consentire una valutazione oggettiva della conformità e dell’efficacia dei processi di gestione e governance interna.


  === Gestione dei processi
  #tabellaMetriche((
    (codice: "MPC-15",
    nome: "Process Lead Time",
    accettabile: "~ time planned",
    preferibile: "<= time planned"
    ),
    (codice: "MPC-16",
     nome: "Task Completion on Time",
     accettabile: ">= 80%",
     preferibile: "100%"
    ),
 ),[Metriche processo di Gestione dei Processi ])