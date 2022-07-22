# frozen_string_literal: true

require 'pry-byebug'

def fibs(num)
  arr = []
  x = 0
  while x < num
    arr[0] = 0 if x == 0
    arr[1] = 1 if x == 1
    arr[x] = arr[x - 2] + arr[x - 1] if x >= 2
    x += 1
  end
  arr
end

def fibs_rec(num)
  return [] if num.zero?
  return [0] if num == 1
  return [0, 1] if num == 2
  binding.pry
  arr = fibs_rec(num - 1)
  arr << arr[-2] + arr[-1]
  arr
end
