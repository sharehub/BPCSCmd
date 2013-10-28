config = require("bcs-config")

for i = 1, #config.cpath do
  package.cpath = package.cpath..";"..config.cpath[i]
end

sign = require("bcs-sign")

print(sign.GET(config.bucket, "/backup.txt", config.secretkey))

