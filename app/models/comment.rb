class Comment
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => String
  field :created_at, :type => Time
  embedded_in :discussion

end
