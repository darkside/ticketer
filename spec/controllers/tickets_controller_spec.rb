require 'spec_helper'

describe TicketsController do
  describe 'GET index' do
    with_a_logged_user do

        let(:ticket)  { create :ticket, :user => user }
        before(:each) { get :index }

        it 'should assign the amount of tickets this user has to @tickets' do
          assigns(:tickets).should have(user.tickets.count).things
        end

        it 'should only display tickets belonging to this user' do
          assigns(:tickets).each { |t| t.user.should eql(user) }
        end

    end

  end

end

