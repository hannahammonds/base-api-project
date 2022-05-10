# A service is comprised of nested/or one module with defined methods
module Plants 
    def self.new_plant(params, current_user) 
        # creating an unsaved record
        #plant = current_user.plants.new(params)
        plant = Plant.new(
            seed_name: params[:seed_name],
            amount: params[:amount],
            weeks_to_mature: params[:weeks_to_mature],
            growing_season: params[:growing_season],
            has_been_planted: params[:has_been_planted],
            when_planted: params[:when_planted]
        )
        # send back results depending on if record is valid
        plant.save!

        return ServiceContract.error('Error saving plant.') unless plant.save 
        
        ServiceContract.success(plant) 
    end

    def self.update_plant(plant_id, params)
        #update with plant id
        plant = Plant.find(plant_id)
        #update
        #return error if not successful
        return ServiceContract.error('Plant did not save successfully.') unless plant.update(params)
        #return success if successful
        ServiceContract.success(plant)

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