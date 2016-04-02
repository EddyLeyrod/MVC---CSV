require 'csv'

class Task
	attr_accessor :task, :state
	def initialize(task, state=false)
		@task = task
		@state = state
	end
end

# list es un arreglo de task
class List
	def create(task)
		CSV.open("list.csv", "a+") do |csv|
			csv << [task.task]
		end
	end

	def index
		tasks = []
		CSV.foreach("list.csv") do |task|
			tasks << Task.new(task[0],task[1])
		end
		tasks	
	end

	def delete(tasks, id)
		new_array = []
		tasks.each_with_index do |task, index|
			unless id == (index+1)
				new_array << task				
			end
		end
		new_array
 	end

 	def save(tasks)
		CSV.open("list.csv", "wb") do |csv|
 			tasks.each do |task|
 			  csv << [task.task, task.state]
 			end
 		end
 	end

 	#recibe la List.new de las tasks


  def complete(tasks, id)
  	
  	tasks.each_with_index do |task, index|
  		if id == (index+1)
  			 task.state=true
  		end
  	end
  	tasks
	end
end	