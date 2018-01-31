require 'google/cloud/translate'

# Translates messages with the help of Google Cloud Translator API
#
class GoogleTranslateProvider
  def initialize(project_id, credentials)
    @client = Google::Cloud::Translate.new(project: project_id,
                                           credentials: credentials)
  end

  def translate(text, to)
    @client.translate text, to: to
  end
end