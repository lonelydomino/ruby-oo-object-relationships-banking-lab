class Transfer
attr_accessor :sender, :receiver, :status, :amount
#sender and receiver variables are bank account objects
#avi, amanda balance = 1000, 
def initialize(sender,receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end
def valid?
@sender.valid? && @receiver.valid?
end
def execute_transaction
  if valid? && @sender.balance > amount && @status == "pending"
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance." 
  end
end
def reverse_transfer
  if valid? && receiver.balance > amount && @status == "complete"
    receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."    end
end

end
