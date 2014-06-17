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

module OLE_QA::Framework

  # A Data Object in OLE that represents a single line in a given area.
  # A line object can usually be added or deleted, and may or may not
  # have its own line objects beneath it in the page-object hierarchy.
  class Line_Object < Data_Object

    # The line number that this object will have on the screen.
    # - This is the 1-based line number used for replacement of human-readable identifiers.
    attr_accessor :line_number

    # An array containing the name (Symbol) of each subline element on the line object.
    attr_reader :sublines

    # @param ole_session [Object] The OLE_QA::Framework::Session session to pass to the Data Object.
    # @param line_number [Fixnum] The number this line object will use for element definitions.
    def initialize(ole_session, line_number = 1)
      @line_number = line_number
      super(ole_session)
      @sublines = Array.new
      set_sublines if defined?(self.set_sublines)
    end

    # A reader method for the line_id function.
    # - This is the 0-based line number used for replacement of programmatic identifiers such as element IDs.
    def line_id
      @line_number - 1
    end

    # Set a subline object definition on a page object.
    # - A subline object created with this method becomes an accessor attribute
    #   associated with an instance variable on the page or data object on
    #   which it is created.
    #
    # @param name [Symbol] The name the new subline object will have on the object.
    #   (This will be an instance variable, so it cannot contain spaces.)
    # @param klas [Class] The class to instantiate for the new subline object.
    #   (An error will be returned if the class given is not defined.)
    # @param force [Boolean] If set to true, this method can be used to override an existing subline object definition.
    #
    # @raise StandardError if a parameter is of an incorrect type.
    # @raise StandardError if an instance method already exists for a subline object with the same name.
    #   (Suppress with force = true.)
    #
    def set_subline(name, klas, force = false)
      raise StandardError, "Name must be a symbol.  Given:  #{name}  (#{name.class})" unless name.instance_of?(Symbol)
      raise StandardError, "Klas must be a class.  Given:  #{klas}  (#{klas.class})"  unless klas.instance_of?(Class)
      raise StandardError, "Subline object is already defined.  (Use the 'force = true' option to suppress this error.)" if @sublines.include?(name) && ! force
      instance_variable_set("@#{name}", klas.new(@ole, self, 1))
      make_reader(name) unless force
      @sublines << name unless force
    end
    alias_method(:subline, :set_subline)
  end
end
