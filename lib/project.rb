class Project

    attr_accessor :title

    @@all = []

    def initialize(title="")
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        #take in a backer instance.
        #create a ProjectBacker instance using the provided Backer instance and the current Project instance
        ProjectBacker.new(self, backer)
    end

    def backers
        #returns all backers associated with this Project instance
        project_backers_array = []
        ProjectBacker.all.each do |projectbacker_instance|
        if projectbacker_instance.project == self
            project_backers_array << projectbacker_instance # a cleaner way to do this would be add .backer here and remove lines 30-31
            end
        end
        project_backers_array.map do |project_backer_instance|
            project_backer_instance.backer
        end
    end

end