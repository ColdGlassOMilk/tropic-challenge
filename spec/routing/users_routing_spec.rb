# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #new' do
      expect(get: '/users/new').to route_to('users#new')
    end

    it 'routes to #create' do
      expect(post: '/users').to route_to('users#create')
    end
  end
end
