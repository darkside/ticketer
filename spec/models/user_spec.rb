require 'spec_helper'

describe User do
  should_validate_presence_of :username

  # instead of remarkable's broken validate_uniqueness_of
  it { should have_index(:username).unique(true) }

end

