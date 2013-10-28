-- 5.1 and 5.2 compatible module
local modname = "..."
local md = {}
-- _G[modname] = md
package.loaded[modname] = md

crypto = require("crypto")
base64 = require("base64")
url = require("socket.url")

function urlsign(method, bucket, obj, sk)
  content = string.format("MBO\nMethod=%s\nBucket=%s\nObject=%s\n", method, bucket, obj)
  return url.escape(base64.encode(crypto.hmac.digest("sha1", content, sk, true)))
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

return md

