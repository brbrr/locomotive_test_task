module ToyRobot
  class InputParser
    def self.parse(raw_action)
      result = []
      splited = raw_action.split(/[,\s]/)
      result << splited[0].downcase.to_sym
      return result if splited[1].nil?

      raise 'NotValidAction' unless valid? splited

      result << splited[3].to_sym # direction
      result << [splited[1].to_i, splited[2].to_i] # position
    end

    def self.valid?(act_arry)
      act_arry.size == 4 &&
      Integer(act_arry[1]) &&
      Integer(act_arry[2]) &&
      ['NORTH', 'EAST', 'WEST', 'SOUTH'].include?(act_arry[3])
    end
  end
end
