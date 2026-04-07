#import "/src/config.typ": template_dir
#import template_dir + "/indiceGulpease/indiceGulpease.typ": compute_gulpease, display_gulpease
#import template_dir + "/indiceGulpease/textExtractor.typ": show_smart_text

// Dizionario nome documento: percorso
#let listaDocumenti = (
  "Norme di progetto": "/src/PB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ",
  "Piano di progetto": "/src/PB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto.typ",

"Piano di qualifica": "/src/PB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica.typ",
"Analisi dei Requisiti": "/src/PB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti.typ",


)

#let risultati = ()

#for key in listaDocumenti.keys() {
  let risultato = compute_gulpease(include listaDocumenti.at(key))
  display_gulpease(risultato, nomeDocumento: key)
  risultati.push((nomeDocumento: risultato.valore))
}

#metadata(risultati)<risultati>



Misura la leggibilità dei documenti prodotti in base a lunghezza delle frasi e delle parole. Serve a garantire che la documentazione sia comprensibile per il pubblico di riferimento. Ottimale: > 60 per lettori con diploma, > 80 per lettori con licenza media.


