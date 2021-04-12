class UserMailer < ApplicationMailer
    def new_user(user)
        @user = user
        User.all.each do |user|
            mail(to: user.email, subject: "You have successfully registered!")
        end
    end
end
