require 'sinatra'
require './lib/conway'
require 'pry'
def get_grid(height, width, living_cells)
  grid = Conway::Grid.new(height: height,
    width: width)
  living_cells.each{|x,y| grid.set_alive(x,y)}
  grid.update_state
  grid
end

get '/' do
  @height = (params[:height] || 10).to_i
  @width = (params[:width] || 10).to_i
  living_cells = params[:grid] ? params[:grid].keys.map{|key| key.split('-').map(&:to_i)} : {}
  @grid = get_grid(@height, @width, living_cells)
  erb :index
end
