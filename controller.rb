
require_relative 'model'
require_relative 'view'

class Controller

	#crea el objeto de iteracion
	def initialize
		@model = List.new
		@view = View.new
		actions
	end

def actions  #ruby controller.rb add nueva tarea
	if ARGV.any?
		task = ARGV[1..-1].join(" ")
		id = ARGV[1]

	  case ARGV[0]
	    when "index"
	      index
	    when "add"
	      add(task)
	    when "delete"
	      delete(id.to_i)
	    when "complete"
	      complete(id.to_i)
	    else
	      p "invalid command"
	       @view.menu_actions
	  end
	else
			@view.menu_actions
	end
end

	def index
		@view.show(@model.index)
	end

	def add(task)
		@model.create(Task.new(task))
	end

  def delete(id)
  	tasks = @model.index
  	new_array = @model.delete(tasks,id)
  	@model.save(new_array)
  	@view.show(@model.index)
  end

	def complete(id)
		tasks = @model.index
		task_complete = @model.complete(tasks, id)
		@model.save(task_complete)
		@view.show(@model.index)

	end
end

Controller.new

