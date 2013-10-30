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

md.host = "bcs.duapp.com"
md.bucket=""
md.apikey = ""
md.secretkey=""

-- return here
return md

