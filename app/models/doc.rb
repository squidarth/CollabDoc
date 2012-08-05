class Doc
  include Mongoid::Document
  
  embedded_in :user  
  embeds_many :discussions 
  field :content, :type => String
  field :title, :type => String
  field :alive, :type => Boolean 
  field :deleted_at, :type => Datetime
  
  scope :alive, where(alive: true) 
end
