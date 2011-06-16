class Subject < ActiveRecord::Base
  belongs_to :status
  has_and_belongs_to_many :questions, :uniq => true
  has_and_belongs_to_many :quizzes

  validates :value,
    :presence => true,
    :length => { :within => 5..50 },
    :uniqueness => { :case_sensitive => false }

  validates :status, :questions, :presence => true

  def self.actives
    where( :status_id => Status.active.id )
  end
end
