class CostCenter < ActiveRecord::Base
  belongs_to :department
  has_many :quizzes, :as => :measurable

  validates :value,
    :presence => true,
    :length => { :within => 5..40 },
    :uniqueness => { :case_sensitive => false }
  
  validates :department, :presence => true

  def self.from_department_id( department_id )
    self.where( :department_id => department_id )
  end
end
