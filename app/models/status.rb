class Status < ActiveRecord::Base
  validates :value,
    :presence => true,
    :length => { :within => 3..15 },
    :uniqueness => { :case_sensitive => false }

  def self.active
    where( :value => "Active" ).first
  end

  def self.inactive
    where( :value => "Inactive" ).first
  end
end
