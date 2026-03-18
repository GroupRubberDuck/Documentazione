#set page(width: 16cm, height: 9cm, margin: 0cm)
#set text(font: "Fira Sans")

// --- 1. PALETTE COLORI RUBBER DUCK ---
#let duck-navy = rgb("#0d1b2a")        // Blu scuro profondo del testo/circuiti
#let duck-navy-light = rgb("#1c3b5e")  // Un navy leggermente più chiaro per creare profondità
#let duck-yellow = rgb("#ffcc00")      // Giallo brillante della papera
#let duck-orange = rgb("#ff851b")      // Arancione del becco
#let bg-color = gradient.linear(dir: ltr, rgb("#ffffff"), rgb("#f0f4f8")) // Sfondo pulitissimo

// --- 2. SFONDO ---
#place(top + left, rect(width: 100%, height: 100%, fill: bg-color))

// --- 3. GEOMETRIE IN ALTO A DESTRA ---
#place(top + left)[
  // Triangolo navy chiaro (base grande)
  #polygon(fill: duck-navy-light, (10cm, 0cm), (16cm, 0cm), (16cm, 6cm))
  // Triangolo navy scuro (angolo)
  #polygon(fill: duck-navy, (12.5cm, 0cm), (16cm, 0cm), (16cm, 3.5cm))
  // Fascia Gialla sovrapposta (effetto nastro tech)
  #polygon(fill: duck-yellow, (16cm, 2.5cm), (16cm, 7cm), (11.5cm, 2.5cm))
  // Piccolo accento arancione in alto a destra
  #polygon(fill: duck-orange, (16cm, 0cm), (14.5cm, 0cm), (16cm, 1.5cm))
]

// --- 4. GEOMETRIE IN BASSO A SINISTRA ---
#place(top + left)[
  // Triangolo base navy chiaro
  #polygon(fill: duck-navy-light, (0cm, 4cm), (0cm, 9cm), (5cm, 9cm))
  // Triangolo Giallo ("la montagna" centrale, per far spiccare la geometria)
  #polygon(fill: duck-yellow, (0cm, 9cm), (2.5cm, 6.5cm), (5.5cm, 9cm))
  // Triangolo navy scuro (angolo basso)
  #polygon(fill: duck-navy, (0cm, 6.5cm), (0cm, 9cm), (2.5cm, 9cm))
  
  // Tocco Arancione (per chiudere il richiamo al becco)
  #polygon(fill: duck-orange, (0cm, 9cm), (1.5cm, 9cm), (0cm, 7.5cm))
]

// --- 5. CONTENUTO DELLA SLIDE ---

// Titolo e Sottotitolo centrati
#place(center + horizon)[
  #text(size: 46pt, weight: "bold", fill: duck-navy, tracking: 2pt)[PROOF OF CONCEPT]\
  #v(0.5em)
  #text(size: 18pt, fill: duck-navy-light)[Rubber Duck Architecture Validations]
]

// Badge Data (In alto a sinistra)
#place(top + left, dx: 1cm, dy: 1cm)[
  #rect(fill: duck-navy, radius: 1cm, inset: (x: 15pt, y: 10pt))[
    // Testo giallo sul badge blu scuro: super leggibile e in tema!
    #text(fill: duck-yellow, size: 12pt, weight: "bold")[18 Marzo 2026]
  ]
]

// Badge Sito/Progetto (In basso a destra)
#place(bottom + right, dx: -1cm, dy: -1cm)[
  #rect(fill: duck-navy, radius: 1cm, inset: (x: 15pt, y: 10pt))[
    #text(fill: white, size: 12pt, weight: "medium")[rubberduck-poc.local]
  ]
]

// Logo del progetto (opzionale, posizionato sopra o sotto il titolo)
#place(center + horizon, dy: -4cm)[
  // Decommenta e inserisci il nome del tuo file se vuoi la papera al centro-alto
  // #image("logo.png", width: 2.5cm)
]