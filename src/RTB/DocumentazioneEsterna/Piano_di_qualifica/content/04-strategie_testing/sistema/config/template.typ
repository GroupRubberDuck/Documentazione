#import "config/deps.typ" as deps

#let get-req-code= nome=>{
  if nome.trim() != ""{

    deps.req-obb(nome)
  
  }
  else{
    nome
  }
} 


#let test-name="{{TITOLO}}"

#let data=(

  nome:test-name,

  descrizione:[

  ],

  requisito-riferimento:get-req-code(
    ""
  ),

  stato:"NI"

)



