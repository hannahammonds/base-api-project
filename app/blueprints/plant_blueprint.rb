class PlantBlueprint < Blueprinter::Base 
    # id of book record
    identifier :id 

    #default values you want to pass
    fields :seed_name, :amount, :weeks_to_mature, :growing_season, :has_been_planted, :when_planted

    view :normal do
        fields :created_at, :updated_at 
    end


end
