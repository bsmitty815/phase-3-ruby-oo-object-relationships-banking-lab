class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  

  def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? #checks to make sure both accounts are valid
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" #checks to make sure that the accounts ar valid? then if the senders balance is greater thatn the amount being sent and then the status == pending
      sender.balance -= amount #if those pass sender minus the amount
      receiver.balance += amount # and receiver plus the amount
      self.status = "complete" #status equals complete
    else # else run reject_transfer method
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected" # change status to rejected
    "Transaction rejected. Please check your account balance." # return string
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end
