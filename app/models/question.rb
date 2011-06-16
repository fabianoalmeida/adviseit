class Question < ActiveRecord::Base
  belongs_to :status
  belongs_to :form
  has_and_belongs_to_many :subjects

  validates :value,
    :presence => true,
    :length => { :within => 3..80 },
    :uniqueness => { :case_sensitive => false }

  validates :status, :form, :presence => true

  def self.actives
    where( :status_id => Status.active.id )
  end
end
