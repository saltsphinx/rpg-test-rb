# rpg-test-rb
### *Version 1.0.0*

A project I'm making to create RPG elements and system using the programming language Ruby. I am creating this project after completing the [Ruby Programming course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming) from [The Odin Project's](https://www.theodinproject.com/) Full Stack Ruby on Rails curriculum.

This will be a CLI rpg system, so no UI elements or anything. It'll be pure text, so nothing like classic roguelikes where theres ascii graphics/displays.

## Goals for this project/ Checklist
- Dynamic input/response system
  - Input options should depend on the options avaliable without the need for multiple input instances. This will probably mean requiring another class to receive options avaliable to the player. This options shoudl be things like opening a door, picking up items, interacting with npcs or attacking them if thats avaliable.
  - Following the previous goal, there should be commands. Example, `inspect wooden chest`, or `talk old wiard`. There should also be a synonym list for these commands, so instead of `inspect` theres `look`.
  - Able to be used for menus. It should be able to switch between interacting with the game world to option menus or shops. This will probably require a priority list. Just for demonstration of how I see it in my mind in array form, `[[world_interactions]]` -> `[[world_interactions], [potion_shop]]` when player talks to shop npc.
  - This class should only call other methods. It should receive a list of the players current option, parse their input after theyve entered it to seperate the command from the parameters, check the list for that command, then call those methods with the parameters. 

- World and world objects
  - The world, as in room instances, and world objects, as in the static things that occupy those rooms
  - Room desciptions, whenever a player enters a room or inspects the room, there should be a description, if there is one, that prints to the cli.
  - Object will have something similar when inspected.
  - Objects will have templates, like all wooden tables will be the same.

Example of what commands should look like
- `take apple table`, `take apple7 table`, `take apple table4`
  - the player should have the option to be specific if they'd like