module ToyRobot
  class InputParser
    def self.parse(raw_action)
      result = []
      # Splitting action by space or comma(,)
      splited = raw_action.tr(' ', '').split(',')
      result << splited[0].downcase.to_sym
      return result if splited[1].nil?

      raise "NotValidAction #{splited}" unless valid? splited

      result << splited[3].to_sym # direction
      result << [splited[1].to_i, splited[2].to_i] # position
    end

    def self.valid?(act_arry)
      act_arry.size == 4 &&
        Integer(act_arry[1]) &&
        Integer(act_arry[2]) &&
        ['NORTH', 'EAST', 'WEST', 'SOUTH'].include?(act_arry[3])
    end

    def parse(raw_action)
      raw_action.include?(' ') ? parse_place_action(raw_action) : parse_action(raw_action)
    end

    private

    def parse_place_action(raw_action)
      splited = raw_action.split(/[,\s]/)

      [
        splited[0].downcase.to_sym, # method
        splited[3].to_sym, # direction
        [splited[1].to_i, splited[2].to_i] # position
      ]
    end

    def parse_action(raw_action)
      raw_action.downcase.to_sym
    end
  end
end
