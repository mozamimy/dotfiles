Pry.editor = "vim"
require "pp"

%w(continue step next finish quit break reload-method).each do |m|
  Pry.commands.alias_command(m[0], m)
end
