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

#include "UC09_annulla_modifiche_dispositivo.typ"

#include "UC10_elimina_dispositivo.typ"

#include "UC10.1_elimina_dispositivo_direttamente.typ"

#include "UC10.2_elimina_dispositivo_con_back_up.typ"

#include "UC10.2.1_elimina_dispositivo_con_back_up_json.typ"

#include "UC10.2.2_elimina_dispositivo_con_back_up_xml.typ"

#include "UC10.2.3_elimina_dispositivo_con_back_up_csv.typ"

#include "UC11_avvia_valutazione_dispositivo.typ"

#include "UC12_scarta_modifiche_valutazione.typ"

#include "UC13_salva_valutazione.typ"

#include "UC13.1_salva_e_chiudi_valutazione_dispositivo.typ"

#include "UC13.2_salva_e_continua_valutazione_dispositivo.typ"

#include "UC14_errore_salvataggio_valutazione.typ"

#include "UC15_aggiunta_asset.typ"

#include "UC15.1_inserisci_nome_asset.typ"

#include "UC15.1.1_errore_nome_asset_non_valido.typ"

#include "UC15.2_seleziona_tipo_asset.typ"

#include "UC15.2.1_seleziona_security_asset.typ"

#include "UC15.2.2_seleziona_network_asset.typ"

#include "UC15.3_inserisci_descrizione_asset.typ"

#include "UC16_annulla_aggiunta_asset.typ"

#include "UC17_visualizza_dashboard_dispositivo.typ"

#include "UC17.1_visualizza_dati_dispositivo_su_dashboard.typ"

#include "UC17.1.1_visualizza_nome_dispositivo_su_dashboard.typ"

#include "UC17.1.2_visualizza_sistema_operativo_dispositivo_su_dashboard.typ"

#include "UC17.1.3_visualizza_descrizione_dispositivo_su_dashboard.typ"

#include "UC17.2_visualizza_stato_aggregato_dispositivo.typ"

#include "UC17.3_visualizza_lista_asset.typ"

#include "UC17.3.1_visualizza_singolo_elemento_lista_asset.typ"

#include "UC17.3.1.1_visualizza_nome_asset_lista_asset.typ"

#include "UC17.3.1.2_visualizza_tipo_asset_lista_asset.typ"

#include "UC17.3.1.3_visualizza_stato_aggregato_asset_lista_asset.typ"

#include "UC18_visualizza_dettaglio_asset.typ"

#include "UC18.1_visualizza_nome_asset.typ"

#include "UC18.2_visualizza_tipo_asset.typ"

#include "UC18.3_visualizza_stato_aggregato_asset.typ"

#include "UC18.4_visualizza_descrizione_asset.typ"

#include "UC18.5_visualizza_lista_requisiti_asset.typ"

#include "UC18.5.1_visualizza_elemento_lista_requisiti_asset.typ"

#include "UC18.5.1.1_visualizza_codice_requisito_da_lista_requisiti.typ"

#include "UC18.5.1.2_visualizza_stato_valutazione_requisito_da_lista_requisiti.typ"

#include "UC19_elimina_asset.typ"

#include "UC20_modifica_asset.typ"

#include "UC20.1_modifica_nome_asset.typ"

#include "UC20.1.1_errore_modifica_nome_asset_non_valido.typ"

#include "UC20.2_modifica_tipo_asset.typ"

#include "UC20.2.1_seleziona_nuovo_tipo_security_asset.typ"

#include "UC20.2.2_seleziona_nuovo_tipo_network_asset.typ"

#include "UC20.3_modifica_descrizione_asset.typ"

#include "UC21_annulla_modifica_asset.typ"

#include "UC22_esporta_informazioni_dispositivo.typ"

#include "UC22.1_esporta_in_json.typ"

#include "UC22.2_esporta_in_xml.typ"

#include "UC22.3_esporta_in_csv.typ"

#include "UC23_valuta_asset.typ"

#include "UC24_visualizza_dettaglio_requisito.typ"

#include "UC24.1_visualizza_codice_requisito.typ"

#include "UC24.2_visualizza_nome_del_requisito.typ"

#include "UC24.3_visualizza_descrizione_normativa.typ"

#include "UC24.4_visualizza_stato_valutazione_requisito.typ"

#include "UC24.4.1_visualizza_stato_pass_requisito.typ"

#include "UC24.4.2_visualizza_stato_fail_requisito.typ"

#include "UC24.4.3_visualizza_stato_na_requisito.typ"

#include "UC24.4.4_visualizza_stato_in_corso_requisito.typ"

#include "UC24.4.5_visualizza_stato_sospeso_requisito.typ"

#include "UC24.5_visualizza_lista_dipendenze_requisito.typ"

#include "UC24.5.1_visualizza_sintesi_dipendenza.typ"

#include "UC24.5.1.1_visualizza_codice_dipendenza.typ"

#include "UC24.5.1.2_visualizza_stato_dipendenza.typ"

#include "UC24.6_visualizza_decision_tree.typ"

#include "UC24.6.1_visualizza_nodo_decision_tree.typ"

#include "UC24.6.1.1_visualizza_stato_attività.typ"

#include "UC24.6.2_visualizza_nodo_di_decisione.typ"

#include "UC24.6.2.1_visualizza_codice_requisito_dt.typ"

#include "UC24.6.2.2_visualizza_codice_nodo.typ"

#include "UC24.6.2.3_visualizza_domanda_nodo.typ"

#include "UC24.6.2.4_visualizza_risposta_nodo.typ"

#include "UC24.6.2.4.1_nessuna_risposta_associata.typ"

#include "UC24.6.3_visualizza_nodo_foglia.typ"

#include "UC24.6.3.1_visualizza_valore_nodo_foglia.typ"

#include "UC24.7_visualizza_giustificazione_decision_tree.typ"

#include "UC25_visualizza_dettaglio_nodo_decisionale.typ"

#include "UC25.1_visualizza_codice_requisito_a_dettaglio.typ"

#include "UC25.2_visualizza_codice_nodo_a_dettaglio.typ"

#include "UC25.3_visualizza_domanda_nodo_a_dettaglio.typ"

#include "UC25.4_visualizza_risposta_nodo_a_dettaglio.typ"

#include "UC25.4.1_mostra_assenza_di_risposta_a_dettaglio.typ"

#include "UC26_valuta_nodo_di_decisione.typ"

#include "UC26.1_inserisci_risposta_nodo_decision_tree.typ"

#include "UC26.1.1_seleziona_yes.typ"

#include "UC26.1.2_seleziona_no.typ"

#include "UC27_vai_al_nodo_successivo.typ"

#include "UC27.1_nodo_senza_risposta_selezionata.typ"

#include "UC27.2_nodo_successore_foglia.typ"

#include "UC28_vai_al_nodo_precedente.typ"

#include "UC28.1_nodo_corrente_root.typ"

#include "UC29_inserisci_giustificazione_decision_tree.typ"

#include "UC30_esporta_report_di_conformità.typ"

#include "UC30.1_esporta_report_in_pdf.typ"

#include "UC31_visualizza_lista_modelli.typ"

#include "UC31.1_visualizza_elemento_lista_modelli.typ"

#include "UC31.1.1_visualizza_nome_modello_da_lista_modelli.typ"

#include "UC31.1.2_visualizza_versione_modello_da_lista_modelli.typ"

#include "UC32_visualizza_dettaglio_modello.typ"

#include "UC32.1_visualizza_id_modello.typ"

#include "UC32.2_visualizza_nome_modello.typ"

#include "UC32.3_visualizza_versione_modello.typ"

#include "UC32.4_visualizza_lista_requisiti_modello.typ"

#include "UC32.4.1_visualizza_singolo_elemento_lista_requisiti_modello.typ"

#include "UC32.4.1.1_visualizza_codice_requisito_da_lista_requisiti_modello.typ"

#include "UC32.4.1.2_visualizza_nome_requisito_da_lista_requisiti_modello.typ"

#include "UC33_inserisci_nuovo_modello.typ"

#include "UC33.1_crea_nuovo_modello.typ"

#include "UC33.1.1_inserisci_nome_modello.typ"

#include "UC33.1.1.1_errore_nome_nuovo_modello_non_valido.typ"

#include "UC33.2_importa_nuovo_modello.typ"

#include "UC33.2.1_errore_modello_esistente.typ"

#include "UC33.3_importa_modello_file_json.typ"

#include "UC33.4_importa_modello_file_xml.typ"

#include "UC34_annulla_inserimento_modello.typ"

#include "UC35_modifica_anagrafica_modello.typ"

#include "UC35.1_modifica_nome_modello.typ"

#include "UC35.1.1_errore_modifica_nome_modello.typ"

#include "UC36_modifica_modello.typ"

#include "UC37_salva_modifica_modello.typ"

#include "UC37.1_salva_modifica_major.typ"

#include "UC37.2_salva_modifica_minor.typ"

#include "UC37.3_errore_struttura_non_valida_per_il_salvataggio.typ"

#include "UC38_scarta_modifica_modello.typ"

#include "UC39_elimina_modello.typ"

#include "UC40_visualizza_dettaglio_requisito_modello.typ"

#include "UC40.1_visualizza_anagrafica_requisito_modello.typ"

#include "UC40.1.1_visualizza_codice_requisito_modello.typ"

#include "UC40.1.2_visualizza_nome_del_requisito_modello.typ"

#include "UC40.1.3_visualizza_descrizione_modello.typ"

#include "UC40.2_visualizza_lista_dipendenze.typ"

#include "UC40.2.1_visualizza_codice_dipendenze.typ"

#include "UC40.3_visualizza_lista_non_dipendenze.typ"

#include "UC40.3.1_visualizza_codice_non_dipendenze.typ"

#include "UC40.4_visualizza_decision_tree_requisito_modello.typ"

#include "UC40.4.1_visualizza_nodo_decision_tree_modello.typ"

#include "UC40.4.1.1_visualizza_nodo_decisione_modello.typ"

#include "UC40.4.1.1.1_visualizza_codice_requisito_padre_modello.typ"

#include "UC40.4.1.1.2_visualizza_codice_nodo_modello.typ"

#include "UC40.4.1.1.3_visualizza_domanda_nodo_modello.typ"

#include "UC40.4.1.2_visualizza_nodo_foglia_modello.typ"

#include "UC41_visualizza_dettaglio_nodo_modello_decision_tree.typ"

#include "UC41.1_visualizza_dettaglio_nodo_decisione_modello.typ"

#include "UC41.1.1_visualizza_dettaglio_codice_requisito_padre_modello.typ"

#include "UC41.1.2_visualizza_dettaglio_codice_nodo_modello.typ"

#include "UC41.1.3_visualizza_dettaglio_domanda_nodo_modello.typ"

#include "UC41.2_visualizza_dettaglio_nodo_foglia_modello.typ"

#include "UC42_aggiungi_requisito.typ"

#include "UC42.1_inserisci_codice_requisito.typ"

#include "UC42.1.1_errore_codice_requisito_non_valido.typ"

#include "UC42.1.2_errore_codice_requisito_duplicato.typ"

#include "UC42.2_inserisci_nome_requisito.typ"

#include "UC42.2.1_errore_nome_requisito_non_valido.typ"

#include "UC42.3_inserisci_descrizione_requisito.typ"

#include "UC43_elimina_requisito.typ"

#include "UC44_modifica_anagrafica_requisito.typ"

#include "UC44.1_modifica_codice_requisito.typ"

#include "UC44.1.1_errore_modifica_codice_requisito_non_valido.typ"

#include "UC44.1.2_errore_modifica_codice_requisito_duplicato.typ"

#include "UC44.2_modifica_nome_requisito.typ"

#include "UC44.2.1_errore_modifica_nome_requisito_non_valido.typ"

#include "UC44.3_modifica_descrizione_requisito.typ"

#include "UC45_aggiungi_dipendenza.typ"

#include "UC45.1_errore_dipendenza_circolare.typ"


#include "UC46_rimuovi_dipendenza.typ"

#include "UC47_aggiungi_nodo_figlio.typ"

#include "UC47.1_aggiungi_nodo_figlio_yes.typ"

#include "UC47.2_aggiungi_nodo_figlio_no.typ"

#include "UC48_aggiungi_nodo.typ"

#include "UC48.1_aggiungi_nodo_foglia.typ"

#include "UC48.1.1_aggiungi_nodo_pass.typ"

#include "UC48.1.2_aggiungi_nodo_fail.typ"

#include "UC48.1.3_aggiungi_nodo_na.typ"

#include "UC48.2_aggiungi_nodo_di_decisione.typ"

#include "UC48.2.1_inserisci_codice_nodo_decision_tree.typ"

#include "UC48.2.1.1_errore_codice_nodo_non_valido.typ"

#include "UC48.2.1.2_errore_codice_nodo_già_esistente.typ"

#include "UC48.2.2_inserisci_domanda_nodo_decision_tree.typ"

#include "UC48.2.2.1_errore_domanda_vuota.typ"

#include "UC49_modifica_nodo.typ"

#include "UC49.1_modifica_codice_nodo_decision_tree.typ"

#include "UC49.1.1_errore_modifica_codice_nodo_non_valido.typ"

#include "UC49.1.2_errore_modifica_codice_nodo_già_esistente.typ"

#include "UC49.2_modifica_domanda_nodo_decision_tree.typ"

#include "UC49.2.1_errore_modifica_domanda_vuota.typ"

#include "UC50_rimuovi_nodo.typ"

#include "UC51_errore_nodo_root.typ"

#include "UC52_esporta_modello.typ"

#include "UC52.1_esporta_modello_in_json.typ"

#include "UC52.2_esporta_modello_in_xml.typ"

