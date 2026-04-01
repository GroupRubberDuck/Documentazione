#import "config/deps.typ" as deps

#let test-array=()



#import "Ta01_importazione_documento_dispositivo.typ": data as item_0


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_0.nome),
    item_0.descrizione,
    item_0.stato,
  )
  )
}

#import "Ta02_creazione_documento_dispositivo.typ": data as item_1


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_1.nome),
    item_1.descrizione,
    item_1.stato,
  )
  )
}

#import "Ta03_gestione_informazioni_dispositivo.typ": data as item_2


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_2.nome),
    item_2.descrizione,
    item_2.stato,
  )
  )
}

#import "Ta04_esecuzione_della_valutazione.typ": data as item_3


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_3.nome),
    item_3.descrizione,
    item_3.stato,
  )
  )
}

#import "Ta05_rispetto_delle_gerarchia_dello_standard.typ": data as item_4


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_4.nome),
    item_4.descrizione,
    item_4.stato,
  )
  )
}

#import "Ta06_visualizzazione_dashboard.typ": data as item_5


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_5.nome),
    item_5.descrizione,
    item_5.stato,
  )
  )
}

#import "Ta07_visualizzazione_asset.typ": data as item_6


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_6.nome),
    item_6.descrizione,
    item_6.stato,
  )
  )
}

#import "Ta08_valuta_asset.typ": data as item_7


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_7.nome),
    item_7.descrizione,
    item_7.stato,
  )
  )
}

#import "Ta09_visualizzazione_requisiti.typ": data as item_8


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_8.nome),
    item_8.descrizione,
    item_8.stato,
  )
  )
}

#import "Ta10_compila_decision_tree.typ": data as item_9


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_9.nome),
    item_9.descrizione,
    item_9.stato,
  )
  )
}

#import "Ta11_esportazione_documento_dispositivo.typ": data as item_10


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_10.nome),
    item_10.descrizione,
    item_10.stato,
  )
  )
}

#import "Ta12_esportazione_report.typ": data as item_11


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_11.nome),
    item_11.descrizione,
    item_11.stato,
  )
  )
}


#figure(caption:" Test di Accettazione")[
#deps.tabella-test(..(test-array).flatten())

]

