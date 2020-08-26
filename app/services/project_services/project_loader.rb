module ProjectServices
  class ProjectLoader < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for loading of a Project entity." unless @params.key?("id")

      Project.find(@params[:id])
    end
  end
end
