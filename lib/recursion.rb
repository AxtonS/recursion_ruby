# frozen_string_literal: true

def fibs(num)
  arr = []
  x = 0
  while x < num
    arr[0] = 0 if x.zero?
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

  arr = fibs_rec(num - 1)
  arr << arr[-2] + arr[-1]
  arr
end

def merge_sort(arr)
  return arr if arr.length <= 1

  arr_a = merge_sort(arr[0..arr.length / 2 - 1])
  arr_b = merge_sort(arr[arr.length / 2..])
  i_a = 0
  i_b = 0
  i_c = 0
  arr_c = []
  while i_a < arr_a.length || i_b < arr_b.length
    if arr_a[i_a] == nil
      arr_c[i_c] = arr_b[i_b]
      i_b += 1
    elsif arr_b[i_b] == nil
      arr_c[i_c] = arr_a[i_a]
      i_a += 1
    elsif (arr_a[i_a] < arr_b[i_b])
      arr_c[i_c] = arr_a[i_a]
      i_a += 1
    else
      arr_c[i_c] = arr_b[i_b]
      i_b += 1
    end
    i_c += 1
  end
  arr_c
end

require 'pry-byebug'

# sum of multiples of 3 or 5 below 1000
def multiples(count = 999, sum = 0)
  return sum if count == 0
  sum += count if (count % 5 == 0) || (count % 3 == 0)
  multiples(count - 1, sum)
end

# sum of even fibonacci numbers below 4 million
def fibs_even(n = 48)
  sum = 0
  while n >= 2 && fibs(n)[n-1] < 4000000000
    if fibs(n)[n-1] % 2 == 0
      sum += fibs(n)[n-1]
    end
    n -= 1
  end
  sum
end
