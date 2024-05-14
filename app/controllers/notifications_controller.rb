class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def update
     notification = current_user.notifications.find(params[:id])
     notification.update(read: true)
     case botification.notifiable_type
     when "book"
       redirect_to book_path(notification.notifiable)
     else
       redirect_to user_path(notification.notifiable.user)
     end
  end
end
