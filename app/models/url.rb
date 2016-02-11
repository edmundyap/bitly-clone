class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  #callbacks in active record
  # before_create :shorten


  validates_format_of :long_url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  validates :long_url, uniqueness: true

  def shorten
    input = SecureRandom.hex(6)
    self.update(short_url: input)
  end
end
