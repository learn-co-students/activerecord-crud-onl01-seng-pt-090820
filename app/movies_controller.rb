# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes)
  movie.save
  movie
end

def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990})
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990
    movie = Movie.create do |m|
      #binding.pry
      m.title = args[:title]
      m.release_date = args[:release_date]
      movie
  end
end


def can_get_the_first_item_in_the_database
  first_film = Movie.first
  first_film
end

def can_get_the_last_item_in_the_database
  last_film = Movie.last
  last_film
end

def can_get_size_of_the_database
  db_size = Movie.all.length
  db_size
end

def can_find_the_first_item_from_the_database_using_id
  first_id = Movie.find_by(id: 1)
  first_id
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  movie = Movie.find_by(title: "Title", release_date: 2000, director: "Me")
  movie
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  #binding.pry
  movie_list = Movie.where("release_date > 2002").order('release_date DESC')
  movie_list
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  awesome_flick = Movie.find_by(title: "Awesome Flick")
  #binding.pry
  awesome_flick.update(title: "Even Awesomer Flick")
  awesome_flick.save
  awesome_flick
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  movie = Movie.create(title: "Wat?")
  movie.update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
    Movie.all.update(title: "A Movie")
  end

end

def can_destroy_a_single_item
  m = Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  m = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  m.destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end