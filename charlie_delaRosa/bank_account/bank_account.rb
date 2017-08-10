class Bank_Account
  attr_accessor :name
  attr_reader :total, :checking_balance, :savings_balance, :interest_rate
  @@account_tally = 0

  def initialize(name)
    @name = name
    @account_number = create_account_number
    @checking_balance = 2500
    @savings_balance = 5000
    @total = @checking_balance + @savings_balance
    @interest_rate = 0.01
    @@account_tally += 1
  end


  def display_account_number
    puts "Your account number is #{@account_number}."
    return @account_number
  end

  def display_checking_balance
    puts "Your checking balance is #{get_checking_balance}."
    return get_checking_balance
  end

  def display_savings_balance
    puts "Your savings balance is #{get_savings_balance}."
    return get_savings_balance
  end

  def display_total_balance
    puts @total
  end

  def make_deposit
    @which_account
    puts "Make a deposit:"
    puts "1 for Checking and 2 for Savings:  "
    @which_account = gets.to_i
    if @which_account == 1
      puts "How much to your checking account?"
      @checking_balance = @checking_balance + gets.to_i
    elsif @which_account == 2
      puts "How much to your savings account?"
      @savings_balance = @savings_balance + gets.to_i
    else
      puts "Invalid entry.  Sorry.  Try again"
    end
  end

  def make_withdrawal(account, amount)
    @which_account = account
    @withdrawal = amount
    # puts "Make a withdrawal:"
    # puts "1 for Checking and 2 for Savings:  "
    if @which_account == 1
      # puts "How much do you want to withdraw from your checking account?"
      if @checking_balance < @withdrawal
        puts "You don't have enough in your account."
      else
        @checking_balance = @checking_balance - @withdrawal
      end
    elsif @which_account == 2
      # puts "How much do you want to withdraw from your savings account?"
      if @savings_balance < @withdrawal
        puts "You don't have enough in your account."
      else
        @savings_balance = @savings_balance - @withdrawal
      end
    else
      puts "Invalid entry.  Sorry.  Try again"
    end
  end

  def display_account_information
    puts @account_number
    puts @total
    puts @checking_balance
    puts @savings_balance
    puts @interest_rate
  end

private
    def create_account_number
      return rand(100000)
    end

    def get_checking_balance
      return @checking_balance
    end

    def get_savings_balance
      return @savings_balance
    end
end

account = Bank_Account.new('John')


# puts account.display_account_information
account.make_withdrawal(2, 7000)
