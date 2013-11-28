module Soccer
  class Decision
    attr_accessor :caution, :card

    def initialize(args)
      args = defaults.merge(args)
      @caution = args[:caution]
      @card = args[:card]
    end

    private

    def defaults
      {:caution => false, :card => nil}
    end
  end
end
