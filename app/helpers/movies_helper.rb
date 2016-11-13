module MoviesHelper

  # returns either the total gross in currency or the sanitized string "Flop!"
  def format_total_gross(movie)
    if movie.flop?
      sanitize(content_tag(:strong, "Flop!"))
    else
      number_to_currency(movie.total_gross)
    end
  end
end
