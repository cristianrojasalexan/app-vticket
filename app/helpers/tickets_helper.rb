module TicketsHelper
    def get_priority_text(option)
        priority_name = ""
        case option
        when 1
            priority_name = "Alta"
        when 2
            priority_name = "Normal"
        when 3
            priority_name = "Baja"
        else
            priority_name = "Normal"
        end
        return priority_name
    end

    def get_status_text(option)
        status_name = ""
        case option
        when 1
            priority_name = "Pendiente"
        when 2
            priority_name = "En Desarrollo"
        when 3
            priority_name = "Terminado"
        else
            priority_name = "Cancelado"
        end
        return priority_name
    end
end
