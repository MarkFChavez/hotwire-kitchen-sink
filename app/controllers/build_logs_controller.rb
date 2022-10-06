class BuildLogsController < ApplicationController

  def show
  end

  def update
    RunLogJob.perform_now(@build_log.id, :clear)

    BuildLog::TEMPLATES.each_with_index do |template, idx|
      time_to_wait = (idx.to_i + 1) * 2
      RunLogJob.
        set(wait: time_to_wait.seconds).
        perform_later(@build_log.id, template)
    end

    head :no_content
  end

end
