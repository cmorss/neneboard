class Theme < ActiveRecord::Base
  DEFAULT_THEME_NAME = 'whiteboard'

  has_and_belongs_to_many :stencils
  
  class << self
    def default
      Theme.find_by_name(DEFAULT_THEME_NAME)
    end
  end

  def default?
    name == DEFAULT_THEME_NAME
  end

end
