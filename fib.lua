-- Takes one argument, n, and prints the nth fibonacci number.

n = arg[1]

function fib(n)
  if n == 1 or n == 2 then 
    return 1
  end
  return fib(n-1) + fib(n-2) 
end

print(fib(n))
