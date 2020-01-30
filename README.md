# Auto-deploy
## Introduction
This code may not have been tested in this EXACT version, so please me report me any error on launch or even on runtime
## Usage
You have to do some work by yourself to deploy the auto deployer (obviously).
* Go to the repository that you want to automaticly deploy, then click on `Settings`, `Webhooks`, `add webhook`
* Choose a payload url (this URL should be able to catch json). Example: https://mywebsite.com/webhook/
* Select `application/json` on content type field

#### Now log to your server

* Copy the `./project-deploy` folder wherever you want (personally I always put it in my user's home directory).
* Edit the `config.json` file to match your payload url (`webhook` field) and the path to your project (`path` field).
> It may be preferable to put your projects in containging folders. Assuming your project's name is 'mySuperProject' (what a beautiful and descriptive name), it would make your life easier to move it to 'mySuperContainer/mySuperProject'.
* Now move the `project-template/deploy.sh` to every projects container that you want to automaticly deploy.
* Edit the file to match the commands that your user should execute your project's launch. (like running `npm install` and `npm start`) on `do_to_launch` function.

#### You're alomst done
* Run `./launch.sh` on `project-deploy` (where you moved it).
* Run `./deploy.sh` on every folder containing your projects.
* Run away (it may explode).

## Warnings
The deploy will reset your repository before pulling to avoid errors on this step. So don't be an asshole and don't edit your files directly on your server (you now got a super auto deployer, use it).
I think the `server.js` file may not work for multiple projects, I tried make the code generic so you don't have to touch it but I didn't tested it (what a shame)

## Credits
Me, the one and only

## Licence
none