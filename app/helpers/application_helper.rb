module ApplicationHelper
  def ng_text(model, field_name, extras=nil)
    ng_input 'text', model, field_name, extras
  end
  def ng_password(model, field_name, extras=nil)
    ng_input 'password', model, field_name, extras
  end
  def ng_email(model, field_name, extras=nil)
    messages = ng_input 'email', model, field_name, extras
    messages << raw( "\n<span ng-show=\"#{@form_name}.#{field_name}.$error.#{field_name}\" class=\"help-inline\">e.g., JohnDoe@test.com.  If you ever forget your password, we will send reset instructions to this email address.</span>")
    messages
  end
  
  def ng_input(type, model, field_name, extras=nil)
    result = raw( "<input type=\"#{type}\" ng-model=\"#{model}.#{field_name}\" name=\"#{field_name}\" #{ng_input_validations(@validations[field_name.to_sym])} placeholder=\"#{field_name.titleize}\" #{extras if extras} >")
    result << ng_errors( field_name)
    result
  end

  def ng_input_validations(validations)
    validations.nil? ? "" : raw(validations.map { |val| "#{val.input_attribute}"}.join(' '))
  end

  def ng_errors(input_name)
    if @validations[input_name.to_sym]
      messages = @validations[input_name.to_sym].map do |val| 
        "<span ng-show=\"#{@form_name}.#{input_name}.$error.#{val.ng_show_attribute}\" class=\"help-inline\">#{val.message}</span>"
      end 
      raw(messages.join("\n"))
    end
  end
end
