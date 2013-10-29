--[[
  BCS sign method according to:
    http://developer.baidu.com/wiki/index.php?title=docs/cplat/stor/access/signed-url
  And verified by:
    http://developer.baidu.com/bae/bcs/key/sign/

  Currently it only support MBO, may add more in the future
--]]

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

-- Global variables we used
require = _G.require
string = _G.string

-- libraries we import
crypto = require("crypto")
base64 = require("base64")
-- url = require("socket.url")
curl = require("curl") -- will match 'liblua5.1-curl.so'

function urlsign(method, bucket, obj, sk)
  content = string.format("MBO\nMethod=%s\nBucket=%s\nObject=%s\n", method, bucket, obj)
  return curl.escape(base64.encode(crypto.hmac.digest("sha1", content, sk, true)))
end

md.GET = function(bucket, obj, sk)
  return urlsign("GET", bucket, obj, sk)
end

md.POST = function(bucket, obj, sk)
  return urlsign("POST", bucket, obj, sk)
end

md.DELETE = function(bucket, obj, sk)
  return urlsign("DELETE", bucket, obj, sk)
end

md.PUT = function(bucket, obj, sk)
  return urlsign("PUT", bucket, obj, sk)
end

md.HEAD = function(bucket, obj, sk)
  return urlsign("HEAD", bucket, obj, sk)
end

return md

