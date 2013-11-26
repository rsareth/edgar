class Abilitation < ActiveRecord::Base
  attr_accessible :kind, :user_attributes, :user_id
  belongs_to :user
  belongs_to :account
  validates :kind, inclusion: { in: %(manager member)}

  accepts_nested_attributes_for :user
  
  def member?
    kind == "member"
  end
  
  def manager?
    kind == "manager"
  end
  
end
