#import "@preview/fletcher:0.5.8": diagram
#import "utils/components-builder.typ" as builder
#import "/src/config.typ": slugify 

#let draw-uc-expansion(
  parent-uc: "",
  target-uc: "",
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (0.5cm, 3cm), 
  diagram-scale: 80%
) = {
  
  let num-gen = generalizations.len()
  let num-inc = includes.len()
  let num-act = actors.len()

  let ext-list = if type(extends) == dictionary { extends.pairs() } else { extends.map(e => (e, none)) }
  let num-ext = ext-list.len()

  // ==========================================
  // 1. MOTORE COORDINATE (Semplice ed Esplicito)
  // ==========================================
  
  // Calcoliamo quanto spazio serve in orizzontale
  let spread-gen = if num-gen > 0 { (num-gen - 1) / 2.0 } else { 0.0 }
  let spread-ext = if num-ext > 0 { (num-ext - 1) / 2.0 } else { 0.0 }
  let max-spread = calc.max(spread-gen, spread-ext)

  // Fissiamo le coordinate del Target centrale
  let target-x = 1.0 + max-spread
  let target-y = if num-gen > 0 { 1.0 } else { 0.0 }

  // Fissiamo le righe/colonne fisse per i 4 lati
  let y-gen = target-y - 1.0
  let y-ext = target-y + 1.0
  let x-inc = target-x + max-spread + 1.0
  let x-act = 0.0

  // Calcoliamo i punti di partenza per centrare le liste
  let start-x-gen = target-x - spread-gen
  let start-x-ext = target-x - spread-ext
  let start-y-inc = target-y - if num-inc > 0 { (num-inc - 1) / 2.0 } else { 0.0 }
  let start-y-act = target-y - if num-act > 0 { (num-act - 1) / 2.0 } else { 0.0 }

  // ==========================================
  // 2. ASSEMBLAGGIO (Senza dizionari intermedi)
  // ==========================================
  let elements = ()
  let enclosed-labels = ()
  
  let target-lbl = label("uc-" + slugify(target-uc))
  enclosed-labels.push(target-lbl)


  elements.push(builder.build-use-case(uc-name: target-uc, uc-position: (2, 1)))

  // -- Attori (Sinistra) --
  for (i, actor) in actors.enumerate() {
    let actor-lbl = label("actor-" + slugify(actor))
    elements.push(builder.build-actor(actor-name: actor, actor-position: (x-act - 6, start-y-act + i)))
    elements.push(builder.build-assoc-arrow(actor-lbl, target-lbl))
  }

  // -- Generalizations (Alto) --
  for (i, gen) in generalizations.enumerate() {
    let gen-lbl = label("uc-" + slugify(gen))
    elements.push(builder.build-use-case(uc-name: gen, uc-position: (start-x-gen + i, y-gen)))
    elements.push(builder.build-generalize-arrow(gen-lbl, target-lbl))
    enclosed-labels.push(gen-lbl)
  }

  // -- Includes (Destra) --
  for (i, inc) in includes.enumerate() {
    let inc-lbl = label("uc-" + slugify(inc))
    elements.push(builder.build-use-case(uc-name: inc, uc-position: (x-inc, start-y-inc + i)))
    elements.push(builder.build-include-arrow(target-lbl, inc-lbl))
    enclosed-labels.push(inc-lbl)
  }

  // // -- Extends (Basso) --
  for (i, (ext-name, ext-cond)) in ext-list.enumerate() {
    let ext-lbl = label("uc-" + slugify(ext-name))
    let x-pos = start-x-ext + i
    
    elements.push(builder.build-use-case(uc-name: ext-name, uc-position: (x-pos, y-ext)))
    elements.push(builder.build-extend-arrow(ext-lbl, target-lbl))
    enclosed-labels.push(ext-lbl)

    // Note condizione
    if ext-cond != none and ext-cond != "" {
      let note-lbl = label("note-ext-" + str(i)) 
      enclosed-labels.push(note-lbl) // <-- Inclusa nella scatola!
      elements.push(builder.build-note(description: ext-cond, note-position: (x-pos + 0.6, y-ext + 0.5), note-lbl: note-lbl))
      elements.push(builder.build-note-arrow(note-lbl, ext-lbl, target-lbl))
    }
  }

  // -- Box di Espansione --
  if enclosed-labels.len() > 0 {
    elements += builder.build-exp-box(enclosed-lbl: enclosed-labels, parent-uc-name: parent-uc)
  }

  // ==========================================
  // 3. RENDERING
  // ==========================================
  align(center)[
    #scale(diagram-scale)[
      #diagram(
        spacing: spacing, 
        ..elements
      )
    ]
  ]
}