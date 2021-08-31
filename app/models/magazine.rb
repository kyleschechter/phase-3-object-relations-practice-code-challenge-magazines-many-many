class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.map {|read| read.email}.join(';')
  end

  def self.most_popular
    count = self.all.map {|mag| mag.subscriptions.count}.max
    self.all.find {|mag| mag.subscriptions.count == count}
  end
end