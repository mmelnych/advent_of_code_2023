module Day2
  class Task
    VALID_VALUES = { red: 12, green: 13, blue: 14 }.freeze

    def initialize(sample)
      @sample = sample
    end

    def call1
      input.select do |game|
        game.round.all? do |set|
          value, color = set.split(' ')
          VALID_VALUES[color.to_sym] >= value.to_i
        end
      end.map(&:id).sum
    end

    def call2
      input.map do |game|
        power = { 'red' => 1, 'green' => 1, 'blue' => 1 }
        game.round.each do |set|
          value, color = set.split(' ')
          power[color] = value.to_i  if power[color] < value.to_i
        end
        power.values.inject(:*)
      end.sum
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
