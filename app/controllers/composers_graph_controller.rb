class ComposersGraphController < ApplicationController
  def index
  end

  def data
    @uranohoshi_songs = Song.all
    @otonokizaka_songs = YAML.load_file('otonokizaka.yml')
    @nijigasaki_songs = YAML.load_file('nijigasaki.yml')
  end
end
