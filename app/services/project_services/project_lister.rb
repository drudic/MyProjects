module ProjectServices
  class ProjectLister < ApplicationService
    def call
      Project.order('created_at DESC')
    end
  end
end
