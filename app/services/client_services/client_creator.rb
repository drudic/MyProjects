module ClientServices
  class ClientCreator < ApplicationService
    def call
      raise "Parameter :id is not allowed for new Client entities." if @params.key?("id")
      client = Client.new(name: params[:name], created_at: Time.now)
      if not client.save
        raise StandardError.new('Update failed; unexpected state of ' + client.to_json)
      end

      return client
    end
  end
end