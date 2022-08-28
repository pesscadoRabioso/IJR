require_relative "ui.rb"

def verifyValue(totalCapacity, value, storage)
    if totalCapacity - value == 0
        outOfMoney
        false
    elsif totalCapacity - value < 0
        notEnoughMoney(totalCapacity)
        false
    else 
        return true
    end
end

#### total storage capacity storage

def maxCapacity(storage)
    i = 0
    j = 0
    total = 0

    while i < 6
        total += storage[i][0] * storage[i][1]

        j += 1
        i += 1

    end
    total
end

#### value catcher

def option(storage)
    request_value
    value = gets.to_i
    value
end

def computeChange(value, storage, change, i)
    while value > 0 && value - maxCapacity(storage) <= 0
        while value - storage[i][0] >= 0 && storage[i][1] > 0 && value.to_s.match(/[[:digit:]]/)
            if storage[i][1] - 1 >= 0
                value -= storage[i][0] 
                storage[i][1] -= 1
                change << storage[i][0]
            end
        end
        i+=1
    end
    change
end

#### atm func

def atm(storage, totalCapacity)
    value = option(storage)
    change = []
    i = 0

    if verifyValue(totalCapacity, value, storage)
        change = computeChange(value, storage, change, i)
        change_msg(change)
    else
        puts "ERROR"
    end
end

#### loop definition

def init
    storage = [[100, 1],[50, 2],[20, 4],[10, 8],[5, 16],[1, 32]]
    totalCapacity = maxCapacity(storage)
    welcome_msg(storage)
    loop do 
        atm(storage, totalCapacity)
        current_storage(storage)
    end    
end