module ToyRobot
  class InputParser
    def self.parse(raw_action)
      result = []
      splited = raw_action.split(/[,\s]/)
      result << splited[0].downcase.to_sym
      return result if splited[1].nil?

      result << splited[3].to_sym # direction
      result << [splited[1].to_i, splited[2].to_i] # position
    end
  end
end
