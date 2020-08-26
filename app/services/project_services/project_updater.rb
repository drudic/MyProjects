module ProjectServices
  class ProjectUpdater < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for updating of a Project entity." unless @params.key?("id")

      params = @params.slice(:id, :name) # client_id is forbidden, do direct update; use "client" node instead
      project = Project.find(params[:id])
      project.update(params)
      if not project.save
        raise StandardError.new('Update failed; unexpected state of ' + project.to_json)
      end

      return project
    end
  end
end
