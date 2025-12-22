#import "/src/config.typ":template_dir
#import template_dir+"/indiceGulpease/indiceGulpease.typ":compute_gulpease,display_gulpease
#import template_dir+"/indiceGulpease/textExtractor.typ":show_smart_text

// Dizionario nome documento: percorso
#let listaDocumenti=(
"Norme di progetto":"/src/RTB/DocumentazioneInterna/Norme_progetto/Norme_progetto.typ",
"Piano di progetto":"/src/RTB/DocumentazioneEsterna/Piano_di_Progetto/Piano_di_progetto.typ",
"Piano di qualità":"/src/RTB/DocumentazioneEsterna/Piano_di_qualifica/Piano_di_qualifica.typ",
"Analisi dei requisiti":"/src/RTB/DocumentazioneEsterna/Analisi_dei_Requisiti/Analisi_dei_requisiti.typ",
)


#for key in listaDocumenti.keys(){
  display_gulpease(compute_gulpease(include listaDocumenti.at(key)), nomeDocumento:key)
}



#let prova=include template_dir+"/indiceGulpease/Gulpease_info.typ"

#display_gulpease(compute_gulpease(prova))

#show_smart_text(prova)