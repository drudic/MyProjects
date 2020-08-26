module ClientServices
  class ClientUpdater < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for updating of a Client entity." unless @params.key?("id")
      params = @params.slice(:id, :name)
      client = Client.find(params[:id])
      client.update(params)
       if not client.save
         raise StandardError.new('Update failed; unexpected state of ' + client.to_json)
       end

      return client
    end
  end
end
