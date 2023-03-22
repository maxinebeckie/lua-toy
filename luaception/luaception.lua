-- the idea: 

-- version 1: lua calls rust program that embeds lua interpeter in rust, like
--
--  eg. A lua luaception.lua     opens the rust analyzer with one layer luaception
--  eg. B lua luaception.lua luaception.lua    runs the lua script "luaception.lua" with one layer luaception, 
--                                            thus making two layers luaception. This process can be repeated.
--
--  e.g C lua luaception.lua "<insert lua code here>"     runs the script passed to it
--
-- version 2: lua opens a bunch of threads (or coroutines, whatever those are), and calls a different binary or script in each
-- one, written in a different language (say, rust, C, python, javascript, ruby, haskell, ...), and whichever one completes
-- the passed script first is the output that is presented. An indeterminate mess! could benchmark later to 
-- see if any one language can embed lua the fastest). 

script = arg[1]
print(script)
file = io.open("code", "w")
file:write(script)
os.execute('cd luaception-rs && RUST_BACKTRACE=full cargo run --release')
file:close()
