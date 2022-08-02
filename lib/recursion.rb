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

# sum of the even fibonacci numbers
def even_fibs(n = 1, sum = 0)
  if n == 1
    f = 0
  elsif n == 2
    f = 1
  else
    f = even_fibs(n - 1, sum) + even_fibs(n - 2, sum)
  end
  if f % 2 == 0
    sum += f
  end
  n += 1 
  if f >= 4000000000
    return sum
  end
end

# largest prime factors
require 'prime'

def get_prime_factors(num)
  return nil if num <= 1
  factors = []
  (2..num).each do |i| 
    if i.prime? && num % i == 0
      factors << i
      factors << get_prime_factors(num / i)
      break
    end
  end
  factors.delete(nil)
  factors.max
end

# largest palindrome made up of product of two 3 digit numbers

def largest_palindrome(x = 999, y = 999, min = 100, largest = 0)
  product = x * y
  if product.to_s.reverse.to_i == product
    largest = [product, largest].max
    min = y
  end
  return largest if x < min

  if y > min
    largest_palindrome(x, y - 1, min, largest)
  else
    largest_palindrome(x - 1, x - 1, min, largest)
  end
end

# smallest number divisible by 1 through 20
# only works up to 1 through 10 without stack overflow error

def smallest_divisible(num = 1)
  return num if (1..20).all? { |divider| (num % divider).zero?}

  smallest_divisible(num + 1)
end

p smallest_divisible
