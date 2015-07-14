class Theme
  # _dw unit test

  THEMES = %w(marty advanced another more)
  DEFAULT = 'marty'

  def self.get_layout(theme)
    theme_dir(theme) + '/app'
  end

  def self.get_template(theme, template_path)
    'themes/' + theme_dir(theme) + '/' + template_path
  end

  def self.theme_dir(theme)
    THEMES.include?(theme) ? theme : DEFAULT
  end

end

