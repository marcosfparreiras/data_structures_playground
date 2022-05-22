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
- Reorganize files structure isolating the data structures implementation
- Document solutions for:
  - Coin Change from Leet Code (https://leetcode.com/problems/coin-change/submissions/)
  - Critical Connections in a Network (https://leetcode.com/problems/critical-connections-in-a-network/)
  - Longest Increasing Path (https://leetcode.com/problems/longest-increasing-path-in-a-matrix/)
  - Unique Paths II (https://leetcode.com/problems/unique-paths-ii/)
  - Pow (https://leetcode.com/problems/powx-n/)
  - Palindromic Substrings (https://leetcode.com/problems/palindromic-substrings/)
