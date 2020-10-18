class Backer

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def back_project(project)
        #take in a project instance.
        #create a ProjectBacker instance using the provided Project instance and the current Backer instance
        ProjectBacker.new(project, self)
    end

    def backed_projects
        #returns an array of all projects associated with this Backer instance
        #project instances are not directly associated with Backer instances - get this info through the ProjectBacker class
        project_backers_array = []
        ProjectBacker.all.each do |projectbacker_instance|
        if projectbacker_instance.backer == self
            project_backers_array << projectbacker_instance # a cleaner way to do this would be add .project here and remove lines 27-28
            end
        end
        project_backers_array.map do |project_backer_instance|
            project_backer_instance.project
        end
    end

end