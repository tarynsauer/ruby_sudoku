require_relative './board'
require_relative './sudoku'

puzzles = []

puzzles << "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
puzzles << "005030081902850060600004050007402830349760005008300490150087002090000600026049503"
puzzles << "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
puzzles << "005030081902850060600004050007402830349760005008300490150087002090000600026049503"
puzzles << "290500007700000400004738012902003064800050070500067200309004005000080700087005109"
puzzles << "080020000040500320020309046600090004000640501134050700360004002407230600000700450"
puzzles << "608730000200000460000064820080005701900618004031000080860200039050000100100456200"
puzzles << "370000001000700005408061090000010000050090460086002030000000000694005203800149500"
### Difficult puzzles
puzzles << "000689100800000029150000008403000050200005000090240801084700910500000060060410000"
puzzles << "030500804504200010008009000790806103000005400050000007800000702000704600610300500"
puzzles << "096040001100060004504810390007950043030080000405023018010630059059070830003590007"
puzzles << "000075400000000008080190000300001060000000034000068170204000603900000020530200000"
puzzles << "300000000050703008000028070700000043000000000003904105400300800100040000968000200"
puzzles << "302609005500730000000000900000940000000000109000057060008500006000000003019082040"


  solver = Sudoku.new(puzzles[8])
  solver.solve!

