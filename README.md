# About it
The idea of this project is to explore implementations and applications of a variety of Data Structures.

# How to run the Docker structure
Using the docker-compose, build the image:
```
docker-compose build
```
Then, run a container from the image:
```
docker-compose run app
```
At this point, you will have access to the shell inside the container, with the code present in the host.

# How to run the tests
Considering that the image has been built, simply run:
```
docker-compose run app bundle exec rspec
```

# How to run static code analyzer
Considering that the image has been built, simply run:
```
docker-compose run app bundle exec rubocop
```

# To do
Some ideas on what to implement:
- Linked List
- Doubly Linked List
- Stack
- Queue
- Binary Search Tree