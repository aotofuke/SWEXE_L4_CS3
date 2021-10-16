class TopController < ApplicationController
    def main
        if session[:login_uid]
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        login_password = BCrypt::Password.create('sanriko')
        if BCrypt::Password.new(login_password) == params[:pass]
            p "ログイン成功"
        #if User.find_by(uid: params[:uid], pass: params[:pass])
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'login_failed'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
