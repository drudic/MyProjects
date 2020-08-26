module ProjectServices
  class ProjectEraser < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for deletion of a Project entity." unless @params.key?("id")

      project = Project.find(params[:id])
      project&.destroy
    end
  end
end
