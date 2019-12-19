class Admin::InvitationsController < Devise::InvitationsController
  def new
  end

  def create
    User.invite!(invite_params(params), current_user) do |user|
      user.invite_message = params[:invitation][:message]
    end

    redirect_to admin_profile_path, notice: 'Invitation envoyé'
  end

  private

  def invite_params(params)
    { email: params[:invitation][:email],
      permission: params[:invitation][:permission] == 'Admin' ? 'admin' : 'writer',
      first_name: params[:invitation][:first_name],
      last_name: params[:invitation][:last_name],
      profession: params[:invitation][:profession],
      signature: params[:invitation][:signature]
    }
  end

end
