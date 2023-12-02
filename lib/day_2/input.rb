module Day2
  class Input
    class << self
      INPUT_FILE_PATH = "#{__dir__}/input.txt".freeze
      SAMPLE_INPUT_FILE_PATH = "#{__dir__}/input.sample.txt".freeze

      def call(sample)
        data(sample).split("\n").map do |row|
          a = row.split(': ')
          id = a[0].sub('Game ', '').to_i
          rounds = a[1].split('; ').map{|x| x.split(', ')}
          Game.new(id: id, rounds: rounds)
        end
      end

      def data(sample)
        sample ? File.read(SAMPLE_INPUT_FILE_PATH) : File.read(INPUT_FILE_PATH)
      end
    end
  end

  class Game
    attr_reader :id, :rounds

    def initialize(id:, rounds:)
      @id = id
      @rounds = rounds
    end
  end
end
