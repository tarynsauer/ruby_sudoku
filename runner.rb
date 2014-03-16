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


puzzles.each do |p|
  solver = Sudoku.new(p)
  solver.solve!
end
