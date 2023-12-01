module Day1
  class Task
    DIGITS_AS_WORDS = {
      one: '1',
      two: '2',
      three: '3',
      four: '4',
      five: '5',
      six: '6',
      seven: '7',
      eight: '8',
      nine: '9'
    }.freeze

    def initialize(sample)
      @sample = sample
    end

    def call1
      input.map do |row|
        digits = row.scan(/\d/)
        [digits.first, digits.last].join.to_i
      end.sum
    end

    def call2
      digitilized_input.map do |row|
        digits = row.scan(/\d/)
        [digits.first, digits.last].join.to_i
      end.sum
    end

    def digitilized_input
      input.map do |row|
        DIGITS_AS_WORDS.each { |key, number| row.gsub!(key.to_s).each { |word| word + number + word } }
        row
      end
    end

    def input
      @input ||= Input.call(@sample)
    end
  end
end
