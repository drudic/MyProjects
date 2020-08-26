module ClientServices
  class ClientEraser < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for deletion of a Client entity." unless @params.key?("id")

      client = Client.find(params[:id])
      client&.destroy
    end
  end
end
