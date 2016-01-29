class GamePresenter
  CENSOR_CHARACTER = "*"

  def initialize(game)
    @game = game
  end

  def censored_word
    @game.censored_word.map { |letter| letter || CENSOR_CHARACTER }.join
  end

  def number_of_blanks_remaining
    @game.censored_word.count(nil)
  end

  def progression
    if @game.won?
      :won
    elsif @game.lost?
      :lost
    elsif @game.guesses.present?
      :in_progress
    else
      :not_started
    end
  end

  def hangman_image
    html.image_tag("hang#{ (lives_used_as_percentage / 10).to_i }.gif", class: "hangman-image")
  end

  private

  def html
    @html ||= ActionView::Base.new.extend(ActionView::Helpers::TagHelper)
  end

  def number_of_incorrect_guesses
    @game.incorrect_guesses.length
  end

  def lives_used_as_percentage
    @game.lost? ? 100.0 : (number_of_incorrect_guesses / @game.number_of_lives.to_f) * 100
  end
end
