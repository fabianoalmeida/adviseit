class Company < ActiveRecord::Base
  has_many :quizzes, :as => :measurable

  validates :value,
    :presence => true,
    :length => { :within => 5..40 },
    :uniqueness => { :case_sensitive => false }

end
