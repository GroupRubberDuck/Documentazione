#import "../TypstTemplate/diarioTemplate.typ": slides
#import "/src/config.typ": *

#show: slides.with(
  numero: 16,
  data: "2026-05-06",
)

= Attività completate
#set list(marker: image(check_icon, width: 0.8em))
- Conclusione della codifica della parte complessa del dominio.
- Incontro di validazione con l'azienda (05/05) e definizione requisiti manuale utente.
- Allineamento termini e diciture della Specifica Tecnica.
- Selezione e ottimizzazione delle metriche nel Piano di Qualifica (PdQ).
- Definizione dei diagrammi delle classi e dei design pattern principali.

= Attività da completare
#set list(marker: image(clessidra_icon, width: 0.7em))
- Completamento sviluppo componenti backend (requisiti obbligatori).
- Sviluppo incrementale dei test e monitoraggio del PdQ.
- Raffinamento e scomposizione della Specifica Tecnica (allineamento continuo al codice).
- Inizio stesura del Manuale Utente (focus su metodi e pagine principali).
