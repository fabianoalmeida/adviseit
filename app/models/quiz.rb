class Quiz < ActiveRecord::Base
  belongs_to :status
  belongs_to :measurable, :polymorphic => true
  has_and_belongs_to_many :subjects, :uniq => true

  validates :value,
    :presence => true,
    :length => { :within => 5..20 },
    :uniqueness => { :case_sensitive => false }

  validates :description,
    :length => { :within => 5..100 },
    :allow_blank => true

  validates :status, :subjects, :presence => true

  def self.actives
    where( :status_id => Status.active.id )
  end
end
