# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.sequence :value do |n|
  "Value_#{n}"
end

Factory.define :status do |s|
  s.value {Factory.next(:value)}
end

Factory.define :option do |o|
  o.value {Factory.next(:value)}
  o.association :status
end

Factory.define :form do |f|
  f.value {Factory.next(:value)}
  f.association :status
  f.options { |options| [options.association(:option)] }
end

Factory.define :question do |q|
  q.value {Factory.next(:value)}
  q.association :status
  q.association :form
end

Factory.define :subject do |s|
  s.value {Factory.next(:value)}
  s.association :status
  s.questions { |questions| [questions.association(:question)] }
end

Factory.define :quiz do |q|
  q.value {Factory.next(:value)}
  q.description {Factory.next(:value)}
  q.association :status
  q.subjects { |subjects| [subjects.association(:subject)] }
end

Factory.define :answer do |a|
  a.value {Factory.next(:value)}
  a.association :quiz
  a.association :subject
  a.association :question
  a.association :option
end

Factory.define :company do |c|
  c.value {Factory.next(:value)}
end

Factory.define :department do |d|
  d.value {Factory.next(:value)}
  d.association :company
end

Factory.define :cost_center do |cc|
  cc.value {Factory.next(:value)}
  cc.association :department
end
