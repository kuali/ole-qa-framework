#  Copyright 2005-2013 The Kuali Foundation
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

module OLE_QA::Framework::OLELS
  # An OLE Libary System E-Document page.
  class E_Doc < OLE_QA::Framework::Page
    # Set elements common to all OLELS E-Document pages.
    def set_elements
      super
      element(:title)                                 {b.h1(:class => 'uif-headerText').span(:class => 'uif-headerText-span')}
      element(:description_field)                     {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Description:')]]/following-sibling::td[1]/descendant::input[1]")}
      element(:explanation_field)                     {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Explanation:')]]/following-sibling::td[1]/descendant::textarea[1]")}
      element(:org_doc_number_field)                  {b.text_field(:xpath => "//tr/th[descendant::label[contains(text(),'Organization Document Number:')]]/following-sibling::td[1]/descendant::input[1]")}
      element(:document_id)                           {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Document Number:')]]/following-sibling::td[1]/div/span")}
      element(:initiator_id)                          {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Initiator Network Id:')]]/following-sibling::td[1]/div/span")}
      element(:document_status)                       {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Document Status:')]]/following-sibling::td[1]/div/span")}
      element(:creation_timestamp)                    {b.span(:xpath => "//table[@class='uif-gridLayout']/descendant::th[span/label[contains(text(),'Creation Timestamp:')]]/following-sibling::td[1]/div/span")}
    end

    # FIXME - Make this a single flexible method during namespace revision.
    # Create a line object on a page.
    def create_line(instance_name, class_name, which=0)
      raise StandardError, "Line object already exists.  (#{instance_name})" if self.instance_variables.include?("@#{instance_name}".to_sym)
      new_line_name = instance_name
      make_accessor(:"#{instance_name}")
      klas = OLE_QA::Framework::OLELS.const_get(:"#{class_name}")
      instance_variable_set(:"@#{new_line_name}", klas.new(@ole, which))
    end

    # Remove a line object from a page.
    def remove_line(instance_name)
      raise StandardError, "Line object does not exist.  (#{instance_name})" unless self.instance_variables.include?("@#{instance_name}".to_sym)
      remove_instance_variable("@#{instance_name}".to_sym)
      unmake_attr(instance_name.to_sym)
    end
  end
end