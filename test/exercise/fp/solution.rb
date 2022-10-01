module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rating_array = array.map { |film| film['country'].to_s.split(',').length > 1 ? film['rating_kinopoisk'].to_f : 0 }
        rating_array.reduce(0, :+) / rating_array.map { |rate| rate.positive? ? 1 : 0 }.reduce(0, :+)
      end

      def chars_count(films, threshold)
        films.map { |film| film['rating_kinopoisk'].to_f >= threshold ? film['name'].count('и') : 0 }.reduce(0, :+)
      end
    end
  end
end
