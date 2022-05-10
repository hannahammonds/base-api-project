module Api 
    module V1 
        class PlantsController < Api::V1::ApplicationController
            def create 
                # getting the result when creating a plant
                # current user 
                # params
                result = Plants.new_plant(params, @current_user)
                # return an error when failed result 
                render_error(errors: 'Plant not saved', status: 401) and return unless result.success?
                
                # create payload
                payload = {
                    plant: PlantBlueprint.render_as_has(result.payload) 
                }
                # return payload with success
                render_success(payload: payload) 
            end
        
            def update 
                # getting the result when creating a plant
                # current user 
                # params
                result = Plants.update_plant(params[:id], @current_user)
                # return an error when failed result 
                render_error(errors: 'Plant not saved', status: 401) and return unless result.success?
                
                # create payload
                payload = {
                    plant: PlantBlueprint.render_as_has(result.payload) 
                }
                # return payload with success
                render_success(payload: payload) 
            end
        
            def destroy
        
            end
        
            def get_plants 
        
            end
        end
    end
end

# def login
    # result = BaseApi::Auth.login(params[:email], params[:password], @ip)
    # render_error(errors: 'User not authenticated', status: 401) and return unless result.success?

    # payload = {
    #   user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
    #   token: TokenBlueprint.render_as_hash(result.payload[:token])
    # }
    # render_success(payload: payload)
# end