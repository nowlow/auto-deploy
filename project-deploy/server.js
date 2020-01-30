

let express = require("express")
let app = express()
let childProcess = require('child_process')
let bodyParser = require('body-parser')

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

let data = require('fs').readFileSync('./config.json')
let config = JSON.parse(data)

config.forEach(element => {
    app.post(element.webhook, function (req, res) {
        var branch = req.body.ref
    
        if (branch.indexOf('master') > -1) {
            deploy(element.path, res)
        }
    })
});

app.listen(1337, function() {
    console.log('Webhook handler started on port 1337')
})

function deploy(path, res) {
    childProcess.exec('cd ' + path + ' && ./deploy.sh', function(err, stdout, stderr) {
	if (err) {
        console.error(err)
	}
	console.log(path + ' was updated')
        res.sendStatus(200)
    })
}