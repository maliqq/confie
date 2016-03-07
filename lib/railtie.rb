class ConfieRailtie < Rails::Railtie
  config.before_configuration do
    config_root = Rails.root.join('config')
    Confie.files = [
      config_root.join('settings.yml'),
      config_root.join("settings/#{Rails.env}.yml"),
      config_root.join("settings/#{Rails.env}.local.yml")
    ].map(&:to_s)
  end
end
