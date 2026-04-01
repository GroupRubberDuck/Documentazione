#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche
#import "MPC/config/deps.typ" as deps
 == Processi primari
  I processi primari riguardano le attività di sviluppo del software, come requisiti, progettazione, implementazione, integrazione e manutenzione. Per valutarne andamento ed efficacia si utilizzano metriche di processo che permettono di monitorare tempi, costi e progressi, evidenziando eventuali scostamenti rispetto agli obiettivi.

 === Fornitura
#let Fornitura=(
"Planned Value",
"Earned Value",
"Actual Cost",
"Schedule Performance Index",
"Cost Performance Index",
"Estimate at Completion",
"To Complete Performance Index",
"Estimate to Complete"
)


#let metriche=()
#for metric in Fornitura{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPC-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}

#tabellaMetriche((
..metriche
),[Metriche processo di Fornitura])

#for metric in Fornitura{
  include deps.get-metrica-path(metric)
}


 === Sviluppo
#let Sviluppo=(
"Requirements Stability Index",

)
#let metriche=()
#for metric in Sviluppo{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPC-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}

#tabellaMetriche((
..metriche
),[Metriche processo di Sviluppo])


#for metric in Sviluppo{
  include deps.get-metrica-path(metric)
}


  == Processi di supporto
 Questi includono attività che garantiscono controllo, tracciabilità e affidabilità del processo stesso, come la verifica, la validazione, la gestione della configurazione, la documentazione tecnica e l’assicurazione qualità. Questi processi consentono di monitorare e ridurre gli scostamenti rispetto agli standard pianificati. Le metriche associate ai processi di supporto sono definite per consentire una valutazione oggettiva della conformità e del controllo delle attività di supporto rispetto ai processi e alle procedure stabilite.
  
  === Documentazione

  #let Documentazione=(
"Indice di Gulpease",
"Correttezza ortografica",
  )
#let metriche=()
#for metric in Documentazione{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPC-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}

#tabellaMetriche((
..metriche
),[Metriche processo di Documentazione])

#for metric in Documentazione{
  include deps.get-metrica-path(metric)
}

  === Verifica 

  #let Verifica=(
"Test Success Rate",
  )

#let metriche=()
#for metric in Verifica{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPC-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}

#tabellaMetriche((
..metriche
),[Metriche processo di Verifica])

#for metric in Verifica{
  include deps.get-metrica-path(metric)
}

  == Processi organizzativi
  Riguardano il miglioramento continuo del processo, la definizione degli standard interni, la gestione della qualità complessiva e lo sviluppo delle competenze del personale. Questi processi assicurano la sostenibilità e la maturità del modello di sviluppo nel tempo. Le metriche associate ai processi organizzativi sono definite per consentire una valutazione oggettiva della conformità e dell’efficacia dei processi di gestione e governance interna.


  === Gestione dei processi
  #let gestioneProcessi=(
"Time Efficiency",
"Process Lead Time",
  )


#let metriche=()
#for metric in gestioneProcessi{

  import deps.get-metrica-path(metric):dati



metriche.push((

  codice:deps.get-MPC-code(metric),
  nome:metric,
  accettabile:dati.accettabile,
  preferibile:dati.preferibile,
)
)
}
#tabellaMetriche((
..metriche
),[Metriche processo di Gestione dei Processi ])

#for metric in gestioneProcessi{
  include deps.get-metrica-path(metric)
}