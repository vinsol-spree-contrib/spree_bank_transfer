module SpreeBankTransfer
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, type: :boolean, default: true

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree/frontend/spree_bank_transfer\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "\n//= require spree/backend/spree_bank_transfer\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_bank_transfer\n", before: /\*\//, verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_bank_transfer\n", before: /\*\//, verbose: true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_bank_transfer'
      end

      def run_migrations
        if options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
          run 'bundle exec rake db:migrate'
        else
          puts "Skiping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
