#let src_dir = "/src"
#let template_dir = src_dir + "/TypstTemplate"
#let images_dir = src_dir + "/Images"

#let front_page_file = template_dir + "/frontPage.typ"
#let setup_layout_file = template_dir + "/setUpPageLayout.typ"

#let logo_unipd = images_dir + "/logo_Unipd.png"
#let logo_rd = images_dir + "/logoRD.jpg"
#let clessidra_icon = images_dir + "/clessidra.png"
#let check_icon = images_dir + "/check.png"

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
