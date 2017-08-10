require_relative 'bank_account'
RSpec.describe Bank_Account do

  before(:each) do
    @bank_account1 = Bank_Account.new('John')
  end

############Checking Accounts
  it 'has a getter for checking account balance' do
    expect(@bank_account1.checking_balance).to eq(2500)
  end

  it "can't set checking account balance" do
    expect { @bank_account1.checking_balance = 50000 }.to raise_error(NoMethodError)
  end

##############Savings Accounts
  it 'has a getter for savings account balance' do
    expect(@bank_account1.savings_balance).to eq(5000)
  end

  it "can't set savings account balance" do
    expect { @bank_account1.savings_balance = 50000 }.to raise_error(NoMethodError)
  end

###############total balance
  it "can't set total account balance" do
    expect { @bank_account1.total = 50000 }.to raise_error(NoMethodError)
  end

################withdraw cash from checking
  it 'can withdraw cash from checking account' do
    @bank_account1.make_withdrawal(1, 2000)
    expect(@bank_account1.display_checking_balance).to eq(500)
  end

  it 'can withdraw cash from checking account' do
    @bank_account1.make_withdrawal(1, 5000)
    expect(@bank_account1.display_checking_balance).to eq(2500)
  end

################withdraw cash from savings
  it 'can withdraw cash from savings account' do
    @bank_account1.make_withdrawal(2, 2000)
    expect(@bank_account1.display_savings_balance).to eq(3000)
  end

  it 'can withdraw cash from savings account' do
    @bank_account1.make_withdrawal(2, 6000)
    expect(@bank_account1.display_savings_balance).to eq(5000)
  end

##################can't retrieve account tally
  it "can't allow user to retrieve totalnumber of bank accounts" do
    expect { @bank_account1.account_tally }.to raise_error(NoMethodError)
  end

##################can't set interest_rate
  it "can't allow user to set interest rate" do
    expect { @bank_account1.interest_rate = 0.05 }.to raise_error(NoMethodError)
  end

end
