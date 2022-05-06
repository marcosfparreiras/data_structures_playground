# frozen_string_literal: true

require 'set'

module HackerRank
  # This class implements the solution to the Roads and Libraries problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/torque-and-development/problem
  class RoadsAndLibraries
    # num_cities: Integer Number of cities
    # c_lib: Integer Cost of one library
    # c_road: Integer Cost of one road
    # cities: Array<Array<Integer>> Possible connection between the cities
    def initialize(num_cities, c_lib, c_road, cities)
      @num_cities = num_cities
      @c_lib = c_lib
      @c_road = c_road
      @cities = cities
    end

    # Complexity: (n: number of cities, m: number of connections)
    # Time Complexity: O(m x n)
    # Space Complexity: O(n^2)
    #
    # How does it work?
    # The problem can be seen in the following simplified way:
    # - in order to calculate the overall minimum cost to build libraries and
    #   roads, we actually just need to find all the possible groups of cities,
    #   calculate the minimum cost for this group, and then sum up of all these
    #   costs
    #
    # The minimum cost for a cities group is for sure the following:
    # - if c_lib <= c_road, the cheapest solution is by building a library in
    #   each city.
    # - if c_ilb > c_road, the cheapest solution is by building 1 library plus
    #   n - 1 roads, being n the number of cities in the group. This is true
    #   because in a group of n cities that are somehow connected to each other,
    #   we need n - 1 roads to connect them all.
    #
    #
    # return Integer: the minimum cost
    def find_minimum_cost
      return @num_cities * @c_lib if @c_lib <= @c_road

      cities_groups = collect_cities_groups
      cities_groups.inject(0) do |min_cost, cities_group|
        min_cost + min_cost_for_cities_group(cities_group)
      end
    end

    private

    # We collect the cities groups by keeping a hash cities_groups that maps
    # the city number to the set of cities in which this city is part of
    #
    # return Array<Set<Integer>>
    def collect_cities_groups
      cities_groups = initialize_cities_groups
      @cities.each do |connection|
        merge_cities_groups(cities_groups, connection[0], connection[1])
      end
      cities_groups.values.uniq
    end

    # We initialize the Hash<Integer, Set> by mapping each city to a set
    # containing only this one city
    #
    # return Hash<Integer, Set>
    def initialize_cities_groups
      (1..@num_cities).each_with_object({}) do |city_number, hsh|
        hsh[city_number] = Set.new([city_number])
      end
    end

    # In order to stablish a connection between two cities, we just need to
    # merge the two sets representing the cities group in which each one of them
    # is. In order to optime this process, we use the following strategies:
    # - if both cities are part of the same cities group, there is nothing to
    #   be done, and we just return
    # - if the cities are part of different cities groups, we add all the cities
    #   of the smalles group to the biggest one, and for each one of these
    #   cities (originally in the smallest group), we map to the new composed
    #   cities group
    #
    # return void
    def merge_cities_groups(cities_groups, city1, city2)
      group1 = cities_groups[city1]
      group2 = cities_groups[city2]

      return if group1 == group2

      smallest = group1.size <= group2.size ? group1 : group2
      greatest = group1.size > group2.size ? group1 : group2

      smallest.each do |city|
        greatest.add(city)
        cities_groups[city] = greatest
      end
    end

    # The case in which c_lib <= c_road has been treated already, so here we
    # just need to define the minimum cost the cities group for the case when
    # c_lib > c_road (see comment of #find_minimum_cost)
    #
    # return Integer: the minimum cost for a cities_group
    def min_cost_for_cities_group(cities_group)
      @c_lib + ((cities_group.size - 1) * @c_road)
    end
  end
end
