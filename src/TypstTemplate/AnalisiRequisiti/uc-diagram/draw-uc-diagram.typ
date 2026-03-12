#import "@preview/fletcher:0.5.8": diagram
#import "utils/components-builder.typ" as builder
// Assicurati che il percorso sia quello corretto per il tuo progetto
#import "/src/config.typ": slugify 

#let draw-uc-diagram(
  system-name: "Sistema - Frontend",  // Il nome che va nell'angolo del recinto
  target-uc: "",
  actors: ("Utente",),
  includes: (),
  extends: (:),
  generalizations: (),
  spacing: (2.5cm, 2cm), 
  diagram-scale: 80%,
  actor-offset: 5,
  note-offset:(2,0.6)

) = {
  
  let num-gen = generalizations.len()
  let num-inc = includes.len()
  let num-act = actors.len()

  let ext-list = if type(extends) == dictionary { extends.pairs() } else { extends.map(e => (e, none)) }
  let num-ext = ext-list.len()

  // ==========================================
  // 1. MOTORE COORDINATE (Semplice ed Esplicito)
  // ==========================================
  let spread-gen = if num-gen > 0 { (num-gen - 1) / 2.0 } else { 0.0 }
  let spread-ext = if num-ext > 0 { (num-ext - 1) / 2.0 } else { 0.0 }
  let max-spread = calc.max(spread-gen, spread-ext)

  let target-x = 1.0 + max-spread
  let target-y = if num-gen > 0 { 1.0 } else { 0.0 }

  let y-gen = target-y - 1.0
  let y-ext = target-y + 1.0
  let x-inc = target-x + max-spread + 1.0
  let x-act = 0.0 // Manteniamo gli attori sulla colonna 0

  let start-x-gen = target-x - spread-gen
  let start-x-ext = target-x - spread-ext
  let start-y-inc = target-y - if num-inc > 0 { (num-inc - 1) / 2.0 } else { 0.0 }
  let start-y-act = target-y - if num-act > 0 { (num-act - 1) / 2.0 } else { 0.0 }

  // ==========================================
  // 2. ASSEMBLAGGIO TRAMITE BUILDER
  // ==========================================
  let elements = ()
  let enclosed-labels = ()
  
  let target-lbl = label("uc-" + slugify(target-uc))
  enclosed-labels.push(target-lbl)
  elements.push(builder.build-use-case(uc-name: target-uc, uc-position: (target-x, target-y)))

  // -- Attori (Esterni al sistema) --
  for (i, actor) in actors.enumerate() {
    let actor-lbl = label("actor-" + slugify(actor))
    elements.push(builder.build-actor(actor-name: actor, actor-position: (x-act - actor-offset, start-y-act + i)))
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

  // -- Extends (Basso) con Note a Ventaglio --
  for (i, (ext-name, ext-cond)) in ext-list.enumerate() {
    let ext-lbl = label("uc-" + slugify(ext-name))
    let x-pos = start-x-ext + i
    
    elements.push(builder.build-use-case(uc-name: ext-name, uc-position: (x-pos, y-ext)))
    elements.push(builder.build-extend-arrow(ext-lbl, target-lbl))
    enclosed-labels.push(ext-lbl)

    if ext-cond != none and ext-cond != "" {
      let note-lbl = label("note-ext-" + str(i)) 
      enclosed-labels.push(note-lbl) // La nota viene inclusa nel sistema!
      
      // Logica a ventaglio: spinge le note verso l'esterno per evitare collisioni
      let is-left = x-pos < target-x
      let note-x = x-pos + if is-left { - note-offset.at(0) } else { note-offset.at(0)  } 
      let note-y = y-ext + if is-left { - note-offset.at(1) } else { - note-offset.at(1) } 
      
      elements.push(builder.build-note(description: ext-cond, note-position: (note-x, note-y), note-lbl: note-lbl))
      elements.push(builder.build-note-arrow(note-lbl, ext-lbl, target-lbl))
    }
  }

  // -- System Box (Standard) --
  if enclosed-labels.len() > 0 {
    // Usiamo il builder della Standard Box invece di quella di espansione!
    elements += builder.build-std-box(enclosed-lbl: enclosed-labels, system-name: system-name)
  }

  // ==========================================
  // 3. RENDERING FINALE
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