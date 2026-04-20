#import "/src/config.typ": inserisciLink, template_dir
#import "/src/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ": versionNumber

== Scopo del documento
Nell'ambito dei progetti di sviluppo software,
al fine di garantire il raggiungimento di  obiettivi di efficacia ed efficienza,
è fondamentale predisporre un documento che consenta alle parti interessate di allineare il
proprio lavoro, coordinarsi e monitorare lo stato di avanzamento del progetto.

Tale documento definisce l'ambito del progetto e specifica quali sono le attività
necessarie per il suo sviluppo. Inoltre, fornisce informazioni dettagliate sulle ore di lavoro dedicate a ciascuna attività e sui relativi costi.

In particolare, il documento analizza i seguenti temi:
#pad(left: 1em)[
  - Analisi dei rischi
  - Pianificazione delle attività
  - Stima dei costi e delle risorse necessarie allo sviluppo del progetto
]


== Aggiornamento del documento
Il presente documento è soggetto a revisioni periodiche durante tutto il ciclo di vita del progetto. Le modifiche possono essere proposte da:

- Team di sviluppo: in caso di ambiguità o necessità di chiarimenti tecnici
- Azienda proponente: per integrazioni o modifiche ai requisiti

Le modifiche sostanziali ai requisiti comportano l'incremento della versione principale (es. da 1.0.0 a 2.0.0), mentre chiarimenti incrementano la versione secondaria (es. da 1.0.0 a 1.1.0). La correzione ortografica o di parti errate relative a una versione secondaria incrementerà la versione terziaria (es. da 1.1.0 a 1.1.1).\


== Riferimenti

=== Riferimenti normativi
#pad(left: 1em)[
  - #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v" + versionNumber + ".pdf",
    )[Norme di Progetto];\
  - #inserisciLink(
      url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf",
    )[Slide del corso di Ingegneria del Software A.A.2025/2026 - Regolamento del progetto didattico]; \
  - #inserisciLink(
      url: "https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf",
    )[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \
]
=== Riferimenti informativi
#pad(left: 1em)[
  - #inserisciLink(
      url: "https://grouprubberduck.github.io/Documentazione/output/RTB/DocumentazioneInterna/Glossario.pdf",
    )[Glossario]; \
  - #inserisciLink(
      url: "https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf",
    )[Diagrammi dei casi d'uso]; \
  - #inserisciLink(
      url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf",
    )[Slide del corso di Ingegneria del Software A.A. 2025/2026 - Analisi dei requisiti ];\
  - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali interni]; \
  - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/")[Verbali esterni]; \
]
