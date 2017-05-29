# AStarMaze
This repository contains my сoursework for Object-oriented programming subject.

The topic is the shortest path in maze. I used A* algorithm to find path between 2 points. For now, every path caclulating takes data to work with from ActiveRecord(to be able to save current maze), so why it's can be little bit slowly. In the future, i want to cache current maze and work with data from it, and save it at the end.

You can see [demo](https://fathomless-reaches-28583.herokuapp.com/) on heroku.

## How to run server

To run server you should configurate your ```database.yml``` file to work with postgresql database.

After that install gems by ```bundle install``` and run server ```rails s```
