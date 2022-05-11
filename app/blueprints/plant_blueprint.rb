class PlantBluePrint < Blueprinter::Base 
    # id of book record
    identifier: id 

    #default values you want to pass
    fields :seedname

    view :normal do
        fields :created_at, :updated_at 
    end


end