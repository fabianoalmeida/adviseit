class Option < ActiveRecord::Base
  belongs_to :status
  has_and_belongs_to_many :forms

  validates :value,
    :presence => true,
    :length => { :within => 2..80 },
    :uniqueness => { :case_sensitive => false }

  validates :status, :presence => true

  def self.actives
    where( :status_id => Status.active.id )
  end
end
