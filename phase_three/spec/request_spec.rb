require_relative '../lib/time_error.rb'

RSpec.describe TimeError do
  it "returns the difference between the server time and the local time" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"213.230.194.2","datetime":"2022-09-22T11:11:38.732168+01:00","day_of_week":4,"day_of_year":265,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1663841498,"utc_datetime":"2022-09-22T10:11:38.732168+00:00","utc_offset":"+01:00","week_number":38}')
    time = Time.new(2022, 9, 22, 11, 11, 38)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.732168
  end
end 