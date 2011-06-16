class Department < ActiveRecord::Base
  belongs_to :company
  has_many :quizzes, :as => :measurable

  validates :value,
    :presence => true,
    :length => { :within => 5..40 },
    :uniqueness => { :case_sensitive => false }
  
  validates :company, :presence => true

  def self.from_company_id(company_id)
    self.where( :company_id => company_id )
  end
end
