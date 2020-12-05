class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? &&
    self.receiver.valid?
    # if @sender.name && @receiver.name
    #   true
    # else false
    # end  
  end
 
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
#   def execute_transaction(amount)
#     if @sender > @amount && @status == "pending"
#       @receiver = @receiver - amount 
#       @sender = @sender - amount
#       @status = "complete"
#     #puts "Your transaction is complete."
#     elsif @status == "complete"
#       puts "Transaction was already excuted."
#     else
#       puts "Transaction rejected. Please check your account balance."
#     end
#   end

#   def reverse_transfer

#   end
# end
