#let src_dir = "/src"
#let template_dir = src_dir + "/TypstTemplate"
#let images_dir = src_dir + "/assets/Images"
#let glossario = "/src/RTB/DocumentazioneInterna/dizionario.typ"

#let front_page_file = template_dir + "/frontPage.typ"
#let setup_layout_file = template_dir + "/setUpPageLayout.typ"

#let logo_unipd = images_dir + "/logo_Unipd.png"
#let logo_rd = images_dir + "/logoRD.jpg"
#let clessidra_icon = images_dir + "/clessidra.png"
#let check_icon = images_dir + "/check.png"
#let danger_icon = images_dir + "/danger_icon.webp"
#let question_mark_icon = images_dir + "/question_mark_icon.png"

#let flagMarcaturaAutoamticaTerminiGlossario=false


#let enfasi(doc) = {
  align()[
    #set text(weight: "bold", size: 14pt)
    #doc
  ]
}

#let inserisciLink(url:str,testo)={
  underline()[
    #set text(fill:blue)
    #link(url)[#testo]
  ]
}
#show ref: riferimento=>{
  strong(riferimento)
}