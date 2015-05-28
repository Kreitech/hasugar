require 'spec_helper'

describe Hasugar do

  let(:hash) { { name: 'Jhon', phone: '1234' } }

  describe '.transform' do

    context 'when using symbols' do

      subject { hash.transform(name: :x_name) }

      it { should include(:x_name) }
      it { should_not include(:name) }

    end

    context 'when nesting hashes' do

      let(:hash) {
        {
          person: {
            name: 'Jhon', phone: '1234'
          }
        }
      }

      subject { hash.transform(person: { name: :x_name })[:person] }

      it { should include(:x_name) }
      it { should_not include(:name) }
    end

  end

  describe '.keep_keys' do

    subject { hash.keep_keys(:name) }

    it { should_not include(:phone) }

  end

  describe '.keep_keys' do

    subject { hash }
    before { hash.keep_keys!(:name) }

    it { should_not include(:phone) }

  end

  describe '.delete_keys' do

    subject { hash.delete_keys(:name) }

    it { should_not include(:name) }

  end

  describe '.delete_keys!' do

    subject { hash }
    before { hash.delete_keys!(:name) }

    it { should_not include(:name) }

  end


  describe '.require_keys' do

    context 'when all keys are present' do

      subject { hash.require_keys(:name, :phone) }

      it { should be_truthy }

    end

    context 'when a key is missing' do

      subject { hash.require_keys(:x_name, :phone) }

      it { should be_falsey }

    end
  end

end

