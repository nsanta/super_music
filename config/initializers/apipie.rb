Apipie.configure do |config|
  config.app_name                = "Super Music"
  # set api base url here
  config.api_base_url            = "/api/v1"
  # set url here for open docs related to apidoc
  config.doc_base_url            = "/apidocs"
  # set true/false for default validation
  config.validate                = false
  # set copyright here
  config.copyright               = "&copy; 2017 nsanta"
  config.validate_value          = false

  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/**/*.rb"
  config.default_version = "1.0"
  config.namespaced_resources = true
end
