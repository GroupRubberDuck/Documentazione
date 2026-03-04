// FILE GENERATO AUTOMATICAMENTE - NON MODIFICARE

#include "UC01_inserimento_nuovo_dispositivo.typ"

#include "UC02_valutazione_dispositivo_in_corso.typ"

#include "UC03_annullamento_inserimento_dispositivo.typ"

#include "UC04_crea_nuovo_dispositivo.typ"

#include "UC04.1_inserimento_nome_dispositivo.typ"

#include "UC04.2_inserimento_sistema_operativo_dispositivo.typ"

#include "UC04.3_inserimento_descrizione_dispositivo.typ"

#include "UC05_importa_dispositivo.typ"

#include "UC05.1_selezione_file_sorgente.typ"

#include "UC05.1.1_selezione_file_json.typ"

#include "UC05.1.2_selezione_file_xml.typ"

#include "UC05.1.3_selezione_file_csv.typ"

#include "UC06_errore_nella_lettura_del_file.typ"

#include "UC07_visualizza_dati_dispositivo.typ"

#include "UC07.1_visualizza_nome_dispositivo.typ"

#include "UC07.2_visualizza_sistema_operativo_dispositivo.typ"

#include "UC07.3_visualizza_descrizione_dispositivo.typ"

#include "UC08_modifica_dispositivo.typ"

#include "UC09_elimina_dispositivo.typ"

#include "UC10_salva_valutazione.typ"

#include "UC10.1_salva_in_xml.typ"

#include "UC10.2_salva_in_csv.typ"

#include "UC10.3_salva_in_json.typ"

#include "UC11_errore_durante_il_salvataggio.typ"

#include "UC12_aggiunta_asset_tramite_interfaccia.typ"

#include "UC12.1_inserimento_dati_non_validi.typ"

#include "UC13_annulla_aggiunta.typ"

#include "UC14_visualizza_riepilogo_importazione.typ"

#include "UC15_elimina_asset.typ"

#include "UC16_modifica_asset.typ"

#include "UC16.1_inserisci_nome_asset.typ"

#include "UC16.2_seleziona_tipo_asset.typ"

#include "UC16.3_inserisci_descrizione_asset.typ"

#include "UC17_annulla_modifica_asset.typ"

#include "UC18_cerca_asset.typ"

#include "UC19_esporta_informazioni_dispositivo.typ"

#include "UC19.1_esporta_in_.xml.typ"

#include "UC19.2_esporta_in_.json.typ"

#include "UC19.3_esporta_in_.csv.typ"

#include "UC20_visualizza_dashboard_dispositivo.typ"

#include "UC20.1_visualizza_stato_aggregato_dispositivo.typ"

#include "UC20.2_visualizza_lista_asset.typ"

#include "UC20.2.1_visualizzazione_singolo_elemento_della_lista_di_asset.typ"

#include "UC20.2.1.1_visualizza_nome.typ"

#include "UC20.2.1.2_visualizza_tipo.typ"

#include "UC20.2.1.3_visualizza_stato_aggregato_asset.typ"

#include "UC21_visualizza_dettaglio_asset.typ"

#include "UC21.1_visualizza_descrizione_asset.typ"

#include "UC21.2_visualizza_lista_requisiti_asset.typ"

#include "UC21.2.1_visualizzazione_generale_requisito.typ"

#include "UC21.2.1.1_visualizza_nome_requisito.typ"

#include "UC21.2.1.2_visualizza_stato_valutazione.typ"

#include "UC21.2.2_visualizzazione_in_dettaglio_requisito.typ"

#include "UC21.2.2.1_visualizza_codice_requisito.typ"

#include "UC21.2.2.2_visualizza_descrizione_normativa.typ"

#include "UC21.2.2.3_visualizza_dipendenze_requisito.typ"

#include "UC21.2.2.4_visualizza_decision_tree.typ"

#include "UC21.2.2.4.1_visualizza_generale_nodo_decision_tree.typ"

#include "UC21.2.2.4.1.1_visualizza_codice_nodo.typ"

#include "UC21.2.2.4.1.2_visualizza_domanda_nodo.typ"

#include "UC21.2.2.4.1.3_visualizza_risposta_nodo.typ"

#include "UC21.2.2.4.2_visualizza_dettaglio_nodo_decision_tree.typ"

#include "UC21.2.2.4.2.1_visualizza_evidenze_del_nodo.typ"

#include "UC21.2.2.4.2.1.1_visualizza_info.typ"

#include "UC21.2.2.4.2.1.2_visualizza_just.typ"

#include "UC22_compila_decision_tree.typ"

#include "UC22.1_compilazione_nodo.typ"

#include "UC22.1.1_selezione_risposta_del_nodo.typ"

#include "UC22.1.1.1_seleziona_yes.typ"

#include "UC22.1.1.2_seleziona_no.typ"

#include "UC22.1.2_inserisci_evidenze.typ"

#include "UC22.1.2.1_inserisci_info.typ"

#include "UC22.1.2.2_inserisci_just.typ"

#include "UC22.2_navigazione_del_dt.typ"

#include "UC22.2.1_vai_al_nodo_successivo.typ"

#include "UC22.2.2_errore_nodo_senza_risposta_selezionata.typ"

#include "UC22.2.3_vai_al_nodo_precedente.typ"

#include "UC22.2.4_errore_nodo_corrente_è_root.typ"

#include "UC22.3_inserisci_justification.typ"

#include "UC23_esporta_report_di_conformità.typ"

#include "UC23.1_esporta_report_in_pdf.typ"

#include "UC24_modifica_requisito.typ"

#include "UC24.1_modifica_anagrafica_del_requisito.typ"

#include "UC24.1.1_modifica_nome_del_requisito.typ"

#include "UC24.1.2_modifica_descrizione_normativa_del_requisito.typ"

#include "UC24.2_modifica_dipendenze.typ"

#include "UC24.2.1_aggiungi_dipendenza.typ"

#include "UC24.2.2_rimuovi_dipendenza.typ"

#include "UC24.2.3_errore_dipendenza_circolare.typ"

#include "UC24.3_modifica_decision_tree.typ"

#include "UC24.3.1_aggiungi_nodo.typ"

#include "UC24.3.1.1_inserimento_codice_univoco_nodo.typ"

#include "UC24.3.1.2_inserimento_testo_domanda_nodo.typ"

#include "UC24.3.1.3_aggiungi_nodo_foglia.typ"

#include "UC24.3.1.3.1_aggiungi_nodo_pass.typ"

#include "UC24.3.1.3.2_aggiungi_nodo_fail.typ"

#include "UC24.3.1.3.3_aggiungi_nodo_not_applicable.typ"

#include "UC24.3.1.4_aggiungi_nodo_di_decisione.typ"

#include "UC24.3.2_rimuovi_nodo.typ"

#include "UC24.3.2.1_tentativo_eliminazione_nodo_root.typ"

#include "UC24.3.2.2_nodo_ha_figli_collegati.typ"

#include "UC24.3.3_modifica_nodo.typ"

#include "UC24.3.3.1_modifica_testo_di_una_domanda.typ"

#include "UC24.3.3.2_modifica_descrizione_evidenza_richiesta.typ"

#include "UC24.3.3.3_modifica_destinazione_collegamento.typ"

#include "UC24.3.4_salva_modifiche_dt.typ"

#include "UC24.3.4.1_struttura_dt_non_valida.typ"

#include "UC25_annulla_modifiche_requisito.typ"

#include "UC26_salva_modifiche_requisito.typ"

#include "UC27_esporta_decision_tree.typ"

