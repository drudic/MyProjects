module ClientServices
  class ClientLoader < ApplicationService
    def call
      # even though Routes makes this event improssible, this is a multi-user service
      # and pre-conditions must be verified
      raise "Parameter :id is mandatory for loading of a Client entity." unless @params.key?("id")

      Client.find(@params[:id])
    end
  end
end
