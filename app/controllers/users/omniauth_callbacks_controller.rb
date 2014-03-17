class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash['uid']
    name = auth_hash['info']['name']
    auth = Authorization.where(provider: 'twitter', uid: uid)
    if auth.any?
      user = auth.first.user
    else 
      unless current_user
        user = User.from_social_name(name)
      else
        user = current_user
      end
      
      unless auth = user.authorizations.find_by_provider('twitter')
        auth = user.authorizations.build provider: 'twitter', uid: uid
        user.authorizations << auth
      end
      auth.update_attributes(
        uid: uid,
        token: auth_hash['credentials']['token'],
        secret: auth_hash['credentials']['secret'],
        name: name,
        url: "https://twitter.com/#{auth_hash['info']['nickname']}"
      )
    end

    if user
      sign_in_and_redirect user, event: :authentication
    else
      redirect_to :new_user_registration
    end
  end
end
