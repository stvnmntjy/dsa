express = require 'express'

app = express()
app.use express.compress()

app.use '/', express.static "#{__dirname}/bin"
app.use '/fonts', express.static "#{__dirname}/bin/fonts"
app.use '/js', express.static "#{__dirname}/bin/js"
app.use '/css', express.static "#{__dirname}/bin/css"

app.listen 3000
