local primes = {}
local file = io.open("primes.txt",  "w")
local lastPrimeLen = 0
local currentPrimeLen = 0 
function checkPrime(num)
	if num == 1 or num == 2 then
		return true
	end
	for _, v in pairs(primes) do
		if v ~= 1 then
			if v <= math.sqrt(num) then
				if num % v == 0 then
					return false
				end
			else
				break
			end
		end
	end
	return true
end
 for i = 1, 1000000 do
	if checkPrime(i) then 
		table.insert(primes, i)
		currentPrimeLen = string.len(tostring(i))
		if currentPrimeLen > lastPrimeLen then
			file:write("\n", 10^(currentPrimeLen-1), "'s \n :", i , ", " )
		else
			file:write(i, ", ")
		end
		print(i)
		lastPrimeLen = currentPrimeLen
	end
end
file:close()