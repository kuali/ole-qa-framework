#  Copyright 2005-2014 The Kuali Foundation
#
#  Licensed under the Educational Community License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at:
#
#    http://www.opensource.org/licenses/ecl2.php
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

module OLE_QA::Framework::Page_Helpers

  # Set a line object definition on a page object.
  # - A line object created with this method becomes an accessor attribute
  #   associated with an instance variable on the page or data object on
  #   which it is created.
  #
  # @param name [Symbol] The name the new line object will have on the object.
  #   (This will be an instance variable, so it cannot contain spaces.)
  # @param klas [Class] The class to instantiate for the new line object.
  #   (An error will be returned if the class given is not defined.)
  # @param force [Boolean] If set to true, this method can be used to override an existing line object definition.
  #
  # @raise StandardError if a parameter is of an incorrect type.
  # @raise StandardError if an instance method already exists for a line object with the same name.
  #   (Suppress with force = true.)
  #
  def set_line(name, klas, force = false)
    raise StandardError, "Name must be a symbol.  Given:  #{name}  (#{name.class})" unless name.instance_of?(Symbol)
    raise StandardError, "Klas must be a class.  Given:  #{klas}  (#{klas.class})"  unless klas.instance_of?(Class)
    raise StandardError, "Line object is already defined.  (Use the 'force = true' option to suppress this error.)" if @lines.include?(name) && ! force
    instance_variable_set("@#{name}", klas.new(@ole, 1))
    make_reader(name) unless force
    @lines << name unless force
  end
  alias_method(:line, :set_line)
end