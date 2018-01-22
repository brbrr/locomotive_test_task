module ToyRobot
  class InputReader
    # NOTE: To terminate input press 'Enter'
    def self.from_stdin
      inputs = []
      loop do
        input = STDIN.gets.chomp
        break if input.empty?
        inputs << input
      end
      inputs
    end

    def self.from_file(path)
      File.read(path).split("\n")
    end
  end
end
