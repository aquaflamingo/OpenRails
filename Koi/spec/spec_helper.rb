require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.definition_file_paths = [File.expand_path('../factories', __FILE__)]
  FactoryBot.find_definitions

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
	end

   config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
   config.shared_context_metadata_behavior = :apply_to_host_groups
end
