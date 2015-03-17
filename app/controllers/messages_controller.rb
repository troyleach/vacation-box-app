class MessagesController < ApplicationController
  
  def create
# helper for the below line of code
    @profile = Profile.find_by(:user_id => current_user.id)

    @messages = Unirest.post("http://localhost:3001/messages.json", :headers => {"Accept" => "application/json"}, :parameters => {:profile_id => @profile.id, :title => params[:title], :message => params[:message], :image => params[:image]})

    redirect_to vacations_path

  end

end