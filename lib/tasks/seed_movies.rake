# frozen_string_literal: true

require 'httparty'

HEADERS = {
  Authorization: "Bearer #{ENV.fetch('THE_MOVIE_DB_TOKEN', nil)}",
  accept: 'application/json'
}.freeze

BASE_URL = 'https://api.themoviedb.org/3'

namespace :db do
  desc 'Seed movies from the discover-movie endpoint'
  task seed_movies: :environment do
    (1..10).each do |page|
      url = "#{BASE_URL}/discover/movie?include_adult=false&include_video=false
             &language=en-US&sort_by=popularity.desc&page=#{page}"

      response = HTTParty.get(url, headers: HEADERS)

      if response.success?
        movies_response = JSON.parse(response.body)
        movies_response['results'].each do |object|
          Movie.create(object)
        end
      else
        puts "Movies error seeded. Page: #{page} Error: #{response}"
      end
    end

    puts 'Movies successfully seeded.'
  end
end

namespace :db do
  desc 'Seed genres from the genres-movie endpoint'
  task seed_genres: :environment do
    url = "#{BASE_URL}/genre/movie/list?language=en"
    response = HTTParty.get(url, headers: HEADERS)

    if response.success?
      genres_response = JSON.parse(response.body)

      genres_response['genres'].each do |object|
        Genre.find_or_create_by(id: object['id']) do |gender|
          gender.name = object['name']
        end
      end

      puts 'Genres successfully seeded.'
    else
      puts "Genres error seeded. #{response}"
    end
  end
end
