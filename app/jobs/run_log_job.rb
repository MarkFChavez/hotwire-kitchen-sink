class RunLogJob < ApplicationJob

  def perform(build_log_id, body)
    build_log = BuildLog.find(build_log_id)

    if body.to_sym == :clear
      build_log.update(body: "Building logs... \n")
    else
      build_log.append(body)
    end

    Turbo::StreamsChannel.broadcast_update_to(
      "build_logs",
      target: "build_log_#{build_log.id}",
      partial: "build_logs/body", locals: { build_log: build_log },
    )
  end

end
