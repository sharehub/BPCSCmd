-- 5.1 and 5.2 compatible module
local modname = "..."
local md = {}
local _G = _G
package.loaded[modname] = md

if type(setfenv) == "function" then
  setfenv(1, md)
else
  _ENV = md
end

-- cpath will appended to package.cpath
md.cpath={"/usr/share/lua/5.1/?.so",
	"/usr/share/lua/5.1/l?.so"}

-- path will appended to package.path
md.path={}

md.bucket="bucket-name-here"

md.secretkey="BB443040c474c388dd10486e82e226e3"

-- return here
return md

