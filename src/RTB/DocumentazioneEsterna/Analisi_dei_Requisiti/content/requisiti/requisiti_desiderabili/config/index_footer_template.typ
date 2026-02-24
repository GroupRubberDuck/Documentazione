

// ============================================================================
// 📦 ESPORTAZIONE DATI (API DEL MODULO)
// ============================================================================
// L'array 'all_data' contiene tutti i dizionari esportati dai singoli file.
// 
// Esempio di utilizzo nel tuo main.typ:
// #import "percorso/a/_index.typ": all_data
// 
// #for item in all_data [
//   == #item.title
//   #item.content
// ]
// ============================================================================

// #let all_data = (
// {{ARRAY_ITEMS}}
// )

// --- Fine del file generato ---