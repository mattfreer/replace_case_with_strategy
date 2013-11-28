module Soccer
  module Foul
    DELIBERATE = :Intentional
    ACCIDENTIAL = :Accidential
    VIOLENT = :Violent

    module BaseFoul
      def self.included(base)
        attr_accessor :type
      end
    end

    class ElbowToHead
      include BaseFoul

      def initialize
        @type = VIOLENT
      end
    end

    class Handball
      include BaseFoul

      def initialize
        @type = DELIBERATE
      end
    end

    class FoulThrow;
      include BaseFoul

      def initialize
        @type = ACCIDENTIAL
      end
    end
  end
end
