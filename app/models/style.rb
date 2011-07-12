class Style < ActiveRecord::Base
  DEFAULT_STYLE_NAME = 'whiteboard'

  class << self
    def default
      Style.find_by_name(DEFAULT_STYLE_NAME)
    end
  end

  def default?
    name == DEFAULT_STYLE_NAME
  end

end
