class RepliesController < ApplicationController

  def create
    # helper for the below line of code
        @profile = Profile.find_by(:user_id => current_user.id)
        

      @replies = Unirest.post("http://localhost:3001/replies.json", :headers => {"Accept" => "application/json"}, :parameters => {:message_id => params[:message_id], :reply => params[:reply], :profile_id => @profile.id})
    
      redirect_to vacations_path
  end
end
