require 'spec_helper'

describe Ticket do
  # Validations
  should_validate_presence_of  :name
  should_validate_presence_of  :user_id
  should_validate_inclusion_of :status, :in => Ticket::STATUSES

  # Associations
  should_belong_to :user

  context 'given valid parameters' do
    subject { build :ticket }
    it 'should save the instance' do
      subject.save.should be_true
    end
  end
end

