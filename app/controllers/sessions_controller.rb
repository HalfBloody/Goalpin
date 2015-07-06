class SessionsController < Devise::RegistrationsController
  
  def sign_up(resource_name, resource)
  	update_invite_with_user
  	super
  end  

  private
  def update_invite_with_user
  	if session[:token]
  	  @invite = Invite.find_by(token: session[:token])
  	  @invite.update_attributes(mentor_id: current_user.id)
  	end
  end
end