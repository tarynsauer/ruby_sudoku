require_relative './lib/solver'
require_relative './lib/example_puzzles'

require 'benchmark'
class Runner 
  include ExamplePuzzles

  def self.run!
    puzzles = VERY_EASY + EASY + DIFFICULT + VERY_DIFFICULT
    count = 0

    puzzles.each do |p|
      count += 1
      puts "\n ***** Puzzle ##{count} *****"
      solver = Solver.new(p[0])
      solver.print_board 
      time = Benchmark.realtime { solver.solve! }
      puts " ##{count} solved in #{time}s"
      solver.print_board
      sleep(0.5)
    end
  end
end

Runner.run!
