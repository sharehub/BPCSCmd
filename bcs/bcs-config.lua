-- 5.1 and 5.2 compatible module

local modname = "..."
local md = {}
-- _G[modname] = md
package.loaded[modname] = md

-- cpath will appended to package.cpath
md.cpath={"/usr/share/lua/5.1/?.so",
	"/usr/share/lua/5.1/l?.so"}

-- path will appended to package.path
md.path={}

md.bucket="bucket-name-here"

md.secretkey="BB443040c474c388dd10486e82e226e3"

-- return here
return md

