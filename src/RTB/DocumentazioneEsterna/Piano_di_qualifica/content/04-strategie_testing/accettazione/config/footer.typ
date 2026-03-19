


#figure(caption:" Test di Sistema")[
#deps.tabella-test(..(test-array).flatten())

]


=== Tracciamento test di sistema



#figure(caption: "Tracciamento dei Test di Sistema")[#deps.tabella-tracciamento(..(test-array.map(
  it=>{
    (it.at(0),it.at(2))
}
).flatten()))]