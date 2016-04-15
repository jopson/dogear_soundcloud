class StaticController < ApplicationController
  def home
  end
  
  def logged
    # create client object with app and user credentials
    client = Soundcloud.new(:client_id => ENV["SOUNDCLOUD_CLIENT_ID"],
                        :client_secret => ENV["SOUNDCLOUD_CLIENT_SECRET"],
                        :username => ENV["USERNAME"],
                        :password => ENV["PASSWORD"])
    puts client.get('/me').username
    
    # upload an audio file
    track = client.post('/tracks', :track => {
    :title => 'This is my sound', #need user input for Title and Artist
    :description => 'User upload testing', #need user input
    :asset_data => File.new("/home/ubuntu/workspace/app/assets/sounds/Intro.mp3"),
    :artwork_data => File.new("/home/ubuntu/workspace/app/assets/images/dogear.png"),
    :sharing => 'public',
    :embeddable_by => 'all',
    :genre => 'Audiobooks',
    :tag_list => 'Podcast Audio Audiobook Speech Spoken',
    :downloadable => true,
    :streamable => true
    })
    
    # print track link
    puts track.permalink_url
  end
  
  
end
