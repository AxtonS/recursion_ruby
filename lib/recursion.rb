# frozen_string_literal: true

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
