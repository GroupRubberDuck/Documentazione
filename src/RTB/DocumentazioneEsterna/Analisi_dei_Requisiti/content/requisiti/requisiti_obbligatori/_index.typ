#import "config/deps.typ" as deps
#import "/src/TypstTemplate/AnalisiRequisiti/utils/utils.typ" as utils:uc-transformation-con-link
// ============================================================================
// ⚠️ ATTENZIONE: FILE GENERATO AUTOMATICAMENTE ⚠️
// ============================================================================
// Questo file è stato creato dallo script di automazione (manager.py).
// NON MODIFICARE MANUALMENTE QUESTO FILE!
// 
// Qualsiasi modifica apportata qui verrà inesorabilmente cancellata 
// alla prossima esecuzione dello script.
//
// 🛠️ COME FARE MODIFICHE:
// - Per aggiungere, rimuovere o riordinare i file: modifica il file 'config.yml'.
// - Per modificare il contenuto di una singola voce: apri il file .typ corrispondente.
// - Per cambiare questa intestazione: modifica 'config/index_header.typ'.
//
// ============================================================================


#let table-cells=()
#let req-uc-dict=(:)


#import "RObb001_visualizzazione_lista_dispositivi.typ": data as item_0, req-name as req-0

#req-uc-dict.insert(
  req-0
  ,
  item_0.fonti
  )


#{
item_0.fonti=utils.format-array(item_0.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_0)



#import "RObb002_visualizzazione_elemento_lista_dispositivi.typ": data as item_1, req-name as req-1

#req-uc-dict.insert(
  req-1
  ,
  item_1.fonti
  )


#{
item_1.fonti=utils.format-array(item_1.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_1)



#import "RObb003_visualizzazione_nome_dispositivo_in_lista.typ": data as item_2, req-name as req-2

#req-uc-dict.insert(
  req-2
  ,
  item_2.fonti
  )


#{
item_2.fonti=utils.format-array(item_2.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_2)



#import "RObb004_inserimento_nuovo_dispositivo.typ": data as item_3, req-name as req-3

#req-uc-dict.insert(
  req-3
  ,
  item_3.fonti
  )


#{
item_3.fonti=utils.format-array(item_3.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_3)



#import "RObb005_creazione_manuale_dispositivo.typ": data as item_4, req-name as req-4

#req-uc-dict.insert(
  req-4
  ,
  item_4.fonti
  )


#{
item_4.fonti=utils.format-array(item_4.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_4)



#import "RObb006_inserimento_nome_dispositivo.typ": data as item_5, req-name as req-5

#req-uc-dict.insert(
  req-5
  ,
  item_5.fonti
  )


#{
item_5.fonti=utils.format-array(item_5.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_5)



#import "RObb007_inserimento_sistema_operativo_dispositivo.typ": data as item_6, req-name as req-6

#req-uc-dict.insert(
  req-6
  ,
  item_6.fonti
  )


#{
item_6.fonti=utils.format-array(item_6.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_6)



#import "RObb008_inserimento_descrizione_dispositivo.typ": data as item_7, req-name as req-7

#req-uc-dict.insert(
  req-7
  ,
  item_7.fonti
  )


#{
item_7.fonti=utils.format-array(item_7.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_7)



#import "RObb009_errore_nome_dispositivo_non_valido.typ": data as item_8, req-name as req-8

#req-uc-dict.insert(
  req-8
  ,
  item_8.fonti
  )


#{
item_8.fonti=utils.format-array(item_8.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_8)



#import "RObb010_annullamento_inserimento_dispositivo.typ": data as item_9, req-name as req-9

#req-uc-dict.insert(
  req-9
  ,
  item_9.fonti
  )


#{
item_9.fonti=utils.format-array(item_9.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_9)



#import "RObb011_importazione_dispositivo_da_file.typ": data as item_10, req-name as req-10

#req-uc-dict.insert(
  req-10
  ,
  item_10.fonti
  )


#{
item_10.fonti=utils.format-array(item_10.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_10)



#import "RObb012_selezione_file_sorgente_json.typ": data as item_11, req-name as req-11

#req-uc-dict.insert(
  req-11
  ,
  item_11.fonti
  )


#{
item_11.fonti=utils.format-array(item_11.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_11)



#import "RObb013_selezione_file_sorgente_xml.typ": data as item_12, req-name as req-12

#req-uc-dict.insert(
  req-12
  ,
  item_12.fonti
  )


#{
item_12.fonti=utils.format-array(item_12.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_12)



#import "RObb014_selezione_file_sorgente_csv.typ": data as item_13, req-name as req-13

#req-uc-dict.insert(
  req-13
  ,
  item_13.fonti
  )


#{
item_13.fonti=utils.format-array(item_13.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_13)



#import "RObb015_errore_file_dispositivo_non_valido.typ": data as item_14, req-name as req-14

#req-uc-dict.insert(
  req-14
  ,
  item_14.fonti
  )


#{
item_14.fonti=utils.format-array(item_14.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_14)



#import "RObb016_visualizzazione_dati_dispositivo.typ": data as item_15, req-name as req-15

#req-uc-dict.insert(
  req-15
  ,
  item_15.fonti
  )


#{
item_15.fonti=utils.format-array(item_15.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_15)



#import "RObb017_visualizzazione_nome_dispositivo.typ": data as item_16, req-name as req-16

#req-uc-dict.insert(
  req-16
  ,
  item_16.fonti
  )


#{
item_16.fonti=utils.format-array(item_16.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_16)



#import "RObb018_visualizzazione_sistema_operativo_dispositivo.typ": data as item_17, req-name as req-17

#req-uc-dict.insert(
  req-17
  ,
  item_17.fonti
  )


#{
item_17.fonti=utils.format-array(item_17.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_17)



#import "RObb019_visualizzazione_descrizione_dispositivo.typ": data as item_18, req-name as req-18

#req-uc-dict.insert(
  req-18
  ,
  item_18.fonti
  )


#{
item_18.fonti=utils.format-array(item_18.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_18)



#import "RObb020_visualizzazione_modello_associato_al_dispositivo.typ": data as item_19, req-name as req-19

#req-uc-dict.insert(
  req-19
  ,
  item_19.fonti
  )


#{
item_19.fonti=utils.format-array(item_19.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_19)



#import "RObb021_visualizzazione_nome_modello_associato.typ": data as item_20, req-name as req-20

#req-uc-dict.insert(
  req-20
  ,
  item_20.fonti
  )


#{
item_20.fonti=utils.format-array(item_20.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_20)



#import "RObb022_visualizzazione_versione_modello_associato.typ": data as item_21, req-name as req-21

#req-uc-dict.insert(
  req-21
  ,
  item_21.fonti
  )


#{
item_21.fonti=utils.format-array(item_21.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_21)



#import "RObb023_eliminazione_dispositivo.typ": data as item_22, req-name as req-22

#req-uc-dict.insert(
  req-22
  ,
  item_22.fonti
  )


#{
item_22.fonti=utils.format-array(item_22.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_22)



#import "RObb024_eliminazione_dispositivo_diretta.typ": data as item_23, req-name as req-23

#req-uc-dict.insert(
  req-23
  ,
  item_23.fonti
  )


#{
item_23.fonti=utils.format-array(item_23.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_23)



#import "RObb025_avvio_sessione_di_valutazione.typ": data as item_24, req-name as req-24

#req-uc-dict.insert(
  req-24
  ,
  item_24.fonti
  )


#{
item_24.fonti=utils.format-array(item_24.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_24)



#import "RObb026_scarto_modifiche_valutazione.typ": data as item_25, req-name as req-25

#req-uc-dict.insert(
  req-25
  ,
  item_25.fonti
  )


#{
item_25.fonti=utils.format-array(item_25.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_25)



#import "RObb027_salvataggio_valutazione.typ": data as item_26, req-name as req-26

#req-uc-dict.insert(
  req-26
  ,
  item_26.fonti
  )


#{
item_26.fonti=utils.format-array(item_26.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_26)



#import "RObb028_salvataggio_e_chiusura_sessione_di_valutazione.typ": data as item_27, req-name as req-27

#req-uc-dict.insert(
  req-27
  ,
  item_27.fonti
  )


#{
item_27.fonti=utils.format-array(item_27.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_27)



#import "RObb029_salvataggio_e_continuazione_sessione_di_valutazione.typ": data as item_28, req-name as req-28

#req-uc-dict.insert(
  req-28
  ,
  item_28.fonti
  )


#{
item_28.fonti=utils.format-array(item_28.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_28)



#import "RObb030_errore_salvataggio_valutazione.typ": data as item_29, req-name as req-29

#req-uc-dict.insert(
  req-29
  ,
  item_29.fonti
  )


#{
item_29.fonti=utils.format-array(item_29.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_29)



#import "RObb031_visualizzazione_dashboard_dispositivo.typ": data as item_30, req-name as req-30

#req-uc-dict.insert(
  req-30
  ,
  item_30.fonti
  )


#{
item_30.fonti=utils.format-array(item_30.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_30)



#import "RObb032_visualizzazione_stato_aggregato_dispositivo.typ": data as item_31, req-name as req-31

#req-uc-dict.insert(
  req-31
  ,
  item_31.fonti
  )


#{
item_31.fonti=utils.format-array(item_31.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_31)



#import "RObb033_esportazione_informazioni_dispositivo.typ": data as item_32, req-name as req-32

#req-uc-dict.insert(
  req-32
  ,
  item_32.fonti
  )


#{
item_32.fonti=utils.format-array(item_32.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_32)



#import "RObb034_esportazione_informazioni_dispositivo_in_xml.typ": data as item_33, req-name as req-33

#req-uc-dict.insert(
  req-33
  ,
  item_33.fonti
  )


#{
item_33.fonti=utils.format-array(item_33.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_33)



#import "RObb035_esportazione_informazioni_dispositivo_in_json.typ": data as item_34, req-name as req-34

#req-uc-dict.insert(
  req-34
  ,
  item_34.fonti
  )


#{
item_34.fonti=utils.format-array(item_34.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_34)



#import "RObb036_esportazione_informazioni_dispositivo_in_csv.typ": data as item_35, req-name as req-35

#req-uc-dict.insert(
  req-35
  ,
  item_35.fonti
  )


#{
item_35.fonti=utils.format-array(item_35.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_35)



#import "RObb037_aggiunta_asset.typ": data as item_36, req-name as req-36

#req-uc-dict.insert(
  req-36
  ,
  item_36.fonti
  )


#{
item_36.fonti=utils.format-array(item_36.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_36)



#import "RObb038_inserimento_nome_asset.typ": data as item_37, req-name as req-37

#req-uc-dict.insert(
  req-37
  ,
  item_37.fonti
  )


#{
item_37.fonti=utils.format-array(item_37.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_37)



#import "RObb039_selezione_tipo_asset.typ": data as item_38, req-name as req-38

#req-uc-dict.insert(
  req-38
  ,
  item_38.fonti
  )


#{
item_38.fonti=utils.format-array(item_38.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_38)



#import "RObb040_selezione_security_asset.typ": data as item_39, req-name as req-39

#req-uc-dict.insert(
  req-39
  ,
  item_39.fonti
  )


#{
item_39.fonti=utils.format-array(item_39.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_39)



#import "RObb041_selezione_network_asset.typ": data as item_40, req-name as req-40

#req-uc-dict.insert(
  req-40
  ,
  item_40.fonti
  )


#{
item_40.fonti=utils.format-array(item_40.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_40)



#import "RObb042_inserimento_descrizione_asset.typ": data as item_41, req-name as req-41

#req-uc-dict.insert(
  req-41
  ,
  item_41.fonti
  )


#{
item_41.fonti=utils.format-array(item_41.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_41)



#import "RObb043_errore_nome_asset_non_valido.typ": data as item_42, req-name as req-42

#req-uc-dict.insert(
  req-42
  ,
  item_42.fonti
  )


#{
item_42.fonti=utils.format-array(item_42.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_42)



#import "RObb044_annullamento_aggiunta_asset.typ": data as item_43, req-name as req-43

#req-uc-dict.insert(
  req-43
  ,
  item_43.fonti
  )


#{
item_43.fonti=utils.format-array(item_43.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_43)



#import "RObb045_visualizzazione_lista_asset.typ": data as item_44, req-name as req-44

#req-uc-dict.insert(
  req-44
  ,
  item_44.fonti
  )


#{
item_44.fonti=utils.format-array(item_44.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_44)



#import "RObb046_visualizzazione_nome_asset.typ": data as item_45, req-name as req-45

#req-uc-dict.insert(
  req-45
  ,
  item_45.fonti
  )


#{
item_45.fonti=utils.format-array(item_45.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_45)



#import "RObb047_visualizzazione_tipo_asset.typ": data as item_46, req-name as req-46

#req-uc-dict.insert(
  req-46
  ,
  item_46.fonti
  )


#{
item_46.fonti=utils.format-array(item_46.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_46)



#import "RObb048_visualizzazione_stato_aggregato_asset.typ": data as item_47, req-name as req-47

#req-uc-dict.insert(
  req-47
  ,
  item_47.fonti
  )


#{
item_47.fonti=utils.format-array(item_47.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_47)



#import "RObb049_visualizzazione_dettaglio_asset.typ": data as item_48, req-name as req-48

#req-uc-dict.insert(
  req-48
  ,
  item_48.fonti
  )


#{
item_48.fonti=utils.format-array(item_48.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_48)



#import "RObb050_visualizzazione_descrizione_asset.typ": data as item_49, req-name as req-49

#req-uc-dict.insert(
  req-49
  ,
  item_49.fonti
  )


#{
item_49.fonti=utils.format-array(item_49.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_49)



#import "RObb051_eliminazione_asset.typ": data as item_50, req-name as req-50

#req-uc-dict.insert(
  req-50
  ,
  item_50.fonti
  )


#{
item_50.fonti=utils.format-array(item_50.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_50)



#import "RObb052_visualizzazione_lista_requisiti_asset.typ": data as item_51, req-name as req-51

#req-uc-dict.insert(
  req-51
  ,
  item_51.fonti
  )


#{
item_51.fonti=utils.format-array(item_51.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_51)



#import "RObb053_visualizzazione_elemento_lista_requisiti_asset.typ": data as item_52, req-name as req-52

#req-uc-dict.insert(
  req-52
  ,
  item_52.fonti
  )


#{
item_52.fonti=utils.format-array(item_52.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_52)



#import "RObb054_visualizzazione_codice_requisito.typ": data as item_53, req-name as req-53

#req-uc-dict.insert(
  req-53
  ,
  item_53.fonti
  )


#{
item_53.fonti=utils.format-array(item_53.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_53)



#import "RObb055_visualizzazione_stato_valutazione_requisito.typ": data as item_54, req-name as req-54

#req-uc-dict.insert(
  req-54
  ,
  item_54.fonti
  )


#{
item_54.fonti=utils.format-array(item_54.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_54)



#import "RObb056_visualizzazione_dettaglio_requisito.typ": data as item_55, req-name as req-55

#req-uc-dict.insert(
  req-55
  ,
  item_55.fonti
  )


#{
item_55.fonti=utils.format-array(item_55.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_55)



#import "RObb057_visualizzazione_nome_requisito.typ": data as item_56, req-name as req-56

#req-uc-dict.insert(
  req-56
  ,
  item_56.fonti
  )


#{
item_56.fonti=utils.format-array(item_56.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_56)



#import "RObb058_visualizzazione_descrizione_normativa_requisito.typ": data as item_57, req-name as req-57

#req-uc-dict.insert(
  req-57
  ,
  item_57.fonti
  )


#{
item_57.fonti=utils.format-array(item_57.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_57)



#import "RObb059_visualizzazione_stato_pass_requisito.typ": data as item_58, req-name as req-58

#req-uc-dict.insert(
  req-58
  ,
  item_58.fonti
  )


#{
item_58.fonti=utils.format-array(item_58.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_58)



#import "RObb060_visualizzazione_stato_fail_requisito.typ": data as item_59, req-name as req-59

#req-uc-dict.insert(
  req-59
  ,
  item_59.fonti
  )


#{
item_59.fonti=utils.format-array(item_59.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_59)



#import "RObb061_visualizzazione_stato_na_requisito.typ": data as item_60, req-name as req-60

#req-uc-dict.insert(
  req-60
  ,
  item_60.fonti
  )


#{
item_60.fonti=utils.format-array(item_60.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_60)



#import "RObb062_visualizzazione_stato_in_corso_requisito.typ": data as item_61, req-name as req-61

#req-uc-dict.insert(
  req-61
  ,
  item_61.fonti
  )


#{
item_61.fonti=utils.format-array(item_61.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_61)



#import "RObb063_visualizzazione_stato_sospeso_requisito.typ": data as item_62, req-name as req-62

#req-uc-dict.insert(
  req-62
  ,
  item_62.fonti
  )


#{
item_62.fonti=utils.format-array(item_62.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_62)



#import "RObb064_visualizzazione_lista_dipendenze_requisito.typ": data as item_63, req-name as req-63

#req-uc-dict.insert(
  req-63
  ,
  item_63.fonti
  )


#{
item_63.fonti=utils.format-array(item_63.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_63)



#import "RObb065_visualizzazione_sintesi_dipendenza.typ": data as item_64, req-name as req-64

#req-uc-dict.insert(
  req-64
  ,
  item_64.fonti
  )


#{
item_64.fonti=utils.format-array(item_64.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_64)



#import "RObb066_visualizzazione_codice_dipendenza.typ": data as item_65, req-name as req-65

#req-uc-dict.insert(
  req-65
  ,
  item_65.fonti
  )


#{
item_65.fonti=utils.format-array(item_65.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_65)



#import "RObb067_visualizzazione_stato_dipendenza.typ": data as item_66, req-name as req-66

#req-uc-dict.insert(
  req-66
  ,
  item_66.fonti
  )


#{
item_66.fonti=utils.format-array(item_66.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_66)



#import "RObb068_visualizzazione_decision_tree.typ": data as item_67, req-name as req-67

#req-uc-dict.insert(
  req-67
  ,
  item_67.fonti
  )


#{
item_67.fonti=utils.format-array(item_67.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_67)



#import "RObb069_visualizzazione_nodo_decision_tree.typ": data as item_68, req-name as req-68

#req-uc-dict.insert(
  req-68
  ,
  item_68.fonti
  )


#{
item_68.fonti=utils.format-array(item_68.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_68)



#import "RObb070_visualizzazione_stato_attivitã _nodo.typ": data as item_69, req-name as req-69

#req-uc-dict.insert(
  req-69
  ,
  item_69.fonti
  )


#{
item_69.fonti=utils.format-array(item_69.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_69)



#import "RObb071_visualizzazione_nodo_di_decisione.typ": data as item_70, req-name as req-70

#req-uc-dict.insert(
  req-70
  ,
  item_70.fonti
  )


#{
item_70.fonti=utils.format-array(item_70.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_70)



#import "RObb072_visualizzazione_codice_requisito_nodo.typ": data as item_71, req-name as req-71

#req-uc-dict.insert(
  req-71
  ,
  item_71.fonti
  )


#{
item_71.fonti=utils.format-array(item_71.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_71)



#import "RObb073_visualizzazione_codice_nodo.typ": data as item_72, req-name as req-72

#req-uc-dict.insert(
  req-72
  ,
  item_72.fonti
  )


#{
item_72.fonti=utils.format-array(item_72.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_72)



#import "RObb074_visualizzazione_domanda_nodo.typ": data as item_73, req-name as req-73

#req-uc-dict.insert(
  req-73
  ,
  item_73.fonti
  )


#{
item_73.fonti=utils.format-array(item_73.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_73)



#import "RObb075_visualizzazione_risposta_nodo.typ": data as item_74, req-name as req-74

#req-uc-dict.insert(
  req-74
  ,
  item_74.fonti
  )


#{
item_74.fonti=utils.format-array(item_74.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_74)



#import "RObb076_nessuna_risposta_associata_a_nodo.typ": data as item_75, req-name as req-75

#req-uc-dict.insert(
  req-75
  ,
  item_75.fonti
  )


#{
item_75.fonti=utils.format-array(item_75.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_75)



#import "RObb077_visualizzazione_nodo_foglia.typ": data as item_76, req-name as req-76

#req-uc-dict.insert(
  req-76
  ,
  item_76.fonti
  )


#{
item_76.fonti=utils.format-array(item_76.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_76)



#import "RObb078_visualizzazione_valore_nodo_foglia.typ": data as item_77, req-name as req-77

#req-uc-dict.insert(
  req-77
  ,
  item_77.fonti
  )


#{
item_77.fonti=utils.format-array(item_77.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_77)



#import "RObb079_visualizzazione_giustificazione_decision_tree.typ": data as item_78, req-name as req-78

#req-uc-dict.insert(
  req-78
  ,
  item_78.fonti
  )


#{
item_78.fonti=utils.format-array(item_78.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_78)



#import "RObb080_visualizzazione_dettaglio_nodo_decisionale.typ": data as item_79, req-name as req-79

#req-uc-dict.insert(
  req-79
  ,
  item_79.fonti
  )


#{
item_79.fonti=utils.format-array(item_79.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_79)



#import "RObb081_visualizzazione_codice_requisito_a_dettaglio.typ": data as item_80, req-name as req-80

#req-uc-dict.insert(
  req-80
  ,
  item_80.fonti
  )


#{
item_80.fonti=utils.format-array(item_80.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_80)



#import "RObb082_visualizzazione_codice_nodo_a_dettaglio.typ": data as item_81, req-name as req-81

#req-uc-dict.insert(
  req-81
  ,
  item_81.fonti
  )


#{
item_81.fonti=utils.format-array(item_81.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_81)



#import "RObb083_visualizzazione_domanda_nodo_a_dettaglio.typ": data as item_82, req-name as req-82

#req-uc-dict.insert(
  req-82
  ,
  item_82.fonti
  )


#{
item_82.fonti=utils.format-array(item_82.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_82)



#import "RObb084_visualizzazione_risposta_nodo_a_dettaglio.typ": data as item_83, req-name as req-83

#req-uc-dict.insert(
  req-83
  ,
  item_83.fonti
  )


#{
item_83.fonti=utils.format-array(item_83.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_83)



#import "RObb085_assenza_risposta_a_dettaglio.typ": data as item_84, req-name as req-84

#req-uc-dict.insert(
  req-84
  ,
  item_84.fonti
  )


#{
item_84.fonti=utils.format-array(item_84.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_84)



#import "RObb086_valutazione_nodo_di_decisione.typ": data as item_85, req-name as req-85

#req-uc-dict.insert(
  req-85
  ,
  item_85.fonti
  )


#{
item_85.fonti=utils.format-array(item_85.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_85)



#import "RObb087_selezione_risposta_yes.typ": data as item_86, req-name as req-86

#req-uc-dict.insert(
  req-86
  ,
  item_86.fonti
  )


#{
item_86.fonti=utils.format-array(item_86.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_86)



#import "RObb088_selezione_risposta_no.typ": data as item_87, req-name as req-87

#req-uc-dict.insert(
  req-87
  ,
  item_87.fonti
  )


#{
item_87.fonti=utils.format-array(item_87.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_87)



#import "RObb089_navigazione_nodo_successivo.typ": data as item_88, req-name as req-88

#req-uc-dict.insert(
  req-88
  ,
  item_88.fonti
  )


#{
item_88.fonti=utils.format-array(item_88.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_88)



#import "RObb090_errore_nodo_senza_risposta_selezionata.typ": data as item_89, req-name as req-89

#req-uc-dict.insert(
  req-89
  ,
  item_89.fonti
  )


#{
item_89.fonti=utils.format-array(item_89.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_89)



#import "RObb091_raggiungimento_nodo_foglia.typ": data as item_90, req-name as req-90

#req-uc-dict.insert(
  req-90
  ,
  item_90.fonti
  )


#{
item_90.fonti=utils.format-array(item_90.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_90)



#import "RObb092_navigazione_nodo_precedente.typ": data as item_91, req-name as req-91

#req-uc-dict.insert(
  req-91
  ,
  item_91.fonti
  )


#{
item_91.fonti=utils.format-array(item_91.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_91)



#import "RObb093_reindirizzamento_da_nodo_root.typ": data as item_92, req-name as req-92

#req-uc-dict.insert(
  req-92
  ,
  item_92.fonti
  )


#{
item_92.fonti=utils.format-array(item_92.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_92)



#import "RObb094_inserimento_giustificazione_decision_tree.typ": data as item_93, req-name as req-93

#req-uc-dict.insert(
  req-93
  ,
  item_93.fonti
  )


#{
item_93.fonti=utils.format-array(item_93.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_93)





// ============================================================================
// 📦 ESPORTAZIONE DATI (API DEL MODULO)
// ============================================================================
// L'array 'all_data' contiene tutti i dizionari esportati dai singoli file.
// 
// Esempio di utilizzo nel tuo main.typ:
// #import "percorso/a/_index.typ": all_data
// 
#deps.tabella-requisiti(
  ..(table-cells.map(it=>{
  it.values()
}).flatten()))



// --- Fine del file generato ---