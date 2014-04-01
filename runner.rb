require_relative './lib/solver'
require_relative './lib/example_puzzles'

require 'benchmark'
class Runner 
  include ExamplePuzzles

  def self.run!
    puzzles = EASY + HARD 
    count = 0
    puzzles.each do |p|
      count += 1
      solver = Solver.new(p[0])
      solver.start_solving_message(count)
      time = Benchmark.realtime { solver.solve! }
      solver.end_solving_message(time)
      sleep(0.5)
    end
  end
end

Runner.run!
