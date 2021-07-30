module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :session_id
    # rescue_from StandardError, with: :report_error
    #
    def connect
       self.session_id = request.session.id
    end
    # def connect
    #   self.current_user = find_verified_user
    # end
    #
    # private
    # def find_verified_user
    #   if verified_user = User.find_by(id: cookies.encrypted['_session']['user_id'])
    #
    #     verified_user
    #   else
    #     reject_unauthorized_connection
    #
    #   end
    # end
    #
    # def report_error(e)
    #   SomeExternalBugtrackingService.notify(e)
    # end
  end
end