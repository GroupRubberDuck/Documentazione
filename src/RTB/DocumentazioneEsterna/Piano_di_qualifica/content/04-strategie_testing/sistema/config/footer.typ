

#let test-array-plot=test-array.map(
    it=>{
      ([
        #it.at(0)
        #label(it.at(0))
      ],..(it.slice(1)))
    }
  )
  

#figure(caption:" Test di Sistema")[
#deps.tabella-test(..(test-array-plot).flatten())

]


=== Tracciamento test di sistema



#figure(caption: "Tracciamento dei Test di Sistema")[#deps.tabella-tracciamento(..(test-array.map(
  it=>{
    (link(label(it.at(0)))[#it.at(0)],it.at(2))
}
).flatten()))]