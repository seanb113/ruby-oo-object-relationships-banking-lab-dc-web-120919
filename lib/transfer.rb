require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
  if !self.valid? || sender.balance < amount
    self.status = "rejected"
  return "Transaction rejected. Please check your account balance."
  elsif self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    end
  end
end
