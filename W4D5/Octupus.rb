require 'byebug'

def sluggish_octopus(fishes)
  longest = fishes[0]

  fishes.each do |fish1|
    fishes.each do |fish2|
      if fish1.length > fish2.length
        longest = fish1
      end
    end
  end

  longest 
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p sluggish_octopus(fishes)

def dominant_octopus(fishes)
  return fishes if fishes.length < 2
  pivot = fishes.first 

  left = fishes.drop(1).select { |fish| fish.length < pivot.length }
  right = fishes.drop(1).select { |fish| fish.length >= pivot.length }

  sorted_left = dominant_octopus(left)
  sorted_right = dominant_octopus(right)

  fish_sort = [sorted_left] + [pivot] + [sorted_right]
  
  fish_sort.flatten.last
end

# p dominant_octopus(fishes)

def clever_octopus(fishes)
  longest = fishes[0]

  fishes.each { |fish| longest = fish if fish.length > longest.length }

  longest 
end

# p clever_octopus(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if dir == tile }
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

new_tile_structure = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}


def fast_dance(dir, new_tile_structure)
  new_tile_structure[dir]
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)
