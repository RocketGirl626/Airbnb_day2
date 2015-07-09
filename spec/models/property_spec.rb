require 'rails_helper'

describe Property do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :available }
  it { should belong_to :user }
  it { should have_many :reviews}

end
