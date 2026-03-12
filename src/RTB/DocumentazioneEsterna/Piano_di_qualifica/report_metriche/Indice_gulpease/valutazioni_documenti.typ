#import "/src/config.typ":template_dir
#import template_dir+"/indiceGulpease/indiceGulpease.typ":compute_gulpease,display_gulpease
#import template_dir+"/indiceGulpease/textExtractor.typ":show_smart_text

// Dizionario nome documento: percorso
#let listaDocumenti=(
"Norme di progetto":"/src/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ",
"Piano di progetto":"/src/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto.typ",
"Piano di qualifica":"/src/RTB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica.typ",
)
#let risultati=()

#for key in listaDocumenti.keys(){
  let risultato=compute_gulpease(include listaDocumenti.at(key))
  display_gulpease(risultato, nomeDocumento:key)

  risultati.push((nomeDocumento:risultato.valore))
}


#metadata(risultati)<risultati>
 #let prova=include template_dir+"/indiceGulpease/Gulpease_info.typ"

 #display_gulpease(compute_gulpease(prova))

 #show_smart_text(prova)