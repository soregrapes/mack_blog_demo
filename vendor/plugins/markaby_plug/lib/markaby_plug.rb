module Mack
  module Rendering
    module Engine
      class Markaby < Mack::Rendering::Engine::Base
        
        def initialize(view_template)
          super
          @_markaby = ::Markaby::Builder.new({}, self.view_template)
          self.view_template.instance_variable_set("@_markaby", @_markaby)
        end
        
        def render(io, binding)
          eval(io, binding)
        end
        
        def extension
          :mab
        end
        
        module ViewHelpers
          def mab
            @_markaby
          end
        end
        
      end
    end
  end
end
Mack::Rendering::ViewTemplate.send(:include, Mack::Rendering::Engine::Markaby::ViewHelpers)
Mack::Rendering::Engine::Registry.register(:action, :markaby)
