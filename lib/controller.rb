# frozen_string_literal: true

class Controller
  def instance_variables_hash
    vars = {}
    instance_variables.each { |var| vars[var] = instance_variable_get(var) }
    vars
  end

  protected

  def render(view_class)
    view = view_class.new(self)
    view.render
  end

  def redirect_to(path, **)
    handler = resolve_path(path)
    handler.call(**)
  end

  def resolve_path(path) = Routes::PATHS[path]
end
