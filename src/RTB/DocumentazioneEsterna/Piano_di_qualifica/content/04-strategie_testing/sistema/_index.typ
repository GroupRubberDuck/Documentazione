#import "config/deps.typ" as deps

#let test-array=()



#import "TS001_prova.typ": data as item_0


#{
  test-array.push(
    deps.get-test-code(item_0.nome),
    item_0.descrizione,
    item_0.requisito-riferimento,
    item_0.stato,
  )
}


#tabella-test(..test-array)