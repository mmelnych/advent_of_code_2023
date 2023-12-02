module Day2
  class Task
    VALID_VALUES = { red: 12, green: 13, blue: 14 }.freeze

    def initialize(sample)
      @sample = sample
    end

    def call1
      input.select do |game|
        game.rounds.all? do |round|
          valid?(round)
        end
      end.map(&:id).sum
    end

    def call2; end

    def input
      @input ||= Input.call(@sample)
    end

    def valid?(round)
      round.all? do |set|
        value, color = set.split(' ')
        VALID_VALUES[color.to_sym] >= value.to_i
      end
    end
  end
end
