
s = "string";
try
    s[1] = "p"
catch e
    println("caught an error $e")
    println("but we can continue with execution")
end

try
    s[1] 
catch e

end
