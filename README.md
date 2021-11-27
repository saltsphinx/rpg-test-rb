# rpg-test-rb
### *Version 1.0.0*

A project I'm making to create RPG elements and system using the programming language Ruby. I am creating this project after completing the [Ruby Programming course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming) from [The Odin Project's](https://www.theodinproject.com/) Full Stack Ruby on Rails curriculum.

This will be a CLI rpg system, so no UI elements or anything. It'll be pure text, so nothing like classic roguelikes where theres ascii graphics/displays.

## Goals for this project/ Checklist
- Dynamic input/response system
  - Input options should depend on the options avaliable without the need for multiple input instances. This will probably mean requiring another class to receive options avaliable to the player. This options shoudl be things like opening a door, picking up items, interacting with npcs or attacking them if thats avaliable.
  - Following the previous goal, there should be commands. Example, `inspect wooden chest`, or `talk old wiard`. There should also be a synonym list for these commands, so instead of `inspect` theres `look`.
  - Able to be used for menus. It should be able to switch between interacting with the game world to option menus or shops. This will probably require a priority list. Just for demonstration of how I see it in my mind in array form, `[[world_interactions]]` -> `[[world_interactions], [potion_shop]]` when player talks to shop npc.