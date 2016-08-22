module Quality
  module Tools
    # Adds 'bundler_audit' tool support to quality gem
    module BundlerAudit
      private

      def quality_bundler_audit
        ratchet_quality_cmd('bundle-audit', args: '') do |line|
          if line =~ /^Name: /
            1
          else
            0
          end
        end
      end
    end
  end
end