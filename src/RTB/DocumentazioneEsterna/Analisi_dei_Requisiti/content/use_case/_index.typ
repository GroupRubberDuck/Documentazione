// FILE GENERATO AUTOMATICAMENTE - NON MODIFICARE

#include "UC01_visualizza_lista_dispositivi.typ"

#include "UC01.1_visualizza_elemento_lista_dispositivi.typ"

#include "UC01.1.1_visualizza_nome_dispositivo_su_lista_dispositivi.typ"

#include "UC02_inserimento_nuovo_dispositivo.typ"

#include "UC03_annullamento_inserimento_dispositivo.typ"

#include "UC04_crea_nuovo_dispositivo.typ"

#include "UC04.1_inserimento_nome_dispositivo.typ"

#include "UC04.1.1_errore_nome_dispositivo_non_valido.typ"

#include "UC04.2_inserimento_sistema_operativo_dispositivo.typ"

#include "UC04.3_inserimento_descrizione_dispositivo.typ"

#include "UC05_importa_dispositivo.typ"

#include "UC05.1_selezione_file_sorgente.typ"

#include "UC05.1.1_selezione_file_json.typ"

#include "UC05.1.2_selezione_file_xml.typ"

#include "UC05.1.3_selezione_file_csv.typ"

#include "UC06_errore_file_dispositivo_non_valido.typ"

#include "UC07_visualizza_dati_dispositivo.typ"

#include "UC07.1_visualizza_nome_dispositivo.typ"

#include "UC07.2_visualizza_sistema_operativo_dispositivo.typ"

#include "UC07.3_visualizza_descrizione_dispositivo.typ"

#include "UC07.4_visualizza_modello_associato_al_dispositivo.typ"

#include "UC07.4.1_visualizza_nome_modello_associato.typ"

#include "UC07.4.2_visualizza_versione_modello_associato.typ"

#include "UC08_modifica_dispositivo.typ"

#include "UC08.1_modifica_nome_dispositivo.typ"

#include "UC08.1.1_errore_modifica_nome_dispositivo_non_valido.typ"

#include "UC08.2_modifica_sistema_operativo_dispositivo.typ"

#include "UC08.3_modifica_descrizione_dispositivo.typ"

#include "UC08.4_annulla_modifiche_dispositivo.typ"

#include "UC09_elimina_dispositivo.typ"

#include "UC09.1_elimina_dispositivo_direttamente.typ"

#include "UC09.2_elimina_dispositivo_con_back_up.typ"

#include "UC09.2.1_elimina_dispositivo_con_back_up_json.typ"

#include "UC09.2.2_elimina_dispositivo_con_back_up_xml.typ"

#include "UC09.2.3_elimina_dispositivo_con_back_up_csv.typ"

#include "UC10_avvia_valutazione_dispositivo.typ"

#include "UC11_scarta_modifiche_valutazione.typ"

#include "UC12_salva_valutazione.typ"

#include "UC12.1_salva_e_chiudi_valutazione_dispositivo.typ"

#include "UC12.2_salva_e_continua_valutazione_dispositivo.typ"

#include "UC13_errore_salvataggio_valutazione.typ"

#include "UC14_aggiunta_asset.typ"

#include "UC14.1_inserisci_nome_asset.typ"

#include "UC14.1.1_errore_nome_asset_non_valido.typ"

#include "UC14.2_seleziona_tipo_asset.typ"

#include "UC14.2.1_seleziona_security_asset.typ"

#include "UC14.2.2_seleziona_network_asset.typ"

#include "UC14.3_inserisci_descrizione_asset.typ"

#include "UC15_annulla_aggiunta_asset.typ"

#include "UC16_visualizza_dashboard_dispositivo.typ"

#include "UC16.1_visualizza_dati_dispositivo_su_dashboard.typ"

#include "UC16.1.1_visualizza_nome_dispositivo_su_dashboard.typ"

#include "UC16.1.2_visualizza_sistema_operativo_dispositivo_su_dashboard.typ"

#include "UC16.1.3_visualizza_descrizione_dispositivo_su_dashboard.typ"

#include "UC16.2_visualizza_stato_aggregato_dispositivo.typ"

#include "UC16.3_visualizza_lista_asset.typ"

#include "UC16.3.1_visualizza_singolo_elemento_lista_asset.typ"

#include "UC16.3.1.1_visualizza_nome_asset_lista_asset.typ"

#include "UC16.3.1.2_visualizza_tipo_asset_lista_asset.typ"

#include "UC16.3.1.3_visualizza_stato_aggregato_asset_lista_asset.typ"

#include "UC17_visualizza_dettaglio_asset.typ"

#include "UC17.1_visualizza_nome_asset.typ"

#include "UC17.2_visualizza_tipo_asset.typ"

#include "UC17.3_visualizza_stato_aggregato_asset.typ"

#include "UC17.4_visualizza_descrizione_asset.typ"

#include "UC17.5_visualizza_lista_requisiti_asset.typ"

#include "UC17.5.1_visualizza_elemento_lista_requisiti_asset.typ"

#include "UC17.5.1.1_visualizza_codice_requisito_da_lista_requisiti.typ"

#include "UC17.5.1.2_visualizza_stato_valutazione_requisito_da_lista_requisiti.typ"

#include "UC18_elimina_asset.typ"

#include "UC19_modifica_asset.typ"

#include "UC19.1_modifica_nome_asset.typ"

#include "UC19.1.1_errore_modifica_nome_asset_non_valido.typ"

#include "UC19.2_modifica_tipo_asset.typ"

#include "UC19.2.1_seleziona_nuovo_tipo_security_asset.typ"

#include "UC19.2.2_seleziona_nuovo_tipo_network_asset.typ"

#include "UC19.3_modifica_descrizione_asset.typ"

#include "UC20_annulla_modifica_asset.typ"

#include "UC21_esporta_informazioni_dispositivo.typ"

#include "UC21.1_esporta_in_xml.typ"

#include "UC21.2_esporta_in_json.typ"

#include "UC21.3_esporta_in_csv.typ"

#include "UC22_visualizza_dettaglio_requisito.typ"

#include "UC22.1_visualizza_codice_requisito.typ"

#include "UC22.2_visualizza_nome_del_requisito.typ"

#include "UC22.3_visualizza_descrizione_normativa.typ"

#include "UC22.4_visualizza_stato_valutazione_requisito.typ"

#include "UC22.4.1_visualizza_stato_pass_requisito.typ"

#include "UC22.4.2_visualizza_stato_fail_requisito.typ"

#include "UC22.4.3_visualizza_stato_na_requisito.typ"

#include "UC22.4.4_visualizza_stato_in_corso_requisito.typ"

#include "UC22.4.5_visualizza_stato_sospeso_requisito.typ"

#include "UC22.5_visualizza_lista_dipendenze_requisito.typ"

#include "UC22.5.1_visualizza_sintesi_dipendenza.typ"

#include "UC22.5.1.1_visualizza_codice_dipendenza.typ"

#include "UC22.5.1.2_visualizza_stato_dipendenza.typ"

#include "UC22.6_visualizza_decision_tree.typ"

#include "UC22.6.1_visualizza_nodo_decision_tree.typ"

#include "UC22.6.1.1_visualizza_stato_attività.typ"

#include "UC22.6.2_visualizza_nodo_di_decisione.typ"

#include "UC22.6.2.1_visualizza_codice_requisito_dt.typ"

#include "UC22.6.2.2_visualizza_codice_nodo.typ"

#include "UC22.6.2.3_visualizza_domanda_nodo.typ"

#include "UC22.6.2.4_visualizza_risposta_nodo.typ"

#include "UC22.6.2.4.1_nessuna_risposta_associata.typ"

#include "UC22.6.3_visualizza_nodo_foglia.typ"

#include "UC22.6.3.1_visualizza_valore_nodo_foglia.typ"

#include "UC22.7_visualizza_giustificazione_decision_tree.typ"

#include "UC23_visualizza_dettaglio_nodo_decisionale.typ"

#include "UC23.1_visualizza_codice_requisito_a_dettaglio.typ"

#include "UC23.2_visualizza_codice_nodo_a_dettaglio.typ"

#include "UC23.3_visualizza_domanda_nodo_a_dettaglio.typ"

#include "UC23.4_visualizza_risposta_nodo_a_dettaglio.typ"

#include "UC23.4.1_mostra_assenza_di_risposta_a_dettaglio.typ"

#include "UC24_valuta_nodo_di_decisione.typ"

#include "UC24.1_inserisci_risposta_nodo_decision_tree.typ"

#include "UC24.1.1_seleziona_yes.typ"

#include "UC24.1.2_seleziona_no.typ"

#include "UC25_vai_al_nodo_successivo.typ"

#include "UC25.1_nodo_senza_risposta_selezionata.typ"

#include "UC25.2_nodo_successore_foglia.typ"

#include "UC26_vai_al_nodo_precedente.typ"

#include "UC26.1_nodo_corrente_root.typ"

#include "UC27_inserisci_giustificazione_decision_tree.typ"

#include "UC28_esporta_report_di_conformità.typ"

#include "UC28.1_esporta_report_in_pdf.typ"

#include "UC29_visualizza_lista_modelli.typ"

#include "UC29.1_visualizza_elemento_lista_modelli.typ"

#include "UC29.1.1_visualizza_nome_modello_da_lista_modelli.typ"

#include "UC29.1.2_visualizza_versione_modello_da_lista_modelli.typ"

#include "UC30_visualizza_dettaglio_modello.typ"

#include "UC30.1_visualizza_id_modello.typ"

#include "UC30.2_visualizza_nome_modello.typ"

#include "UC30.3_visualizza_versione_modello.typ"

#include "UC30.4_visualizza_lista_requisiti_modello.typ"

#include "UC30.4.1_visualizza_singolo_elemento_lista_requisiti_modello.typ"

#include "UC30.4.1.1_visualizza_codice_requisito_da_lista_requisiti_modello.typ"

#include "UC30.4.1.2_visualizza_nome_requisito_da_lista_requisiti_modello.typ"

#include "UC31_inserisci_nuovo_modello.typ"

#include "UC31.1_crea_nuovo_modello.typ"

#include "UC31.1.1_inserisci_nome_modello.typ"

#include "UC31.1.1.1_errore_nome_nuovo_modello_non_valido.typ"

#include "UC31.2_importa_nuovo_modello.typ"

#include "UC31.2.1_errore_modello_esistente.typ"

#include "UC31.3_importa_modello_file_xml.typ"

#include "UC31.4_importa_modello_file_json.typ"

#include "UC32_annulla_inserimento_modello.typ"

#include "UC33_modifica_anagrafica_modello.typ"

#include "UC33.1_modifica_nome_modello.typ"

#include "UC33.1.1_errore_modifica_nome_modello.typ"

#include "UC34_avvia_modifica_modello.typ"

#include "UC35_salva_modifica_modello.typ"

#include "UC35.1_errore_struttura_non_valida_per_il_salvataggio.typ"

#include "UC36_scarta_modifica_modello.typ"

#include "UC37_elimina_modello.typ"

#include "UC38_visualizza_dettaglio_requisito_modello.typ"

#include "UC38.1_visualizza_anagrafica_requisito_modello.typ"

#include "UC38.1.1_visualizza_codice_requisito_modello.typ"

#include "UC38.1.2_visualizza_nome_del_requisito_modello.typ"

#include "UC38.1.3_visualizza_descrizione_modello.typ"

#include "UC38.2_visualizza_lista_dipendenze.typ"

#include "UC38.2.1_visualizza_codice_dipendenze.typ"

#include "UC38.3_visualizza_lista_non_dipendenze.typ"

#include "UC38.3.1_visualizza_codice_non_dipendenze.typ"

#include "UC38.4_visualizza_decision_tree_requisito_modello.typ"

#include "UC38.4.1_visualizza_nodo_decision_tree_modello.typ"

#include "UC38.4.1.1_visualizza_nodo_decisione_modello.typ"

#include "UC38.4.1.1.1_visualizza_codice_requisito_padre_modello.typ"

#include "UC38.4.1.1.2_visualizza_codice_nodo_modello.typ"

#include "UC38.4.1.1.3_visualizza_domanda_nodo_modello.typ"

#include "UC38.4.1.2_visualizza_nodo_foglia_modello.typ"

#include "UC39_visualizza_dettaglio_nodo_modello_decision_tree.typ"

#include "UC39.1_visualizza_dettaglio_nodo_decisione_modello.typ"

#include "UC39.1.1_visualizza_dettaglio_codice_requisito_padre_modello.typ"

#include "UC39.1.2_visualizza_dettaglio_codice_nodo_modello.typ"

#include "UC39.1.3_visualizza_dettaglio_domanda_nodo_modello.typ"

#include "UC39.2_visualizza_dettaglio_nodo_foglia_modello.typ"

#include "UC40_aggiungi_requisito.typ"

#include "UC40.1_inserisci_codice_requisito.typ"

#include "UC40.1.1_errore_codice_requisito_lunghezza_non_valida.typ"

#include "UC40.1.2_errore_codice_requisito_duplicato.typ"

#include "UC40.2_inserisci_nome_requisito.typ"

#include "UC40.2.1_errore_nome_requisito_non_valido.typ"

#include "UC40.3_inserisci_descrizione_requisito.typ"

#include "UC41_elimina_requisito.typ"

#include "UC42_modifica_anagrafica_requisito.typ"

#include "UC42.1_modifica_codice_requisito.typ"

#include "UC42.1.1_errore_modifica_codice_requisito_lunghezza_non_valida.typ"

#include "UC42.1.2_errore_modifica_codice_requisito_duplicato.typ"

#include "UC42.2_modifica_nome_requisito.typ"

#include "UC42.2.1_errore_modifica_nome_requisito_non_valido.typ"

#include "UC42.3_modifica_descrizione_requisito.typ"

#include "UC43_aggiungi_dipendenza.typ"

#include "UC43.1_errore_dipendenza_circolare.typ"

#include "UC43.1.1_visualizza_grafo_dipendenze.typ"

#include "UC44_rimuovi_dipendenza.typ"

#include "UC45_aggiungi_nodo_figlio.typ"

#include "UC45.1_aggiungi_nodo_figlio_sinistro.typ"

#include "UC45.2_aggiungi_nodo_figlio_destro.typ"

#include "UC46_aggiungi_nodo.typ"

#include "UC46.1_aggiungi_nodo_foglia.typ"

#include "UC46.1.1_aggiungi_nodo_pass.typ"

#include "UC46.1.2_aggiungi_nodo_fail.typ"

#include "UC46.1.3_aggiungi_nodo_na.typ"

#include "UC46.2_aggiungi_nodo_di_decisione.typ"

#include "UC46.2.1_inserisci_codice_nodo_decision_tree.typ"

#include "UC46.2.1.1_errore_codice_nodo_non_valido.typ"

#include "UC46.2.1.2_errore_codice_nodo_già_esistente.typ"

#include "UC46.2.2_inserisci_domanda_nodo_decision_tree.typ"

#include "UC46.2.2.1_errore_domanda_vuota.typ"

#include "UC47_modifica_nodo.typ"

#include "UC47.1_modifica_codice_nodo_decision_tree.typ"

#include "UC47.1.1_errore_modifica_codice_nodo_non_valido.typ"

#include "UC47.1.2_errore_modifica_codice_nodo_già_esistente.typ"

#include "UC47.2_modifica_domanda_nodo_decision_tree.typ"

#include "UC47.2.1_errore_modifica_domanda_vuota.typ"

#include "UC48_rimuovi_nodo.typ"

#include "UC49_errore_nodo_root.typ"

#include "UC50_esporta_modello.typ"

#include "UC50.1_esporta_modello_in_xml.typ"

#include "UC50.2_esporta_modello_in_json.typ"

