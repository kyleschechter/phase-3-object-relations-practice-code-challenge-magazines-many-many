class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe mag, pri
    Subscription.create(reader_id: self.id, magazine_id: mag.id, price: pri)
  end

  def total_subscription_price
    subscriptions.sum(:price)
  end

  def cancel_subscription mag
    Subscription.find_by(reader_id: self.id, magazine_id: mag.id).destroy
  end
end