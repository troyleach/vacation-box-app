
class Message
  attr_reader :id, :profile_id, :title, :message, :replies, :created_at, :updated_at

  def initialize(args)
    @id         = args["id"]
    @profile_id = args["profile_id"]
    @title      = args["title"]
    @message    = args["message"]
    @replies    = args["replies"]
    @created_at = args["created_at"]
    @updated_at = args["updated_at"]
  end

  def self.find(id)
    message = Unirest.get("http://localhost:3001/messages/#{id}.json").body
    Message.new(message)
  end

  def self.all 
    all_messages = Unirest.get("http://localhost:3001/messages.json").body["message"]
    @messages = []
    all_messages.each do |message_hash|
      @messages << Message.new(message_hash)
    end
    @messages
  end


end