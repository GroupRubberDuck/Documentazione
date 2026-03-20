#import "{{FILE_PATH}}": data as item_{{INDEX}}, req-name as req-{{INDEX}}

#req-uc-dict.insert(
  req-{{INDEX}}
  ,
  item_{{INDEX}}.fonti
  )


#{
item_{{INDEX}}.fonti=utils.format-array(item_{{INDEX}}.fonti,transf:uc-transformation-con-link)

}

#table-cells.push( item_{{INDEX}})


