require "rails_helper"

describe Response do
  it { should belong_to :question }
  it { should validate_presence_of :content }
end
