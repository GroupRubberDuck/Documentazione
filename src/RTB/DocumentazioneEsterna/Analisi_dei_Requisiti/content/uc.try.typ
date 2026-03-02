#set heading(numbering: "1.1)")
#import "/src/TypstTemplate/AnalisiRequisiti/uc-diagram/draw-uc-diagram.typ":draw-uc-diagram
#import "/src/TypstTemplate/AnalisiRequisiti/uc-diagram/draw-uc-expansion.typ":draw-uc-expansion

#outline()

#include "use_case/_index.typ"


// TEST FINALE
// #draw-uc-diagram(
//   target-uc: "Autenticazione",
//   includes: ("Autenticazione", "Autenticazione", "Autenticazione"),
//   extends: ("Autenticazione":"descrizione 1", "Registrazione":"descrizione 2", "Inserimento versione firmware dispositivo":"descrizione 3"), 
//   generalizations: ("Autenticazione", "Autenticazione"),
//   diagram-scale: 70%
// )
// // 
// #draw-uc-expansion(
//   parent-uc:"Autenticazione",
//   target-uc: "Autenticazione",
//   includes: ("Risoluzione conflitto di merge", "Eliminazione di un asset"),
//   extends: ("Errore importazione file":"descrizione 1", " Annullamento creazione dispositivo":"descrizione 2", "Errore importazione file asset":"descrizione 3"), 
//   generalizations: ("Selezione file csv", "Selezione file JSON"),
//   diagram-scale: 50%
// )
