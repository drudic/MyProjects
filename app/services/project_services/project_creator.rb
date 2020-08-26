module ProjectServices
  class ProjectCreator < ApplicationService
    def call
      raise "Parameter :id is not allowed for new Project entities." if @params.key?("id")
      # client_id is forbidden, do direct update; use "client" node instead
      params = @params.slice(:name, :client)

      # parse project
      project = Project.new(name: params[:name], created_at: Time.now)

      # parse embedded client, if exists
      if params.key?("client")
        process_client( project, params )
      end

      if not project.save
        raise StandardError.new('Update failed; unexpected state of ' + project.to_json)
      end

      return project
    end

    def process_client(project, params)
      clientJson = JSON.parse(params[:client].to_json).with_indifferent_access
      newClient = nil
      # if the client has id, it is an existing client
      if clientJson.key?("id")
        newClient = ClientServices::ClientUpdater.call(clientJson)
      # else, it is a new one
      else
        newClient = Client.new(clientJson)
      end

      # return project with associated client
      project.client = newClient
    end
  end
end