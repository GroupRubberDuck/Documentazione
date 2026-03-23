


#page(
  width: 16in,  // Proporzione 16
  height: 9in,  // Proporzione 9
  margin: 0pt
)[
#for i in range(1, 14) { // range(1, 5) genera i numeri 1, 2, 3, 4
  image("Presentazione_RTB.pdf", page: i, width: 100%)
}
]


