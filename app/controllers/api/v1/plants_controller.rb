module Api 
    module V1 
        class PlantsController < Api::V1::ApplicationController
            def create 
                # getting the result when creating a plant
                # current user 
                # params
                result = Plants.new_plant(plant_params, @current_user)
                # return an error when failed result 
                render_error(errors: 'Plant not saved') and return unless result.success? 
                # create payload
                payload = {
                    plant: PlantBlueprint.render_as_hash(result.payload) 
                }
                # return payload with success
                render_success(payload: payload) 
            end
        
            def update 
                # getting the result when creating a plant
                # current user 
                # params
                result = Plants.update_plant(params[:id], plant_params, @current_user)
                # return an error when failed result 
                render_error(errors: 'Plant not saved', status: 400) and return unless result.success?
                
                # create payload
                payload = {
                    plant: PlantBlueprint.render_as_hash(result.payload), 
                }
                # return payload with success
                render_success(payload: payload) 
            end
        
            def destroy
                result = Plants.destroy_plant(params[:id], @current_user)
                render_error(errors: "Plant did not delete!", status: 400) and return unless result.success?
                render_success(payload: nil)
            end
        
            def get_plants 
                render_success(payload: PlantBlueprint.render_as_hash(@current_user.plants))
            end

        private 
          def plant_params
            params.require(:plant).permit(:seed_name, :amount, :weeks_to_mature, :growing_season, :has_been_planted, :when_planted)
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