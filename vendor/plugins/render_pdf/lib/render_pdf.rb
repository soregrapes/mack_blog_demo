module Mack
  module Rendering
    module Engine
      class Pdf < Mack::Rendering::Engine::Base
        
        def render(io, binding)
          @_pdf = ::PDF::Writer.new
          self.view_template.instance_variable_set("@_pdf", @_pdf)
          eval(io, binding)
          @_pdf.render
        end
        
        def extension
          :pdfw
        end
        
        module ViewHelpers
          def pdf
            @_pdf
          end
        end
        
      end
    end
  end
end
Mack::Rendering::ViewTemplate.send(:include, Mack::Rendering::Engine::Pdf::ViewHelpers)
Mack::Rendering::Engine::Registry.register(:action, :pdf)
