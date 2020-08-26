module ClientServices
  class ClientLister < ApplicationService
    def call
      Client.order('created_at DESC')
    end
  end
end
