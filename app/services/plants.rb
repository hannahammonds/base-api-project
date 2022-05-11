# A service is comprised of nested/or one module with defined methods
module Plants 
    def self.new_plant(params, current_user) 
        # creating an unsaved record
        plant = current_user.plants.new(params)
        # send back results depending on if record is valid
        
        return ServiceContract.error('Error saving plant.') unless plant.save 
        ServiceContract.success(plant) 
    end

    def self.update_plant(plant_id, params, current_user)
        #update with plant id
        plant = current_user.plants.find(plant_id)
        #update
        #return error if not successful
        return ServiceContract.error('Plant did not save successfully.') unless plant.update(params)
        #return success if successful
        ServiceContract.success(plant)
    end

    def self.destroy_plant(plant_id, params, current_user)
        plant = current_user.plants.find(plant_id)
        ServiceContract.error('Error deleting plant') and return unless plant.destroy 
        ServiceContract.success(payload: nil)
    end
    

    end
end


# def self.new_user(params)
#     user = User.new(
#       first_name: params[:first_name],
#       last_name: params[:last_name],
#       email: params[:email],
#       phone: params[:phone],
#       password: params[:password],
#       password_confirmation: params[:password_confirmation]
#     )
#     return ServiceContract.error('Error saving user.') unless user.save

#     ServiceContract.success(user)
#   end