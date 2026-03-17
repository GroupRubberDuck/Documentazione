
#import "{{FILE_PATH}}": data as item_{{INDEX}}


#{
  test-array.push(
    deps.get-test-code(item_{{INDEX}}.nome),
    item_{{INDEX}}.descrizione,
    item_{{INDEX}}.requisito-riferimento,
    item_{{INDEX}}.stato,
  )
}