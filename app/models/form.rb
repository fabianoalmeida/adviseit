class Form < ActiveRecord::Base
  belongs_to :status
  has_and_belongs_to_many :options, :uniq => :true


  validates :value,
    :presence => true,
    :length => { :within => 5..50 },
    :uniqueness => { :case_sensitive => false }

  validates :status, :options, :presence => true

  def self.actives
    where( :status_id => Status.active.id )
  end
end
