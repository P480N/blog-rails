class PostMailer < ApplicationMailer

  def new_post(post)
    @post = post

    User.all.each do |user|
      mail(to: user.email, subject: "Nuevo Post en Blog")
    end
  end
end
