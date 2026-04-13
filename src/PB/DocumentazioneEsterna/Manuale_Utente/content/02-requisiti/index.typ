#import "/src/config.typ": *
#import template_dir + "/MU/tabellaRequisiti.typ": tabellaRequisiti

Per il corretto funzionamento dell'applicazione è necessario che siano rispettati alcuni requisiti minimi.

== Requisiti hardware

I requisiti hardware per l'installazione e l'esecuzione dell'applicazione sono i seguenti:

#figure(caption: "Requisiti hardware")[
  #tabellaRequisiti(
    header1: "Componente",
    header2: "Requisito minimo",
    (
      "CPU",
      "4 core CPU (2.0 GHz o superiore)",
      "RAM",
      "2 GB o superiore",
      "Storage",
      "1 GB di spazio libero o superiore",
    ),
  )
]

== Requisiti software

Per quanto riguarda il sistema operativo non esiste un particolare requisito, in quanto l'applicazione utilizza il sistema di virtualizzazione Docker per l'esecuzione.

I requisiti software per il corretto funzionamento dell'applicazione sono i seguenti:
#figure(caption: "Requisiti software")[
  #tabellaRequisiti(
    header1: "Software",
    header2: "Versione minima",
    ("Docker", "29.4.0", "Docker Compose", "5.1.2", "Python", "3.14.4", "MongoDB", "7.0"),
  )
]

== Requisiti browser

I requisiti browser definiscono la versione minima necessaria per assicurare la corretta visualizzazione e fruizione dell'applicazione per i seguenti web browser:

#figure(caption: "Requisiti browser")[
  #tabellaRequisiti(
    header1: "Browser",
    header2: "Versione minima",
    ("Google Chrome", "148", "Mozilla Firefox", "149", "Microsoft Edge", "147", "Safari", "26"),
  )
]
