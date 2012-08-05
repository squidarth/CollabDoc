class Discussion
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => Text
end
