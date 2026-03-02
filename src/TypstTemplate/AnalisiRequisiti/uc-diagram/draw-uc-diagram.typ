#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "utils/style-theme.typ" as st 
// #set page(paper:"a1")

#import "/src/TypstTemplate/AnalisiRequisiti/use-case-template.typ":use-case-link-extended-label


#let draw-uc-diagram(
  box-type: "system", 
  box-label: "Sistema Front-End",
  target-uc: str, 
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing:(1cm, 2.8cm), 
  diagram-scale:80%
) = {
  let num-gen = generalizations.len()
  let num-ext = extends.len()
  let num-inc = includes.len()
  let num-act = actors.len()
let ext-list = if type(extends) == dictionary {
    extends.pairs()
  } else {
    extends.map(e => (e, none)) // Converte gli array in coppie senza condizione
  }

  // ==========================================
  // 1. IL MOTORE MATEMATICO DELLA GRIGLIA
  // ==========================================
  
  // Troviamo il "raggio" di ingombro orizzontale (spread) di gen ed ext.
  // Es: Se ho 3 extend, lo spread è 1.0 (cioè va da cx-1 a cx+1).
  let spread-gen = if num-gen > 0 { (num-gen - 1) / 2.0 } else { 0.0 }
  let spread-ext = if num-ext > 0 { (num-ext - 1) / 2.0 } else { 0.0 }
  let max-spread = calc.max(spread-gen, spread-ext)

  // Calcoliamo il CENTRO in modo che ci sia sempre spazio a sinistra per non sbattere sugli attori
  let cx = 1.0 + max-spread 
  let cy = if num-gen > 0 { 1.0 } else { 0.0 } 

  let nodes = ()
  let edges = ()
  let enclosed-labels = (<target-uc>,) 

  // --- ATTORI (Sinistra, x = 0) ---
  let start-y-act = cy - (num-act - 1) / 2.0
  for (i, actor) in actors.enumerate() {
    let lbl = label("actor-" + str(i))
    // Usano la y dinamicamente centrata
    nodes.push(node((0, start-y-act + i), align(center)[
      #image("utils/actor.svg",height: 6em)  #strong(text(actor,size:1.2em))
    ], name: lbl, ..st.style-actor))
    edges.push(edge(lbl, <target-uc>, st.mark-assoc))
  }

  // --- TARGET UC (Centro) ---
  nodes.push(
    node(
      (cx, cy), 
      align(center)[

          #use-case-link-extended-label(nome-etichetta: target-uc)
        ], 
      name: <target-uc>,
      ..st.style-uc)
      )

  // --- GENERALIZZAZIONI (Sopra, y = cy - 1) ---
  let start-x-gen = cx - spread-gen // Partiamo da sinistra rispetto al centro
  for (i, gen) in generalizations.enumerate() {
    let lbl = label("gen-" + str(i))
    let x-pos = start-x-gen + i
    nodes.push(
      node(
        (x-pos, cy - 1), 
        align(center)[
                    #use-case-link-extended-label(nome-etichetta: gen)
          ], 
        name: lbl, 
        ..st.style-uc
        )
      )
    edges.push(
      edge(<target-uc>, 
      lbl, 
      ..st.style-edge-generalize
      )
      )
    enclosed-labels.push(lbl)
  }

  // // --- EXTENDS (Sotto, y = cy + 1) ---
  let start-x-ext = cx - spread-ext // Partiamo da sinistra rispetto al centro
let y-ext = cy + 1 // O cy + 1.5 se vuoi più respiro
  for (i, (ext-name, ext-cond)) in ext-list.enumerate() {
    let lbl-uc = label("ext-" + str(i))
    let x-pos = start-x-ext + i
    
    // 1. Disegno il nodo Extend
    nodes.push(
      node(
        (x-pos, y-ext), 
        align(center)[#use-case-link-extended-label(nome-etichetta: ext-name)], 
        name: lbl-uc, 
        ..st.style-uc
      )
    )
    
    // 2. Disegno la freccia principale NORMALE (senza name!)
    edges.push(
      edge(
        lbl-uc,
        <target-uc>, 
        ..st.style-edge-extend
      )
    )

    // 3. ANNOTAZIONE UML E COLLEGAMENTO
    if ext-cond != none and ext-cond != "" {
      let lbl-note = label("note-ext-" + str(i))
      
      // Posizione della nota: un po' a destra e sotto il nodo
      let note-x = x-pos + 0.6
      let note-y = y-ext + 0.5 
      
      nodes.push(
        node(
          (note-x, note-y), 
          align(left)[
          
            #text(size: 0.8em)[#ext-cond]
          ], 
          name: lbl-note, 
          ..st.style-note
        )
      )
      
      // 4. LA VERA MAGIA DI FLETCHER: Uso l'interpolazione (0.5 = 50% del tragitto)
      edges.push(
        edge(
          lbl-note, 
          (lbl-uc, 50%, <target-uc>), // <-- Calcola il punto medio in automatico!
          stroke: (paint: gray.darken(30%), dash: "dashed", thickness: 0.8pt),
          marks: (none, none)
        )
      )
    enclosed-labels.push(lbl-note)
    }
    enclosed-labels.push(lbl-uc)
  }

  // --- INCLUDES (Destra) ---
  // Magia: piazziamo gli include a destra dell'elemento che sporge di più (cx + max-spread)
  let x-inc = cx + max-spread + 1.0
  let start-y-inc = cy - (num-inc - 1) / 2.0
  for (i, inc) in includes.enumerate() {
    let lbl = label("inc-" + str(i))
    let y-pos = start-y-inc + i
    nodes.push(
      node((x-inc, y-pos), 
      align(center)[
                    #use-case-link-extended-label(nome-etichetta: inc)
        ], 
      name: lbl, 
      ..st.style-uc
      )
      )
    edges.push(
      edge(<target-uc>, 
      lbl, 
      ..st.style-edge-include
      )
      )
    enclosed-labels.push(lbl)
  }

  // ==========================================
  // 3. LA SYSTEM BOX
  // ==========================================
  nodes.push(node(enclose: enclosed-labels, name: <system-box>, ..st.style-box-bg))
  
  // N.B. Ricordati di mettere stroke: none e lo stesso inset dello sfondo per far saltare il testo perfettamente fuori dal muro!
  nodes.push(node(
    enclose: enclosed-labels, 
    stroke: none, 
    inset: 20pt, 
    align(top + right)[#place(dx: 400pt, dy: -45pt)[#strong(text(box-label,size: 1.5em))]]
  ))

  // ==========================================
  // 4. RENDERING FINALE
  // ==========================================
  scale(diagram-scale)[  
  #align(center)[
    #diagram(
      spacing: spacing, // X e Y separati: più larghi in orizzontale per far respirare le etichette delle frecce
      ..nodes,
      ..edges
    )
  ]
  ]
}

