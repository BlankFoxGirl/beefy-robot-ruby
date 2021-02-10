# Beefy Robot

This script is a means to create a wonderful living virtual world for Beefy the robot.

The idea behind this is, we may have a world where Beefy could have a Beefette and a little Betty bot and each of them might be able to move around their little 5 x 5 unit board. It's possible we may want the board to be scalable to 500 x 500 units so they all have more room to move around.

## Unit Tests
Using rspec, a number of unit tests were written to independently test the business logic surrounding different models and the corresponding helper methods for said models. Each of these models can be used in different ways in different projects because I'm all about re-usability.

## Automated Scenarios
A number of scenarios ("examples") have been crafted based on the supplied brief of which will be executed in sequential order via the `each_scenatio.sh` entry-point which is used by docker. This entry-point will first execute an rspec and then run each scenario.

## Execution
The execution of this version of Beefy is simple CLI.

`ruby run.rb my_commands.txt`

The second argument (shown as *my_commands.txt*) informs the script what file it should execute commands from.