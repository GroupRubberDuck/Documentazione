#import "/src/config.typ": inserisciLink, template_dir
#import "/src/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ": versionNumber

== Scopo del documento

Il presente documento descrive le modalità di installazione, configurazione e utilizzo dell'applicazione, fornendo all'utente tutte le istruzioni necessarie per garantirne il corretto funzionamento. Sono inclusi i prerequisiti di sistema, la procedura di installazione in locale e la guida alle funzionalità operative.

== Scopo del prodotto

Il progetto ha lo scopo di realizzare un'applicazione per il suppordo dell'utente nel processo di verifica dei dispositivi alla normativa tecnica EN 18031, standard armonizzato per la Direttiva RED (2014/53/UE), obbligatorio a partire dal 1° agosto 2025 per tutti i dispositivi radio immessi sul mercato dell'Unione Europea. L'applicazione guida l'utente nell'esecuzione dei Decision Tree associati ai requisiti della normativa, in particolare quelli relativi ai meccanismi di controllo degli accessi (ACM) e di autenticazione (AUM) definiti nella EN 18031-1, restituendo per ogni requisito un esito chiaro: Pass, Fail o Not Applicable.
L'applicazione consente inoltre di importare documenti descrittivi delle componenti di rete del caso da analizzare, di visualizzare e navigare i Decision Tree tramite una dashboard interattiva e di esportare i risultati ottenuti, con l'obiettivo di automatizzare e standardizzare un processo che, se eseguito manualmente, risulterebbe oneroso, soggetto a errori e difficilmente tracciabile.


== Glossario
Per garantire precisione terminologica senza appesantire la lettura, in questo documento i termini tecnici presenti nel Glossario sono segnalati con un pedice “G”, ad esempio: #pad(left: 1em)[
  termine#sub("G"): indica che il termine è definito nel Glossario e può essere consultato per chiarimenti.
]

Questo metodo consente di mantenere il testo chiaro e tecnicamente corretto, permettendo al lettore di riferirsi al Glossario solo quando necessario, senza interrompere il flusso della lettura.


== Riferimenti

=== Riferimenti normativi
#pad(left: 1em)[
  - #inserisciLink(url: "https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[Capitolato d'appalto C1 - Automated EN18031 Compliance Verification]; \ _Ultima consultazione: 11 novembre 2025_; \
  - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto-v" + versionNumber + ".pdf")[Norme di Progetto]; \ _Ultima consultazione: 11 novembre 2025_; \
  - #inserisciLink(url: "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[Slide del corso di Ingegneria del Software A.A.2025/2026 - Regolamento del progetto didattico]; \ _Ultima consultazione: 11 novembre 2025_; \
]
=== Riferimenti informativi
#pad(left: 1em)[
  - #inserisciLink(url: "https://grouprubberduck.github.io/Documentazione/output/PB/DocumentazioneInterna/Glossario.pdf")[Glossario]; \ _Ultima consultazione: 13 aprile 2026_; \
]
