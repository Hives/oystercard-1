class Oystercard

    attr_reader :balance
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(money)
      raise "Balance cannot exceed £#{MAXIMUM_BALANCE}" if @balance + money > MAXIMUM_BALANCE
        @balance += money
    end

    def touch_in
      raise 'Insufficient funds' if @balance < MINIMUM_FARE
      @in_journey = true
    end

    def touch_out
      deduct(MINIMUM_FARE)
      @in_journey = false
    end

    def in_journey?
      @in_journey
    end

    private

    def deduct(money)
      @balance -= money
    end
    
end
