module Test
  module Quality
    module Tools
      # Test for the 'cane' tool within the quality gem
      module Cane
        def expected_args
          '--doc-glob {app,lib,test,spec,feature}/**/*.rb ' \
          '--style-glob {app,lib,test,spec,feature}/**/*.rb ' \
          '--abc-glob {app,lib,test,spec,feature}/**/*.rb'
        end

        def expect_cane_run(quality_checker)
          @mocks[:quality_checker_class]
            .expects(:new).with('cane',
                                { gives_error_code_on_violations: true,
                                  args: expected_args,
                                  emacs_format: true },
                                'metrics',
                                false)
            .returns(quality_checker)
          @mocks[:configuration_writer].expects(:exist?).with('.cane')
            .returns(true)
        end
      end
    end
  end
end
