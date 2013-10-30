config = require("bcs-config")

for i = 1, #config.cpath do
  package.cpath = package.cpath..";"..config.cpath[i]
end

sign = require("bcs-sign")
bcscmd = require("bcs-cmd")

method = "PUT"
file = arg[1]

thesign="sign=MBO:"..config.apikey..":"..sign[method](config.bucket, "/"..file, config.secretkey)
url = "http://"..config.host.."/"..config.bucket.."/%2F"..file.."?"..thesign

bcscmd.upload(file, url)
-- bcscmd.curlobjinfo()
