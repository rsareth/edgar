# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  street           :string(255)
#  postal_code      :string(255)
#  city             :string(255)
#  state            :string(255)
#  country          :string(255)
#  kind             :string(255)
#  contact_datum_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  latitude         :float
#  longitude        :float
#

class Address < ActiveRecord::Base
  belongs_to :contact, touch:true
  attr_accessible :city, :country, :kind, :postal_code, :state, :street
  acts_as_gmappable :process_geocoding => false
  geocoded_by :full_address
  after_validation :geocode
  # before_save :geocode
  validates :city, :presence => :true
  validates :country, :presence => :true

  def full_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, Country.new(#{self.country}).name"
    [self.street, self.city, Country.new(self.country).name].reject(&:blank?).join(', ')
  end

end
