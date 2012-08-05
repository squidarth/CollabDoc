class Doc
  include Mongoid::Document
  
  embedded_in :user  
  embeds_many :discussions 
  field :content, :type => String
  field :parsed_content, :type => String 
  field :titasdfasdle, :type => String
  field :alive, :type => Boolean 
  field :deleted_at, :type => DateTime
  
  scope :alive, where(alive: true) 

  def parse
    self.parsed_content = self.content
    scan_output = content.scan(/<discussion name="(.+)">(.+)<\/discussion>/)
    scan_output.each do |discussion|
      name = discussion[0]
      content = discussion[1]
      discussion = Discussion.create(name: name, content: content)
      replacement = "<a href=\"http://local.host:3000/discussions/#{discussion.id}\">#{content}</a>"
      self.parsed_content.sub(/<discussion name="#{name}">#{content}<\/discussion>/, replacement)
      self.save 
    end 
  end
end
