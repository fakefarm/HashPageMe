class ThemeService
  THEMES = %w(default advanced another more)
  DEFAULT = 'default'

  def self.get_layout(theme)
    theme_dir(theme) + '/app'
  end

  def self.get_template(theme, template_path)
    'fetchers/' + theme_dir(theme) + '/' + template_path
  end

  def self.theme_dir(theme)
    THEMES.include?(theme) ? theme : DEFAULT
  end

end
