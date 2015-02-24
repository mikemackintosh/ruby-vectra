describe Slackdraft::Message, 'Slackdraft' do
  include_context "shared environment"
  def app
    Slackdraft::Message
  end

  it 'successfully initializes' do
    expect(app.new ).to eq(false)
  end

end
