#import "/src/config.typ":he,slugify
#import "use-case-id-handler.typ":format-code,get-use-case-code
#let use-case-template(
    livello-intestazione:int,
    codice:str,
    nome:str,
    attore-principale:str,
    scenario-principale:content,
    pre-condizioni:content,
    post-condizioni:content,
    trigger:none,
    scenari-alternativi:none,
    inclusioni:none,
    estensioni:none,
    generalizzazioni:none,
    path-immagine-diagramma:none,
    figure-caption:none,

)={
  [#heading(codice+":"+nome,level: livello-intestazione) #label(slugify( nome))]

  if path-immagine-diagramma != none {

    figure(caption:figure-caption)[
      #image(path-immagine-diagramma)
    ]
  }


let elementi-lista-opzionali=(
      if scenario-principale != none{
      [
        *Scenario principale*: \ 
        #pad(left: 1em,top:-0.5em)[ #scenario-principale ]
      ]
      } else {none},      
      if scenari-alternativi != none{
      [
        *Scenari alternativi*: \
        #pad(left: 1em,top:-0.5em)[ #scenari-alternativi ]
      ]
      } else {none},
      if inclusioni != none{
      [
        *Inclusioni*: \
        #pad(left: 1em,top:-0.5em)[ #inclusioni ]
      ]
      } else {none},
      if estensioni != none{
      [
        *Estensioni*: \
        #pad(left: 1em,top:-0.5em)[ #estensioni ]
      ]
      } else {none},
      if generalizzazioni != none{
      [
        *Generalizzazioni*: \
        #pad(left: 1em,top:-0.5em)[ #generalizzazioni ]
      ]
      } else {none},
      if trigger != none{
      [
        *Trigger*: \
        #pad(left: 1em,top:-0.5em)[ #trigger ]
      ]
      } else {none},
).filter(item => item!= none)


    list(
      [*Attore principale*: #attore-principale],
      [*Precondizioni*:\ #pad(left: 1em,top:-0.5em)[ #pre-condizioni ]],
      [*Postcondizioni*:\ #pad(left: 1em,top:-0.5em)[ #post-condizioni ]],


      ..elementi-lista-opzionali
    )



}

// codice è non serve più, rimane per retrocompatibilità
#let use-case-label(codice:"", nome-etichetta:str)={
  ref(label(slugify(nome-etichetta)),supplement: get-use-case-code(nome-etichetta:nome-etichetta)+" ,§")
}

// #use-case-template(
//   codice: "UC31",
//   nome:"Visualizzazione errore nel caricamento del test",
//   livello-intestazione: 3,
//   attore-principale: "Utente",
//   scenario-principale:[
//     + Il sistema rileva un errore (file corrotto, formato non compatibile, dati mancanti);
//     + Il sistema visualizza un messaggio di errore descrittivo;
//     + L'utente viene riportato alla schermata di selezione.
//   ] ,
//   scenari-alternativi: none,
//   pre-condizioni: [
//     L'utente ha tentato di aprire un test salvato;
//   ],
//   post-condizioni: [
//     Viene visualizzato un messaggio di errore;
//   ],
//   trigger: [Il sistema incontra un errore durante il caricamento;],
//   inclusioni:none,
//   estensioni:none,
//   generalizzazioni:none,
//   path-immagine-diagramma:none,

// )





