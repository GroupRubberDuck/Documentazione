#import "/src/config.typ":template_dir
#import template_dir + "/PdQ/tabellaMetriche.typ": tabellaMetriche

  La qualità del prodotto software rappresenta la capacità del sistema di soddisfare in maniera oggettiva i requisiti funzionali e non funzionali, gli standard tecnici e le aspettative degli stakeholder. Essa costituisce la misura della conformità del prodotto agli obiettivi prefissati e della sua idoneità all’uso previsto, risultando direttamente dalla corretta applicazione dei processi di sviluppo e delle attività di verifica e validazione.
  Un prodotto software di elevata qualità si distingue per: adeguatezza funzionale, affidabilità, usabilità, efficienza delle prestazioni, manutenibilità.
  

== Funzionalità
Valuta la capacità del software di fornire correttamente le funzionalità richieste dai requisiti, assicurando completezza e coerenza rispetto alle specifiche definite.

#tabellaMetriche((
  (codice: "MPD-01",
    nome: "Requisiti obbligatori soddisfatti",
    accettabile: $100 percent$,
    preferibile: $100 percent$
  ),
  ( codice: "MPD-02",
    nome: "Requisiti desiderabili soddisfatti",
    accettabile: $>= 50 percent$,
    preferibile: $100 percent$
  ),
  (codice: "MPD-03",
    nome: "Requisiti opzionali soddisfatti",
    accettabile: $>= 0 percent$,
    preferibile: $>= 75 percent$
  ),
),[Metriche funzionalità del prodotto])

== Affidabilità
Misura la capacità del software di operare senza guasti in condizioni previste, garantendo comportamenti consistenti e riducendo al minimo malfunzionamenti.

#tabellaMetriche((
  (codice: "MPD-04",
    nome: "Failure Density",
    accettabile: $<= 50 percent$,
    preferibile: $<= 20 percent$
  ),
  (codice: "MPD-05",
    nome: "Statement Coverage",
    accettabile: $>= 80 percent$,
    preferibile: $>= 95 percent$
  ),
  (codice: "MPD-06",
    nome: "Branch Coverage",
    accettabile: $>= 70 percent$,
    preferibile: $>= 90 percent$
  ),
),[Metriche affidabilità del prodotto])

== Usabilità
Rileva quanto il software sia intuitivo e facile da utilizzare, considerando la semplicità delle interazioni, la facilità di apprendimento e la correttezza delle operazioni da parte degli utenti.

#tabellaMetriche((
  (codice: "MPD-07",
    nome: "User Error Rate",
    accettabile: $<= 3 percent$,
    preferibile: $<= 1 percent$
  ),
  (codice: "MPD-08",
    nome: "Time to Complete Task",
    accettabile: "TODO",
    preferibile: "TODO"
  ),
),[Metriche usabilità del prodotto])

== Efficienza 
Indica l’ottimizzazione delle risorse e la rapidità di risposta del software alle richieste, valutando tempi di esecuzione, throughput e utilizzo delle risorse disponibili.

#tabellaMetriche((
  (codice: "MPD-09",
    nome: "Response Time",
    accettabile: $<= 2 sec$,
    preferibile: $<= 1 sec$
  ),
  (codice: "MPD-10",
    nome: "CPU Utilization",
    accettabile: $<= 75%$,
    preferibile: $<= 60%$
  ),
  (codice: "MPD-11",
    nome: "Memory Utilization",
    accettabile: $<= 4,0 "GB"$,
    preferibile: $<= 1,5 "GB"$
  ),
),[Metriche efficienza del prodotto #footnote()[
  Qualsiasi metrica percentuale interna a questa sezione ha un termine di paragone assoluto.

  // L'utilizzo di percentuali senza un riferimento in questa sezione è paragonare al condividere un sito web girando il link localhost:8080
]])

== Manutenibilità
Misura quanto facilmente il software può essere modificato o esteso senza introdurre errori, tenendo conto della complessità del codice, della modularità e della facilità di intervento sugli artefatti.

#tabellaMetriche((
  (codice: "MPD-12",
    nome: "Cyclomatic Complexity",
    accettabile: $<= 10$,
    preferibile: $<= 8$
  ),
  (codice: "MPD-13",
    nome: "Instability Index",
    accettabile: [$I>= 0.7 $\ $or $ \ $I<=0,30$],
    preferibile: [$I>= 0.85 $\ $or $\ $I<=0,15$],
  ),
  (codice: "MPD-14",
    nome: "Coefficient of Coupling",
    accettabile: $<= 0.4$,
    preferibile: $<= 0.2$
  ),
  (codice: "MPD-15",
    nome: "Code Smells",
    accettabile: $<= 10$ ,
    preferibile: $<= 5$ 
  ),
),[Metriche manutenibilità del prodotto])