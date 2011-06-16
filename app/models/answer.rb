class Answer < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :subject
  belongs_to :question
  belongs_to :option

  attr_accessor :options

  def options
    @options ||= []
    @options
  end

  validates :value,
    :length => { :within => 5..80 },
    :allow_blank => false,
    :if => lambda{ option.has_text_field }

  validates :quiz, :subject, :question, :option, :presence => true
end
