require_relative '../spec_helper'

describe User do
  describe 'attributes' do

    it 'has a name' do
      subject.name = "Test"
      expect(subject.name).to eq("Test")
    end

    it 'has a email' do
      subject.email = "Test"
      expect(subject.email).to eq("Test")
    end

    it 'has a password' do
      subject.password = "Test"
      expect(subject.password).to eq("Test")
    end

  end
end