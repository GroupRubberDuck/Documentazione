#import "@preview/fletcher:0.5.8" as fletcher: shapes,diagram, node

#let mark-uml-triangle = (
  inherit: "straight", 
  size: 10,
  sharpness: 25deg,
  fill: white, // Se metti 'none' diventa 100% trasparente
  
  // Questa formula (presa dalla logica di tail-origin di 'straight')
  // calcola la X esatta della base per fermare la linea prima che entri!
  tip-end: mark => -mark.size * calc.cos(mark.sharpness),
  
  draw: mark => {
    // Usiamo draw.line con close: true, ESATTAMENTE come fa la freccia stealth originale
    fletcher.cetz.draw.line(
      (180deg + mark.sharpness, mark.size), // Vertice in alto a sx
      (0, 0),                               // Punta (verso il base)
      (180deg - mark.sharpness, mark.size), // Vertice in basso a sx
      close: true                           // Chiude il 3° lato (la base)
    )
  }
)

// ==========================================
// LO STILE AGGIORNATO
// ==========================================
#let style-edge-generalize = (
  stroke: 1pt + gray.darken(50%),
  marks: (none, mark-uml-triangle) 
)


#let mark-assoc = "-"



#let style-uc = (
  shape: shapes.ellipse,
  fill: blue.lighten(85%),
  stroke: 1.5pt + blue.darken(30%),
  inset: 1.8em
)

#let style-actor = (
  stroke: none,
  inset: 0pt
)

#let style-edge-include = (
  // 1. Linea tratteggiata
  stroke: (paint: gray.darken(50%), thickness: 1pt, dash: "dashed"),
  
  // 2. Niente alla partenza, freccia aperta all'arrivo
  marks: (none, ">"), 
  
  // 3. Etichetta e posizionamento
  label: "<<include>>",
  label-pos: 0.5,
  label-side: center, // Forza il testo esattamente sopra la linea
  label-fill: white   // Copre il tratteggio sotto il testo per massima leggibilità
)

#let style-edge-extend = (
  stroke: (paint: gray.darken(50%), thickness: 1pt, dash: "dashed"),
  marks: (none, ">"),
  label: "<<extend>>",
  label-pos: 0.5,
  label-side: center,
  label-fill: white
)
// ==========================================
// FORMA CUSTOM: Triangolo UML Chiuso e Trasparente
// ==========================================
// ==========================================
// FORMA CUSTOM: Triangolo UML Chiuso
// ==========================================

#let style-box-bg = (
  fill: gray.lighten(90%),
  stroke: 1pt + gray,
  corner-radius: 5pt,
  inset: 20pt
)

#let style-box-label = (
  stroke: none,
  inset: 1em
)

// ==========================================
// FORMA CUSTOM: Nota UML (Angolo in ALTO A DESTRA)
// ==========================================
#let shape-uml-note(node, extrude, ..args) = {
  let (w, h) = node.size
  let hw = w / 2.0 + extrude
  let hh = h / 2.0 + extrude
  
  let fold = calc.min(hw, hh) * 0.4 

  fletcher.cetz.draw.group({
    // 1. Il contorno chiuso del foglio
    fletcher.cetz.draw.line(
      (-hw, hh),             // Alto-Sinistra
      (-hw, -hh),            // Basso-Sinistra
      (hw, -hh),             // Basso-Destra
      (hw, hh - fold),       // Destra (appena sotto l'angolo in alto a dx)
      (hw - fold, hh),       // Alto (appena a sx dell'angolo in alto a dx)
      close: true,
      fill: node.fill,
      stroke: node.stroke
    )
    // 2. Il risvolto della pagina in alto a destra
    fletcher.cetz.draw.line(
      (hw - fold, hh),
      (hw - fold, hh - fold),
      (hw, hh - fold),
      stroke: node.stroke
    )
  })
}
// ==========================================
// STILE NOTA UML (Corretto!)
// ==========================================
#let style-note = (
  shape: shape-uml-note, 
  fill: white,
  stroke: 1pt + gray.darken(30%),
  inset: 1em // <-- IL FIX È QUI: Solo valori singoli, niente dizionari!
)

// ==========================================
// FORMA CUSTOM: Tab UML (Rettangolo con taglio BASSO-DX)
// ==========================================
#let shape-exp-tab(node, extrude, ..args) = {
  let (w, h) = node.size
  let hw = w / 2.0 + extrude
  let hh = h / 2.0 + extrude
  
  // La dimensione del taglio (proporzionale all'altezza hh)
  // Più è grande questo valore, più il taglio è profondo
  let cut = hh * 0.8 

  fletcher.cetz.draw.group({
    fletcher.cetz.draw.line(
      (-hw, hh),             // 1. Alto-Sinistra (Angolo retto)
      (hw, hh),              // 2. Alto-Destra (Angolo retto)
      (hw, -hh + cut),       // 3. Destra (appena sopra l'angolo mozzato)
      (hw - cut, -hh),       // 4. Basso (appena a sx dell'angolo mozzato)
      (-hw, -hh),            // 5. Basso-Sinistra (Angolo retto)
      close: true,           // Chiude la figura tornando al punto 1
      fill: node.fill,
      stroke: node.stroke
    )
  })
}

// ==========================================
// 2. LO STILE DELLA LINGUETTA (Corretto!)
// ==========================================
#let style-exp-tab = (
  shape: shape-exp-tab,
  fill: white,
  stroke: (paint: black, thickness: 1.5pt),
  inset: 1.2em // <-- IL FIX: Valore singolo!
)

// ==========================================
// 3. TEST DI RENDERING ISOLATO
// ==========================================
// #align(center)[
//   #diagram(
//     node(
//       (0,0), 
//       align(center)[
//         #strong(text("Checkout Carrello", size: 1.2em))#h(0.5em)
//       ], 
//       ..style-exp-tab
//     )
//   )
// ]
// 
// 
// Ora questa funzione gestisce sia il recinto che la linguetta in modo solidale
#let style-box-expansion = (
  fill: blue.lighten(95%),
  stroke: (paint: blue.darken(30%), thickness: 1.5pt, dash: "dashed"),
  corner-radius: 10pt,
  inset: 25pt
)