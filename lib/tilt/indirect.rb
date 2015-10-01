require 'tilt'
require 'tilt/template'

module Tilt
  # Evaluate the source data, and render the filename returned.
  class IndirectTemplate < Template
    protected

    def prepare
    end

    # Render the filename returned as a tilt template
    def evaluate(scope, locals, &block)
      Tilt.new(eval(data)).render(scope, locals, &block)
    end
  end


  # Evaluate the source data, and return the content of the
  # filename returned.
  class IndirectRawTemplate < Template
    protected

    def prepare
    end

    # Return the content of the filename returned.
    def evaluate(scope, locals, &block)
      File.read(eval(data))
    end
  end

  register(IndirectTemplate, 'indirect')
  register(IndirectRawTemplate, 'indirectraw')
end
