// FILE GENERATO AUTOMATICAMENTE - NON MODIFICARE

#include "UC01_visualizza_lista_dispositivi.typ"

#include "UC01.1_visualizza_elemento_lista_dispositivi.typ"

#include "UC02_valuta_dispositivo.typ"

#include "UC03_inserimento_nuovo_dispositivo.typ"

#include "UC04_annullamento_inserimento_dispositivo.typ"

#include "UC05_crea_nuovo_dispositivo.typ"

#include "UC05.1_inserimento_nome_dispositivo.typ"

#include "UC05.2_inserimento_sistema_operativo_dispositivo.typ"

#include "UC05.3_inserimento_descrizione_dispositivo.typ"

#include "UC06_importa_dispositivo.typ"

#include "UC06.1_selezione_file_sorgente.typ"

#include "UC06.1.1_selezione_file_json.typ"

#include "UC06.1.2_selezione_file_xml.typ"

#include "UC06.1.3_selezione_file_csv.typ"

#include "UC06.2_visualizza_riepilogo_importazione.typ"

#include "UC07_errore_nella_lettura_del_file.typ"

#include "UC08_visualizza_dati_dispositivo.typ"

#include "UC08.1_visualizza_nome_dispositivo.typ"

#include "UC08.2_visualizza_sistema_operativo_dispositivo.typ"

#include "UC08.3_visualizza_descrizione_dispositivo.typ"

#include "UC09_modifica_dispositivo.typ"

#include "UC09.1_annulla_modifiche_dispositivo.typ"

#include "UC10_scarta_modifiche_valutazione.typ"

#include "UC10.1_annulla_scarto_modifiche.typ"

#include "UC11_salva_valutazione.typ"

#include "UC12_errore_salvataggio_valutazione.typ"

#include "UC13_aggiunta_asset_tramite_interfaccia.typ"

#include "UC14_annulla_aggiunta_asset.typ"

#include "UC15_elimina_asset.typ"

#include "UC16_modifica_asset.typ"

#include "UC16.1_inserisci_nome_asset.typ"

#include "UC16.1.1_errore_nome_asset_non_valido.typ"

#include "UC16.2_seleziona_tipo_asset.typ"

#include "UC16.2.1_seleziona_security_asset.typ"

#include "UC16.2.2_seleziona_network_asset.typ"

#include "UC16.3_inserisci_descrizione_asset.typ"

#include "UC17_annulla_modifica_asset.typ"

#include "UC18_cerca_asset.typ"

#include "UC19_esporta_informazioni_dispositivo.typ"

#include "UC19.1_esporta_in_xml.typ"

#include "UC19.2_esporta_in_json.typ"

#include "UC19.3_esporta_in_csv.typ"

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

#include "UC24_avvia_modifica_requisito.typ"

#include "UC25_salva_modifica_requisito.typ"

#include "UC26_annulla_modifica_requisito.typ"

#include "UC27_modifica_anagrafica_requisito.typ"

#include "UC27.1_inserisci_codice_requisito.typ"

#include "UC27.1.1_errore_codice_requisito_lunghezza_non_valida.typ"

#include "UC27.1.2_errore_codice_requisito_duplicato.typ"

#include "UC27.2_inserisci_nome_requisito.typ"

#include "UC27.2.1_errore_nome_requisito_non_valido.typ"

#include "UC27.3_inserisci_descrizione_requisito.typ"

#include "UC28_visualizza_lista_dipendenze.typ"

#include "UC28.1_visualizza_elemento_lista_dipendenze.typ"

#include "UC29_visualizza_lista_non_dipendenze.typ"

#include "UC29.1_visualizza_elemento_lista_non_dipendenze.typ"

#include "UC30_aggiungi_dipendenza.typ"

#include "UC30.1_errore_dipendenza_circolare.typ"

#include "UC30.2_visualizza_grafo_dipendenze.typ"

#include "UC31_rimuovi_dipendenza.typ"

#include "UC32_avvia_modifica_decision_tree.typ"

#include "UC33_salva_modifica_decision_tree.typ"

#include "UC34_annulla_modifica_decision_tree.typ"

#include "UC35_aggiungi_nodo_figlio.typ"

#include "UC35.1_aggiungi_nodo_figlio_sinistro.typ"

#include "UC35.2_aggiungi_nodo_figlio_destro.typ"

#include "UC36_aggiungi_nodo.typ"

#include "UC36.1_aggiungi_nodo_foglia.typ"

#include "UC36.1.1_aggiungi_nodo_pass.typ"

#include "UC36.1.2_aggiungi_nodo_fail.typ"

#include "UC36.1.3_aggiungi_nodo_na.typ"

#include "UC36.2_aggiungi_nodo_di_decisione.typ"

#include "UC36.2.1_inserisci_codice_nodo_decision_tree.typ"

#include "UC36.2.1.1_errore_codice_nodo_già_esistente.typ"

#include "UC36.2.2_inserisci_domanda_decision_tree.typ"

#include "UC36.2.3_seleziona_tipo_evidenza.typ"

#include "UC36.2.3.1_seleziona_just.typ"

#include "UC36.2.3.2_seleziona_info.typ"

#include "UC37_modifica_nodo.typ"

#include "UC38_rimuovi_nodo.typ"

#include "UC39_errore_nodo_root.typ"

#include "UC40_errore_nodo_con_discendenti.typ"

#include "UC41_salva_modifiche_requisito.typ"

#include "UC42_esporta_decision_tree.typ"

