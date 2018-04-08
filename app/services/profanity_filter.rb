class ProfanityFilter
  def initialize(text)
    @text = text
  end

  def censored_text
    censored_words.join(' ')
  end

  private

  PROFANITY_WORDS = %w(debil głupek)

  def censored_words
    text_words.map do |word|
      if PROFANITY_WORDS.include? word
        word[0] = '*'
        word[-1] = '*'
      end

      word
    end
  end

  def text_words
    @text.split
  end

end
