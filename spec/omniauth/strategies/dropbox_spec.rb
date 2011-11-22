require 'spec_helper'

describe OmniAuth::Strategies::Dropbox do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Dropbox.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct Dropbox site' do
      subject.options.client_options.site.should eq('https://api.dropbox.com')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://www.dropbox.com/1/oauth/authorize')
    end

    it 'has correct request token url' do
      subject.options.client_options.request_token_url.should eq('https://api.dropbox.com/1/oauth/request_token')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_url.should eq('https://api.dropbox.com/1/oauth/access_token')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:raw_info) { { 'uid' => '123' } }
      subject.uid.should eq('123')
    end
  end

  describe '#info' do
    before :each do
      @raw_info ||= { 'display_name' => 'Fred Smith' }
      subject.stub(:raw_info) { @raw_info }
    end

    context 'when data is present in raw info' do
      it 'returns the name' do
        subject.info['name'].should eq('Fred Smith')
      end

      it 'returns the email' do
        @raw_info['email'] = 'fred@smith.com'
        subject.info['email'].should eq('fred@smith.com')
      end
    end
  end

  describe '#extra' do
    before :each do
      @raw_info_hash = { "referral_link" => "https://www.dropbox.com/referrals/r1a2n3d4m5s6t7" }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end