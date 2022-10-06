class BuildLog < ApplicationRecord

  validates :identifier, presence: true, uniqueness: true

  NO_LOG = "No log whatsoever".freeze

  TEMPLATES = [
    "Initializing server... \n",
    "Copying files and templates.. \n",
    "Done",
  ].freeze

  def append(content)
    new_body = self.body.to_s + content
    update(body: new_body)
  end

end
