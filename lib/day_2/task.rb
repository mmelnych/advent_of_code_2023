module Day2
  class Task
    VALID_VALUES = { red: 12, green: 13, blue: 14 }.freeze

    def initialize(sample)
      @sample = sample
    end

    def call1
      input.select do |game|
        game.round.all? do |(value, color)|
          VALID_VALUES[color.to_sym] >= value.to_i
        end
      end.map(&:id).sum
    end

    def call2
      input.sum do |game|
        game.round.each.with_object(Hash.new(1)) do |(value, color), power|
          power[color] = value.to_i if power[color] < value.to_i
        end.values.inject(:*)
      end
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
