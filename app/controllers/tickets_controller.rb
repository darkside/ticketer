class TicketsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html

  protected
    def begin_of_association_chain
      @current_user
    end
end

