class Oystercard

    attr_reader :balance, :entry_station
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
    end

    def top_up(money)
      raise "Balance cannot exceed £#{MAXIMUM_BALANCE}" if @balance + money > MAXIMUM_BALANCE
        @balance += money
    end

    def touch_in(station)
      raise 'Insufficient funds' if @balance < MINIMUM_FARE
      @entry_station = station
    end

    def touch_out
      deduct(MINIMUM_FARE)
      @entry_station = nil
    end

    def in_journey?
      !!@entry_station
    end

    private

    def deduct(money)
      @balance -= money
    end

end
