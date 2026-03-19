#import "config/deps.typ" as deps

#let test-array=()



#import "TS001_visualizzazione_lista_dispositivi.typ": data as item_0


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_0.nome),
    item_0.descrizione,
    item_0.requisito-riferimento,
    item_0.stato,
  )
  )
}

#import "TS002_visualizzazione_elemento_lista_dispositivi.typ": data as item_1


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_1.nome),
    item_1.descrizione,
    item_1.requisito-riferimento,
    item_1.stato,
  )
  )
}

#import "TS003_visualizzazione_nome_dispositivo_in_lista.typ": data as item_2


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_2.nome),
    item_2.descrizione,
    item_2.requisito-riferimento,
    item_2.stato,
  )
  )
}

#import "TS004_inserimento_nuovo_dispositivo.typ": data as item_3


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_3.nome),
    item_3.descrizione,
    item_3.requisito-riferimento,
    item_3.stato,
  )
  )
}

#import "TS005_creazione_manuale_dispositivo.typ": data as item_4


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_4.nome),
    item_4.descrizione,
    item_4.requisito-riferimento,
    item_4.stato,
  )
  )
}

#import "TS006_inserimento_nome_dispositivo.typ": data as item_5


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_5.nome),
    item_5.descrizione,
    item_5.requisito-riferimento,
    item_5.stato,
  )
  )
}

#import "TS007_errore_nome_dispositivo_non_valido.typ": data as item_6


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_6.nome),
    item_6.descrizione,
    item_6.requisito-riferimento,
    item_6.stato,
  )
  )
}

#import "TS008_inserimento_sistema_operativo_dispositivo.typ": data as item_7


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_7.nome),
    item_7.descrizione,
    item_7.requisito-riferimento,
    item_7.stato,
  )
  )
}

#import "TS009_inserimento_descrizione_dispositivo.typ": data as item_8


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_8.nome),
    item_8.descrizione,
    item_8.requisito-riferimento,
    item_8.stato,
  )
  )
}

#import "TS010_annullamento_inserimento_dispositivo.typ": data as item_9


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_9.nome),
    item_9.descrizione,
    item_9.requisito-riferimento,
    item_9.stato,
  )
  )
}

#import "TS011_importazione_dispositivo_da_file.typ": data as item_10


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_10.nome),
    item_10.descrizione,
    item_10.requisito-riferimento,
    item_10.stato,
  )
  )
}

#import "TS012_selezione_file_da_importare.typ": data as item_11


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_11.nome),
    item_11.descrizione,
    item_11.requisito-riferimento,
    item_11.stato,
  )
  )
}

#import "TS013_selezione_file_sorgente_json.typ": data as item_12


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_12.nome),
    item_12.descrizione,
    item_12.requisito-riferimento,
    item_12.stato,
  )
  )
}

#import "TS014_selezione_file_sorgente_xml.typ": data as item_13


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_13.nome),
    item_13.descrizione,
    item_13.requisito-riferimento,
    item_13.stato,
  )
  )
}

#import "TS015_selezione_file_sorgente_csv.typ": data as item_14


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_14.nome),
    item_14.descrizione,
    item_14.requisito-riferimento,
    item_14.stato,
  )
  )
}

#import "TS016_errore_file_dispositivo_non_valido_estensione.typ": data as item_15


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_15.nome),
    item_15.descrizione,
    item_15.requisito-riferimento,
    item_15.stato,
  )
  )
}

#import "TS017_errore_file_dispositivo_non_valido_struttura.typ": data as item_16


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_16.nome),
    item_16.descrizione,
    item_16.requisito-riferimento,
    item_16.stato,
  )
  )
}

#import "TS018_errore_file_dispositivo_non_valido_metadati.typ": data as item_17


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_17.nome),
    item_17.descrizione,
    item_17.requisito-riferimento,
    item_17.stato,
  )
  )
}

#import "TS019_visualizzazione_dati_dispositivo.typ": data as item_18


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_18.nome),
    item_18.descrizione,
    item_18.requisito-riferimento,
    item_18.stato,
  )
  )
}

#import "TS020_visualizzazione_nome_dispositivo.typ": data as item_19


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_19.nome),
    item_19.descrizione,
    item_19.requisito-riferimento,
    item_19.stato,
  )
  )
}

#import "TS021_visualizzazione_sistema_operativo_dispositivo.typ": data as item_20


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_20.nome),
    item_20.descrizione,
    item_20.requisito-riferimento,
    item_20.stato,
  )
  )
}

#import "TS022_visualizzazione_descrizione_dispositivo.typ": data as item_21


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_21.nome),
    item_21.descrizione,
    item_21.requisito-riferimento,
    item_21.stato,
  )
  )
}

#import "TS023_visualizzazione_modello_associato_al_dispositivo.typ": data as item_22


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_22.nome),
    item_22.descrizione,
    item_22.requisito-riferimento,
    item_22.stato,
  )
  )
}

#import "TS024_visualizzazione_nome_modello_associato.typ": data as item_23


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_23.nome),
    item_23.descrizione,
    item_23.requisito-riferimento,
    item_23.stato,
  )
  )
}

#import "TS025_visualizzazione_versione_modello_associato.typ": data as item_24


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_24.nome),
    item_24.descrizione,
    item_24.requisito-riferimento,
    item_24.stato,
  )
  )
}

#import "TS026_eliminazione_dispositivo.typ": data as item_25


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_25.nome),
    item_25.descrizione,
    item_25.requisito-riferimento,
    item_25.stato,
  )
  )
}

#import "TS027_eliminazione_dispositivo_diretta.typ": data as item_26


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_26.nome),
    item_26.descrizione,
    item_26.requisito-riferimento,
    item_26.stato,
  )
  )
}

#import "TS028_avvio_sessione_di_valutazione.typ": data as item_27


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_27.nome),
    item_27.descrizione,
    item_27.requisito-riferimento,
    item_27.stato,
  )
  )
}

#import "TS029_scarto_modifiche_valutazione.typ": data as item_28


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_28.nome),
    item_28.descrizione,
    item_28.requisito-riferimento,
    item_28.stato,
  )
  )
}

#import "TS030_salvataggio_valutazione.typ": data as item_29


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_29.nome),
    item_29.descrizione,
    item_29.requisito-riferimento,
    item_29.stato,
  )
  )
}

#import "TS031_salvataggio_e_chiusura_sessione_di_valutazione.typ": data as item_30


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_30.nome),
    item_30.descrizione,
    item_30.requisito-riferimento,
    item_30.stato,
  )
  )
}

#import "TS032_salvataggio_e_continuazione_sessione_di_valutazione.typ": data as item_31


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_31.nome),
    item_31.descrizione,
    item_31.requisito-riferimento,
    item_31.stato,
  )
  )
}

#import "TS033_errore_salvataggio_valutazione.typ": data as item_32


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_32.nome),
    item_32.descrizione,
    item_32.requisito-riferimento,
    item_32.stato,
  )
  )
}

#import "TS034_visualizzazione_dashboard_dispositivo.typ": data as item_33


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_33.nome),
    item_33.descrizione,
    item_33.requisito-riferimento,
    item_33.stato,
  )
  )
}

#import "TS035_visualizzazione_stato_aggregato_dispositivo.typ": data as item_34


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_34.nome),
    item_34.descrizione,
    item_34.requisito-riferimento,
    item_34.stato,
  )
  )
}

#import "TS036_esportazione_informazioni_dispositivo.typ": data as item_35


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_35.nome),
    item_35.descrizione,
    item_35.requisito-riferimento,
    item_35.stato,
  )
  )
}

#import "TS037_esportazione_informazioni_dispositivo_in_xml.typ": data as item_36


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_36.nome),
    item_36.descrizione,
    item_36.requisito-riferimento,
    item_36.stato,
  )
  )
}

#import "TS038_esportazione_informazioni_dispositivo_in_json.typ": data as item_37


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_37.nome),
    item_37.descrizione,
    item_37.requisito-riferimento,
    item_37.stato,
  )
  )
}

#import "TS039_esportazione_informazioni_dispositivo_in_csv.typ": data as item_38


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_38.nome),
    item_38.descrizione,
    item_38.requisito-riferimento,
    item_38.stato,
  )
  )
}

#import "TS040_aggiunta_asset.typ": data as item_39


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_39.nome),
    item_39.descrizione,
    item_39.requisito-riferimento,
    item_39.stato,
  )
  )
}

#import "TS041_inserimento_nome_asset.typ": data as item_40


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_40.nome),
    item_40.descrizione,
    item_40.requisito-riferimento,
    item_40.stato,
  )
  )
}

#import "TS042_selezione_tipo_asset.typ": data as item_41


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_41.nome),
    item_41.descrizione,
    item_41.requisito-riferimento,
    item_41.stato,
  )
  )
}

#import "TS043_selezione_security_asset.typ": data as item_42


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_42.nome),
    item_42.descrizione,
    item_42.requisito-riferimento,
    item_42.stato,
  )
  )
}

#import "TS044_selezione_network_asset.typ": data as item_43


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_43.nome),
    item_43.descrizione,
    item_43.requisito-riferimento,
    item_43.stato,
  )
  )
}

#import "TS045_inserimento_descrizione_asset.typ": data as item_44


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_44.nome),
    item_44.descrizione,
    item_44.requisito-riferimento,
    item_44.stato,
  )
  )
}

#import "TS046_errore_nome_asset_non_valido.typ": data as item_45


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_45.nome),
    item_45.descrizione,
    item_45.requisito-riferimento,
    item_45.stato,
  )
  )
}

#import "TS047_annullamento_aggiunta_asset.typ": data as item_46


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_46.nome),
    item_46.descrizione,
    item_46.requisito-riferimento,
    item_46.stato,
  )
  )
}

#import "TS048_visualizzazione_lista_asset.typ": data as item_47


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_47.nome),
    item_47.descrizione,
    item_47.requisito-riferimento,
    item_47.stato,
  )
  )
}

#import "TS049_visualizzazione_elemento_lista_asset.typ": data as item_48


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_48.nome),
    item_48.descrizione,
    item_48.requisito-riferimento,
    item_48.stato,
  )
  )
}

#import "TS050_visualizzazione_nome_asset.typ": data as item_49


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_49.nome),
    item_49.descrizione,
    item_49.requisito-riferimento,
    item_49.stato,
  )
  )
}

#import "TS051_visualizzazione_tipo_asset.typ": data as item_50


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_50.nome),
    item_50.descrizione,
    item_50.requisito-riferimento,
    item_50.stato,
  )
  )
}

#import "TS052_visualizzazione_stato_aggregato_asset.typ": data as item_51


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_51.nome),
    item_51.descrizione,
    item_51.requisito-riferimento,
    item_51.stato,
  )
  )
}

#import "TS053_visualizzazione_dettaglio_asset.typ": data as item_52


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_52.nome),
    item_52.descrizione,
    item_52.requisito-riferimento,
    item_52.stato,
  )
  )
}

#import "TS054_valuta_asset.typ": data as item_53


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_53.nome),
    item_53.descrizione,
    item_53.requisito-riferimento,
    item_53.stato,
  )
  )
}

#import "TS055_visualizzazione_descrizione_asset.typ": data as item_54


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_54.nome),
    item_54.descrizione,
    item_54.requisito-riferimento,
    item_54.stato,
  )
  )
}

#import "TS056_eliminazione_asset.typ": data as item_55


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_55.nome),
    item_55.descrizione,
    item_55.requisito-riferimento,
    item_55.stato,
  )
  )
}

#import "TS057_visualizzazione_lista_requisiti_asset.typ": data as item_56


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_56.nome),
    item_56.descrizione,
    item_56.requisito-riferimento,
    item_56.stato,
  )
  )
}

#import "TS058_visualizzazione_elemento_lista_requisiti_asset.typ": data as item_57


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_57.nome),
    item_57.descrizione,
    item_57.requisito-riferimento,
    item_57.stato,
  )
  )
}

#import "TS059_visualizzazione_codice_requisito.typ": data as item_58


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_58.nome),
    item_58.descrizione,
    item_58.requisito-riferimento,
    item_58.stato,
  )
  )
}

#import "TS060_visualizzazione_stato_valutazione_requisito.typ": data as item_59


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_59.nome),
    item_59.descrizione,
    item_59.requisito-riferimento,
    item_59.stato,
  )
  )
}

#import "TS061_visualizzazione_dettaglio_requisito.typ": data as item_60


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_60.nome),
    item_60.descrizione,
    item_60.requisito-riferimento,
    item_60.stato,
  )
  )
}

#import "TS062_visualizzazione_nome_requisito.typ": data as item_61


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_61.nome),
    item_61.descrizione,
    item_61.requisito-riferimento,
    item_61.stato,
  )
  )
}

#import "TS063_visualizzazione_descrizione_normativa_requisito.typ": data as item_62


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_62.nome),
    item_62.descrizione,
    item_62.requisito-riferimento,
    item_62.stato,
  )
  )
}

#import "TS064_visualizzazione_stato_pass_requisito.typ": data as item_63


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_63.nome),
    item_63.descrizione,
    item_63.requisito-riferimento,
    item_63.stato,
  )
  )
}

#import "TS065_visualizzazione_stato_fail_requisito.typ": data as item_64


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_64.nome),
    item_64.descrizione,
    item_64.requisito-riferimento,
    item_64.stato,
  )
  )
}

#import "TS066_visualizzazione_stato_na_requisito.typ": data as item_65


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_65.nome),
    item_65.descrizione,
    item_65.requisito-riferimento,
    item_65.stato,
  )
  )
}

#import "TS067_visualizzazione_stato_in_corso_requisito.typ": data as item_66


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_66.nome),
    item_66.descrizione,
    item_66.requisito-riferimento,
    item_66.stato,
  )
  )
}

#import "TS068_visualizzazione_stato_sospeso_requisito.typ": data as item_67


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_67.nome),
    item_67.descrizione,
    item_67.requisito-riferimento,
    item_67.stato,
  )
  )
}

#import "TS069_visualizzazione_lista_dipendenze_requisito.typ": data as item_68


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_68.nome),
    item_68.descrizione,
    item_68.requisito-riferimento,
    item_68.stato,
  )
  )
}

#import "TS070_visualizzazione_sintesi_dipendenza.typ": data as item_69


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_69.nome),
    item_69.descrizione,
    item_69.requisito-riferimento,
    item_69.stato,
  )
  )
}

#import "TS071_visualizzazione_codice_dipendenza.typ": data as item_70


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_70.nome),
    item_70.descrizione,
    item_70.requisito-riferimento,
    item_70.stato,
  )
  )
}

#import "TS072_visualizzazione_stato_dipendenza.typ": data as item_71


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_71.nome),
    item_71.descrizione,
    item_71.requisito-riferimento,
    item_71.stato,
  )
  )
}

#import "TS073_visualizzazione_decision_tree.typ": data as item_72


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_72.nome),
    item_72.descrizione,
    item_72.requisito-riferimento,
    item_72.stato,
  )
  )
}

#import "TS074_visualizzazione_nodo_decision_tree.typ": data as item_73


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_73.nome),
    item_73.descrizione,
    item_73.requisito-riferimento,
    item_73.stato,
  )
  )
}

#import "TS075_visualizzazione_stato_attività_nodo.typ": data as item_74


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_74.nome),
    item_74.descrizione,
    item_74.requisito-riferimento,
    item_74.stato,
  )
  )
}

#import "TS076_visualizzazione_nodo_di_decisione.typ": data as item_75


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_75.nome),
    item_75.descrizione,
    item_75.requisito-riferimento,
    item_75.stato,
  )
  )
}

#import "TS077_visualizzazione_codice_requisito_nodo.typ": data as item_76


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_76.nome),
    item_76.descrizione,
    item_76.requisito-riferimento,
    item_76.stato,
  )
  )
}

#import "TS078_visualizzazione_codice_nodo.typ": data as item_77


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_77.nome),
    item_77.descrizione,
    item_77.requisito-riferimento,
    item_77.stato,
  )
  )
}

#import "TS079_visualizzazione_domanda_nodo.typ": data as item_78


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_78.nome),
    item_78.descrizione,
    item_78.requisito-riferimento,
    item_78.stato,
  )
  )
}

#import "TS080_visualizzazione_risposta_nodo.typ": data as item_79


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_79.nome),
    item_79.descrizione,
    item_79.requisito-riferimento,
    item_79.stato,
  )
  )
}

#import "TS081_nessuna_risposta_associata_a_nodo.typ": data as item_80


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_80.nome),
    item_80.descrizione,
    item_80.requisito-riferimento,
    item_80.stato,
  )
  )
}

#import "TS082_visualizzazione_nodo_foglia.typ": data as item_81


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_81.nome),
    item_81.descrizione,
    item_81.requisito-riferimento,
    item_81.stato,
  )
  )
}

#import "TS083_visualizzazione_valore_nodo_foglia.typ": data as item_82


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_82.nome),
    item_82.descrizione,
    item_82.requisito-riferimento,
    item_82.stato,
  )
  )
}

#import "TS084_visualizzazione_giustificazione_decision_tree.typ": data as item_83


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_83.nome),
    item_83.descrizione,
    item_83.requisito-riferimento,
    item_83.stato,
  )
  )
}

#import "TS085_visualizzazione_dettaglio_nodo_decisionale.typ": data as item_84


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_84.nome),
    item_84.descrizione,
    item_84.requisito-riferimento,
    item_84.stato,
  )
  )
}

#import "TS086_visualizzazione_codice_requisito_a_dettaglio.typ": data as item_85


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_85.nome),
    item_85.descrizione,
    item_85.requisito-riferimento,
    item_85.stato,
  )
  )
}

#import "TS087_visualizzazione_codice_nodo_a_dettaglio.typ": data as item_86


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_86.nome),
    item_86.descrizione,
    item_86.requisito-riferimento,
    item_86.stato,
  )
  )
}

#import "TS088_visualizzazione_domanda_nodo_a_dettaglio.typ": data as item_87


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_87.nome),
    item_87.descrizione,
    item_87.requisito-riferimento,
    item_87.stato,
  )
  )
}

#import "TS089_visualizzazione_risposta_nodo_a_dettaglio.typ": data as item_88


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_88.nome),
    item_88.descrizione,
    item_88.requisito-riferimento,
    item_88.stato,
  )
  )
}

#import "TS090_assenza_risposta_a_dettaglio.typ": data as item_89


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_89.nome),
    item_89.descrizione,
    item_89.requisito-riferimento,
    item_89.stato,
  )
  )
}

#import "TS091_valutazione_nodo_di_decisione.typ": data as item_90


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_90.nome),
    item_90.descrizione,
    item_90.requisito-riferimento,
    item_90.stato,
  )
  )
}

#import "TS092_seleziona_risposta_nodo.typ": data as item_91


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_91.nome),
    item_91.descrizione,
    item_91.requisito-riferimento,
    item_91.stato,
  )
  )
}

#import "TS093_selezione_risposta_yes.typ": data as item_92


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_92.nome),
    item_92.descrizione,
    item_92.requisito-riferimento,
    item_92.stato,
  )
  )
}

#import "TS094_selezione_risposta_no.typ": data as item_93


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_93.nome),
    item_93.descrizione,
    item_93.requisito-riferimento,
    item_93.stato,
  )
  )
}

#import "TS095_navigazione_nodo_successivo.typ": data as item_94


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_94.nome),
    item_94.descrizione,
    item_94.requisito-riferimento,
    item_94.stato,
  )
  )
}

#import "TS096_errore_nodo_senza_risposta_selezionata.typ": data as item_95


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_95.nome),
    item_95.descrizione,
    item_95.requisito-riferimento,
    item_95.stato,
  )
  )
}

#import "TS097_raggiungimento_nodo_foglia.typ": data as item_96


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_96.nome),
    item_96.descrizione,
    item_96.requisito-riferimento,
    item_96.stato,
  )
  )
}

#import "TS098_navigazione_nodo_precedente.typ": data as item_97


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_97.nome),
    item_97.descrizione,
    item_97.requisito-riferimento,
    item_97.stato,
  )
  )
}

#import "TS099_reindirizzamento_da_nodo_root.typ": data as item_98


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_98.nome),
    item_98.descrizione,
    item_98.requisito-riferimento,
    item_98.stato,
  )
  )
}

#import "TS100_inserimento_giustificazione_decision_tree.typ": data as item_99


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_99.nome),
    item_99.descrizione,
    item_99.requisito-riferimento,
    item_99.stato,
  )
  )
}

#import "TS101_eliminazione_dispositivo_con_backup.typ": data as item_100


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_100.nome),
    item_100.descrizione,
    item_100.requisito-riferimento,
    item_100.stato,
  )
  )
}

#import "TS102_eliminazione_dispositivo_con_backup_json.typ": data as item_101


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_101.nome),
    item_101.descrizione,
    item_101.requisito-riferimento,
    item_101.stato,
  )
  )
}

#import "TS103_eliminazione_dispositivo_con_backup_xml.typ": data as item_102


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_102.nome),
    item_102.descrizione,
    item_102.requisito-riferimento,
    item_102.stato,
  )
  )
}

#import "TS104_eliminazione_dispositivo_con_backup_csv.typ": data as item_103


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_103.nome),
    item_103.descrizione,
    item_103.requisito-riferimento,
    item_103.stato,
  )
  )
}

#import "TS105_modifica_dispositivo.typ": data as item_104


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_104.nome),
    item_104.descrizione,
    item_104.requisito-riferimento,
    item_104.stato,
  )
  )
}

#import "TS106_modifica_nome_dispositivo.typ": data as item_105


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_105.nome),
    item_105.descrizione,
    item_105.requisito-riferimento,
    item_105.stato,
  )
  )
}

#import "TS107_errore_modifica_nome_dispositivo_non_valido.typ": data as item_106


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_106.nome),
    item_106.descrizione,
    item_106.requisito-riferimento,
    item_106.stato,
  )
  )
}

#import "TS108_modifica_sistema_operativo_dispositivo.typ": data as item_107


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_107.nome),
    item_107.descrizione,
    item_107.requisito-riferimento,
    item_107.stato,
  )
  )
}

#import "TS109_modifica_descrizione_dispositivo.typ": data as item_108


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_108.nome),
    item_108.descrizione,
    item_108.requisito-riferimento,
    item_108.stato,
  )
  )
}

#import "TS110_annullamento_modifiche_dispositivo.typ": data as item_109


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_109.nome),
    item_109.descrizione,
    item_109.requisito-riferimento,
    item_109.stato,
  )
  )
}

#import "TS111_modifica_asset.typ": data as item_110


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_110.nome),
    item_110.descrizione,
    item_110.requisito-riferimento,
    item_110.stato,
  )
  )
}

#import "TS112_modifica_nome_asset.typ": data as item_111


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_111.nome),
    item_111.descrizione,
    item_111.requisito-riferimento,
    item_111.stato,
  )
  )
}

#import "TS113_errore_modifica_nome_asset_non_valido.typ": data as item_112


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_112.nome),
    item_112.descrizione,
    item_112.requisito-riferimento,
    item_112.stato,
  )
  )
}

#import "TS114_modifica_tipo_asset.typ": data as item_113


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_113.nome),
    item_113.descrizione,
    item_113.requisito-riferimento,
    item_113.stato,
  )
  )
}

#import "TS115_selezione_nuovo_tipo_security_asset.typ": data as item_114


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_114.nome),
    item_114.descrizione,
    item_114.requisito-riferimento,
    item_114.stato,
  )
  )
}

#import "TS116_selezione_nuovo_tipo_network_asset.typ": data as item_115


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_115.nome),
    item_115.descrizione,
    item_115.requisito-riferimento,
    item_115.stato,
  )
  )
}

#import "TS117_modifica_descrizione_asset.typ": data as item_116


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_116.nome),
    item_116.descrizione,
    item_116.requisito-riferimento,
    item_116.stato,
  )
  )
}

#import "TS118_annullamento_modifica_asset.typ": data as item_117


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_117.nome),
    item_117.descrizione,
    item_117.requisito-riferimento,
    item_117.stato,
  )
  )
}

#import "TS119_esportazione_report_di_conformità.typ": data as item_118


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_118.nome),
    item_118.descrizione,
    item_118.requisito-riferimento,
    item_118.stato,
  )
  )
}

#import "TS120_esportazione_report_di_conformità_in_pdf.typ": data as item_119


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_119.nome),
    item_119.descrizione,
    item_119.requisito-riferimento,
    item_119.stato,
  )
  )
}

#import "TS121_visualizzazione_lista_modelli.typ": data as item_120


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_120.nome),
    item_120.descrizione,
    item_120.requisito-riferimento,
    item_120.stato,
  )
  )
}

#import "TS122_visualizzazione_elemento_lista_modelli.typ": data as item_121


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_121.nome),
    item_121.descrizione,
    item_121.requisito-riferimento,
    item_121.stato,
  )
  )
}

#import "TS123_visualizzazione_nome_modello.typ": data as item_122


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_122.nome),
    item_122.descrizione,
    item_122.requisito-riferimento,
    item_122.stato,
  )
  )
}

#import "TS124_visualizzazione_versione_modello.typ": data as item_123


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_123.nome),
    item_123.descrizione,
    item_123.requisito-riferimento,
    item_123.stato,
  )
  )
}

#import "TS125_visualizzazione_dettaglio_modello.typ": data as item_124


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_124.nome),
    item_124.descrizione,
    item_124.requisito-riferimento,
    item_124.stato,
  )
  )
}

#import "TS126_visualizzazione_id_modello.typ": data as item_125


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_125.nome),
    item_125.descrizione,
    item_125.requisito-riferimento,
    item_125.stato,
  )
  )
}

#import "TS127_visualizzazione_nome_modello_nel_dettaglio.typ": data as item_126


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_126.nome),
    item_126.descrizione,
    item_126.requisito-riferimento,
    item_126.stato,
  )
  )
}

#import "TS128_visualizzazione_versione_modello_nel_dettaglio.typ": data as item_127


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_127.nome),
    item_127.descrizione,
    item_127.requisito-riferimento,
    item_127.stato,
  )
  )
}

#import "TS129_visualizzazione_lista_requisiti_modello.typ": data as item_128


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_128.nome),
    item_128.descrizione,
    item_128.requisito-riferimento,
    item_128.stato,
  )
  )
}

#import "TS130_visualizzazione_elemento_lista_requisiti_modello.typ": data as item_129


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_129.nome),
    item_129.descrizione,
    item_129.requisito-riferimento,
    item_129.stato,
  )
  )
}

#import "TS131_visualizzazione_codice_requisito_modello_in_lista.typ": data as item_130


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_130.nome),
    item_130.descrizione,
    item_130.requisito-riferimento,
    item_130.stato,
  )
  )
}

#import "TS132_visualizzazione_nome_requisito_modello_in_lista.typ": data as item_131


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_131.nome),
    item_131.descrizione,
    item_131.requisito-riferimento,
    item_131.stato,
  )
  )
}

#import "TS133_inserimento_nuovo_modello.typ": data as item_132


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_132.nome),
    item_132.descrizione,
    item_132.requisito-riferimento,
    item_132.stato,
  )
  )
}

#import "TS134_creazione_nuovo_modello.typ": data as item_133


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_133.nome),
    item_133.descrizione,
    item_133.requisito-riferimento,
    item_133.stato,
  )
  )
}

#import "TS135_inserimento_nome_modello.typ": data as item_134


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_134.nome),
    item_134.descrizione,
    item_134.requisito-riferimento,
    item_134.stato,
  )
  )
}

#import "TS136_errore_nome_nuovo_modello_non_valido.typ": data as item_135


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_135.nome),
    item_135.descrizione,
    item_135.requisito-riferimento,
    item_135.stato,
  )
  )
}

#import "TS137_importazione_modello_da_file.typ": data as item_136


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_136.nome),
    item_136.descrizione,
    item_136.requisito-riferimento,
    item_136.stato,
  )
  )
}

#import "TS138_importazione_modello_file_xml.typ": data as item_137


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_137.nome),
    item_137.descrizione,
    item_137.requisito-riferimento,
    item_137.stato,
  )
  )
}

#import "TS139_importazione_modello_file_json.typ": data as item_138


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_138.nome),
    item_138.descrizione,
    item_138.requisito-riferimento,
    item_138.stato,
  )
  )
}

#import "TS140_errore_modello_esistente.typ": data as item_139


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_139.nome),
    item_139.descrizione,
    item_139.requisito-riferimento,
    item_139.stato,
  )
  )
}

#import "TS141_annullamento_inserimento_modello.typ": data as item_140


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_140.nome),
    item_140.descrizione,
    item_140.requisito-riferimento,
    item_140.stato,
  )
  )
}

#import "TS142_modifica_anagrafica_modello.typ": data as item_141


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_141.nome),
    item_141.descrizione,
    item_141.requisito-riferimento,
    item_141.stato,
  )
  )
}

#import "TS143_modifica_nome_modello.typ": data as item_142


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_142.nome),
    item_142.descrizione,
    item_142.requisito-riferimento,
    item_142.stato,
  )
  )
}

#import "TS144_errore_modifica_nome_modello.typ": data as item_143


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_143.nome),
    item_143.descrizione,
    item_143.requisito-riferimento,
    item_143.stato,
  )
  )
}

#import "TS145_avvio_modifica_struttura_modello.typ": data as item_144


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_144.nome),
    item_144.descrizione,
    item_144.requisito-riferimento,
    item_144.stato,
  )
  )
}

#import "TS146_salvataggio_modifiche_modello.typ": data as item_145


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_145.nome),
    item_145.descrizione,
    item_145.requisito-riferimento,
    item_145.stato,
  )
  )
}

#import "TS147_salvataggio_modifica_major.typ": data as item_146


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_146.nome),
    item_146.descrizione,
    item_146.requisito-riferimento,
    item_146.stato,
  )
  )
}

#import "TS148_salvataggio_modifica_minor.typ": data as item_147


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_147.nome),
    item_147.descrizione,
    item_147.requisito-riferimento,
    item_147.stato,
  )
  )
}

#import "TS149_errore_struttura_modello_non_valida.typ": data as item_148


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_148.nome),
    item_148.descrizione,
    item_148.requisito-riferimento,
    item_148.stato,
  )
  )
}

#import "TS150_scarto_modifiche_modello.typ": data as item_149


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_149.nome),
    item_149.descrizione,
    item_149.requisito-riferimento,
    item_149.stato,
  )
  )
}

#import "TS151_eliminazione_modello.typ": data as item_150


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_150.nome),
    item_150.descrizione,
    item_150.requisito-riferimento,
    item_150.stato,
  )
  )
}

#import "TS152_esportazione_modello.typ": data as item_151


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_151.nome),
    item_151.descrizione,
    item_151.requisito-riferimento,
    item_151.stato,
  )
  )
}

#import "TS153_esportazione_modello_in_xml.typ": data as item_152


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_152.nome),
    item_152.descrizione,
    item_152.requisito-riferimento,
    item_152.stato,
  )
  )
}

#import "TS154_esportazione_modello_in_json.typ": data as item_153


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_153.nome),
    item_153.descrizione,
    item_153.requisito-riferimento,
    item_153.stato,
  )
  )
}

#import "TS155_visualizzazione_dettaglio_requisito_modello.typ": data as item_154


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_154.nome),
    item_154.descrizione,
    item_154.requisito-riferimento,
    item_154.stato,
  )
  )
}

#import "TS156_visualizzazione_anagrafica_requisito_modello.typ": data as item_155


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_155.nome),
    item_155.descrizione,
    item_155.requisito-riferimento,
    item_155.stato,
  )
  )
}

#import "TS157_visualizzazione_codice_requisito_modello.typ": data as item_156


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_156.nome),
    item_156.descrizione,
    item_156.requisito-riferimento,
    item_156.stato,
  )
  )
}

#import "TS158_visualizzazione_nome_del_requisito_modello.typ": data as item_157


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_157.nome),
    item_157.descrizione,
    item_157.requisito-riferimento,
    item_157.stato,
  )
  )
}

#import "TS159_visualizzazione_descrizione_requisito_modello.typ": data as item_158


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_158.nome),
    item_158.descrizione,
    item_158.requisito-riferimento,
    item_158.stato,
  )
  )
}

#import "TS160_visualizzazione_lista_dipendenze_requisito_modello.typ": data as item_159


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_159.nome),
    item_159.descrizione,
    item_159.requisito-riferimento,
    item_159.stato,
  )
  )
}

#import "TS161_visualizzazione_codice_dipendenza_requisito_modello.typ": data as item_160


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_160.nome),
    item_160.descrizione,
    item_160.requisito-riferimento,
    item_160.stato,
  )
  )
}

#import "TS162_visualizzazione_lista_non_dipendenze_requisito_modello.typ": data as item_161


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_161.nome),
    item_161.descrizione,
    item_161.requisito-riferimento,
    item_161.stato,
  )
  )
}

#import "TS163_visualizzazione_codice_non_dipendenza_requisito_modello.typ": data as item_162


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_162.nome),
    item_162.descrizione,
    item_162.requisito-riferimento,
    item_162.stato,
  )
  )
}

#import "TS164_visualizzazione_decision_tree_requisito_modello.typ": data as item_163


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_163.nome),
    item_163.descrizione,
    item_163.requisito-riferimento,
    item_163.stato,
  )
  )
}

#import "TS165_visualizzazione_nodo_decision_tree_modello.typ": data as item_164


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_164.nome),
    item_164.descrizione,
    item_164.requisito-riferimento,
    item_164.stato,
  )
  )
}

#import "TS166_visualizzazione_nodo_decisione_modello.typ": data as item_165


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_165.nome),
    item_165.descrizione,
    item_165.requisito-riferimento,
    item_165.stato,
  )
  )
}

#import "TS167_visualizzazione_codice_requisito_padre_modello.typ": data as item_166


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_166.nome),
    item_166.descrizione,
    item_166.requisito-riferimento,
    item_166.stato,
  )
  )
}

#import "TS168_visualizzazione_codice_nodo_modello.typ": data as item_167


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_167.nome),
    item_167.descrizione,
    item_167.requisito-riferimento,
    item_167.stato,
  )
  )
}

#import "TS169_visualizzazione_domanda_nodo_modello.typ": data as item_168


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_168.nome),
    item_168.descrizione,
    item_168.requisito-riferimento,
    item_168.stato,
  )
  )
}

#import "TS170_visualizzazione_nodo_foglia_modello.typ": data as item_169


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_169.nome),
    item_169.descrizione,
    item_169.requisito-riferimento,
    item_169.stato,
  )
  )
}

#import "TS171_visualizzazione_dettaglio_nodo_modello.typ": data as item_170


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_170.nome),
    item_170.descrizione,
    item_170.requisito-riferimento,
    item_170.stato,
  )
  )
}

#import "TS172_visualizzazione_dettaglio_nodo_decisione_modello.typ": data as item_171


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_171.nome),
    item_171.descrizione,
    item_171.requisito-riferimento,
    item_171.stato,
  )
  )
}

#import "TS173_visualizzazione_dettaglio_codice_requisito_padre_modello.typ": data as item_172


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_172.nome),
    item_172.descrizione,
    item_172.requisito-riferimento,
    item_172.stato,
  )
  )
}

#import "TS174_visualizzazione_dettaglio_codice_nodo_modello.typ": data as item_173


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_173.nome),
    item_173.descrizione,
    item_173.requisito-riferimento,
    item_173.stato,
  )
  )
}

#import "TS175_visualizzazione_dettaglio_domanda_nodo_modello.typ": data as item_174


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_174.nome),
    item_174.descrizione,
    item_174.requisito-riferimento,
    item_174.stato,
  )
  )
}

#import "TS176_visualizzazione_dettaglio_nodo_foglia_modello.typ": data as item_175


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_175.nome),
    item_175.descrizione,
    item_175.requisito-riferimento,
    item_175.stato,
  )
  )
}

#import "TS177_aggiunta_requisito_al_modello.typ": data as item_176


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_176.nome),
    item_176.descrizione,
    item_176.requisito-riferimento,
    item_176.stato,
  )
  )
}

#import "TS178_eliminazione_requisito_dal_modello.typ": data as item_177


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_177.nome),
    item_177.descrizione,
    item_177.requisito-riferimento,
    item_177.stato,
  )
  )
}

#import "TS179_modifica_anagrafica_requisito.typ": data as item_178


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_178.nome),
    item_178.descrizione,
    item_178.requisito-riferimento,
    item_178.stato,
  )
  )
}

#import "TS180_inserimento_codice_requisito.typ": data as item_179


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_179.nome),
    item_179.descrizione,
    item_179.requisito-riferimento,
    item_179.stato,
  )
  )
}

#import "TS181_errore_codice_requisito_lunghezza_non_valida.typ": data as item_180


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_180.nome),
    item_180.descrizione,
    item_180.requisito-riferimento,
    item_180.stato,
  )
  )
}

#import "TS182_errore_codice_requisito_duplicato.typ": data as item_181


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_181.nome),
    item_181.descrizione,
    item_181.requisito-riferimento,
    item_181.stato,
  )
  )
}

#import "TS183_inserimento_nome_requisito.typ": data as item_182


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_182.nome),
    item_182.descrizione,
    item_182.requisito-riferimento,
    item_182.stato,
  )
  )
}

#import "TS184_errore_nome_requisito_non_valido.typ": data as item_183


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_183.nome),
    item_183.descrizione,
    item_183.requisito-riferimento,
    item_183.stato,
  )
  )
}

#import "TS185_inserimento_descrizione_requisito.typ": data as item_184


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_184.nome),
    item_184.descrizione,
    item_184.requisito-riferimento,
    item_184.stato,
  )
  )
}

#import "TS186_modifica_codice_requisito.typ": data as item_185


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_185.nome),
    item_185.descrizione,
    item_185.requisito-riferimento,
    item_185.stato,
  )
  )
}

#import "TS187_errore_modifica_codice_requisito_lunghezza_non_valida.typ": data as item_186


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_186.nome),
    item_186.descrizione,
    item_186.requisito-riferimento,
    item_186.stato,
  )
  )
}

#import "TS188_errore_modifica_codice_requisito_duplicato.typ": data as item_187


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_187.nome),
    item_187.descrizione,
    item_187.requisito-riferimento,
    item_187.stato,
  )
  )
}

#import "TS189_modifica_nome_requisito.typ": data as item_188


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_188.nome),
    item_188.descrizione,
    item_188.requisito-riferimento,
    item_188.stato,
  )
  )
}

#import "TS190_errore_modifica_nome_requisito_non_valido.typ": data as item_189


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_189.nome),
    item_189.descrizione,
    item_189.requisito-riferimento,
    item_189.stato,
  )
  )
}

#import "TS191_modifica_descrizione_requisito.typ": data as item_190


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_190.nome),
    item_190.descrizione,
    item_190.requisito-riferimento,
    item_190.stato,
  )
  )
}

#import "TS192_aggiunta_dipendenza_tra_requisiti.typ": data as item_191


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_191.nome),
    item_191.descrizione,
    item_191.requisito-riferimento,
    item_191.stato,
  )
  )
}

#import "TS193_visualizzazione_grafo_dipendenze.typ": data as item_192


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_192.nome),
    item_192.descrizione,
    item_192.requisito-riferimento,
    item_192.stato,
  )
  )
}

#import "TS194_errore_dipendenza_circolare.typ": data as item_193


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_193.nome),
    item_193.descrizione,
    item_193.requisito-riferimento,
    item_193.stato,
  )
  )
}

#import "TS195_rimozione_dipendenza_tra_requisiti.typ": data as item_194


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_194.nome),
    item_194.descrizione,
    item_194.requisito-riferimento,
    item_194.stato,
  )
  )
}

#import "TS196_aggiunta_nodo_figlio.typ": data as item_195


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_195.nome),
    item_195.descrizione,
    item_195.requisito-riferimento,
    item_195.stato,
  )
  )
}

#import "TS197_aggiunta_nodo_figlio_yes.typ": data as item_196


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_196.nome),
    item_196.descrizione,
    item_196.requisito-riferimento,
    item_196.stato,
  )
  )
}

#import "TS198_aggiunta_nodo_figlio_no.typ": data as item_197


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_197.nome),
    item_197.descrizione,
    item_197.requisito-riferimento,
    item_197.stato,
  )
  )
}

#import "TS199_aggiunta_nodo.typ": data as item_198


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_198.nome),
    item_198.descrizione,
    item_198.requisito-riferimento,
    item_198.stato,
  )
  )
}

#import "TS200_aggiunta_nodo_foglia.typ": data as item_199


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_199.nome),
    item_199.descrizione,
    item_199.requisito-riferimento,
    item_199.stato,
  )
  )
}

#import "TS201_aggiunta_nodo_foglia_pass.typ": data as item_200


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_200.nome),
    item_200.descrizione,
    item_200.requisito-riferimento,
    item_200.stato,
  )
  )
}

#import "TS202_aggiunta_nodo_foglia_fail.typ": data as item_201


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_201.nome),
    item_201.descrizione,
    item_201.requisito-riferimento,
    item_201.stato,
  )
  )
}

#import "TS203_aggiunta_nodo_foglia_not_applicable.typ": data as item_202


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_202.nome),
    item_202.descrizione,
    item_202.requisito-riferimento,
    item_202.stato,
  )
  )
}

#import "TS204_aggiunta_nodo_di_decisione.typ": data as item_203


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_203.nome),
    item_203.descrizione,
    item_203.requisito-riferimento,
    item_203.stato,
  )
  )
}

#import "TS205_inserimento_codice_nodo_di_decisione.typ": data as item_204


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_204.nome),
    item_204.descrizione,
    item_204.requisito-riferimento,
    item_204.stato,
  )
  )
}

#import "TS206_errore_codice_nodo_non_valido.typ": data as item_205


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_205.nome),
    item_205.descrizione,
    item_205.requisito-riferimento,
    item_205.stato,
  )
  )
}

#import "TS207_errore_codice_nodo_già_esistente.typ": data as item_206


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_206.nome),
    item_206.descrizione,
    item_206.requisito-riferimento,
    item_206.stato,
  )
  )
}

#import "TS208_inserimento_domanda_nodo_di_decisione.typ": data as item_207


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_207.nome),
    item_207.descrizione,
    item_207.requisito-riferimento,
    item_207.stato,
  )
  )
}

#import "TS209_errore_domanda_vuota.typ": data as item_208


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_208.nome),
    item_208.descrizione,
    item_208.requisito-riferimento,
    item_208.stato,
  )
  )
}

#import "TS210_modifica_nodo_di_decisione.typ": data as item_209


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_209.nome),
    item_209.descrizione,
    item_209.requisito-riferimento,
    item_209.stato,
  )
  )
}

#import "TS211_modifica_codice_nodo_decision_tree.typ": data as item_210


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_210.nome),
    item_210.descrizione,
    item_210.requisito-riferimento,
    item_210.stato,
  )
  )
}

#import "TS212_errore_modifica_codice_nodo_non_valido.typ": data as item_211


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_211.nome),
    item_211.descrizione,
    item_211.requisito-riferimento,
    item_211.stato,
  )
  )
}

#import "TS213_errore_modifica_codice_nodo_già_esistente.typ": data as item_212


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_212.nome),
    item_212.descrizione,
    item_212.requisito-riferimento,
    item_212.stato,
  )
  )
}

#import "TS214_modifica_domanda_nodo_decision_tree.typ": data as item_213


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_213.nome),
    item_213.descrizione,
    item_213.requisito-riferimento,
    item_213.stato,
  )
  )
}

#import "TS215_errore_modifica_domanda_vuota.typ": data as item_214


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_214.nome),
    item_214.descrizione,
    item_214.requisito-riferimento,
    item_214.stato,
  )
  )
}

#import "TS216_rimozione_nodo_dal_decision_tree.typ": data as item_215


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_215.nome),
    item_215.descrizione,
    item_215.requisito-riferimento,
    item_215.stato,
  )
  )
}

#import "TS217_errore_eliminazione_nodo_root.typ": data as item_216


#{
  test-array.push((

    deps.get-test-code(nome-etichetta:item_216.nome),
    item_216.descrizione,
    item_216.requisito-riferimento,
    item_216.stato,
  )
  )
}



#figure(caption:" Test di Sistema")[
#deps.tabella-test(..(test-array).flatten())

]


=== Tracciamento test di sistema



#figure(caption: "Tracciamento dei Test di Sistema")[#deps.tabella-tracciamento(..(test-array.map(
  it=>{
    (it.at(0),it.at(2))
}
).flatten()))]