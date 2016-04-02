class View

	def menu_actions
		puts "ruby controller.rb index --> List all tasks"
	  puts "ruby controller.rb add TASK --> todo.rb name"
	  puts "ruby controller.rb delete --> todo.rb delete 1"
	  puts "ruby controller.rb complete --> todo.rb complete 1"
	end

	def show(tasks)
		tasks.each_with_index do |task, index|
		  if task.state == "true"
		    puts "#{index+1}.- [X] #{task.task}"
		  else
		  	puts "#{index+1}.- [ ] #{task.task}"
		  end 
		end	
	end

	def add
		puts "Agregaste la tarea 
			#{@task} a la lista"
	end

	def delete(task_delete)
		puts "Tarea borrada #{task_delete}"
	end
  
end

