# frozen_string_literal: true

require 'set'

module LeetCode
  # This is a helper class to model how a gene evolved over time
  class GeneMutation
    attr_reader :gene, :mutations_count, :visited_mutations

    # gene: String
    # mutations: Integer
    # visited_mutations: Set<String>
    def initialize(gene, mutations_count, visited_mutations)
      @gene = gene
      @mutations_count = mutations_count
      @visited_mutations = visited_mutations
    end
  end

  # Implements the solution for the problem Minimum Genetic Mutation from
  # LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # link: https://leetcode.com/problems/minimum-genetic-mutation/
  #
  # The link for the submission is:
  # https://leetcode.com/submissions/detail/700208560/
  class MinimumGeneticMutation
    VALID_VALUES = Set.new(%w[A C G T])
    GENE_LENGTH = 8
    NOT_POSSIBLE = -1

    # start_gene: String
    # end_gene: String
    # genes_bank: Array<String>
    def initialize(start_gene, end_gene, genes_bank)
      @start_gene = start_gene
      @end_gene = end_gene
      @genes_bank = genes_bank
    end

    # Complexity:
    # - Time complexity: O(n)
    # - Space complexity: O(n)
    #
    # How does it work?
    # We perform a BFS over the possible variations from a gene that are
    # included in the genes bank. With that, for a gene, we check
    # all the genes in the gene bank, and add to the BFS queue all the valid
    # genes that have only one mutation from the current gente and haven't been
    # part of its mutation history.
    #
    # returns Integer
    def find_mininum_mutations
      next_to_visit = [GeneMutation.new(@start_gene, 0, Set.new)]

      until next_to_visit.empty?
        gene_mutation = next_to_visit.shift
        return gene_mutation.mutations_count if gene_mutation.gene == @end_gene

        next_to_visit += next_possibilities(gene_mutation)
      end
      NOT_POSSIBLE
    end

    private

    # For a given gene mutation, we collect all the valid genes on the genes
    # bank that are not in this gene mutation history and have a gene distance
    # of 1
    #
    # returns Array<GeneMutation>
    def next_possibilities(gene_mutation)
      possibilities = []
      visited_mutations = gene_mutation.visited_mutations
      gene = gene_mutation.gene

      @genes_bank.each do |new_gene|
        next if visited_mutations.include?(new_gene)

        next unless gene_distance(gene, new_gene) == 1

        new_count = gene_mutation.mutations_count + 1
        new_visited_mutations = visited_mutations.dup.add(gene)

        possibilities << GeneMutation.new(
          new_gene,
          new_count,
          new_visited_mutations
        )
      end

      possibilities
    end

    # Returns the number of different elements between two genes
    #
    # retuns Integer
    def gene_distance(gene1, gene2)
      distance = 0
      (0..GENE_LENGTH - 1).each do |index|
        distance += 1 if gene1[index] != gene2[index]
      end
      distance
    end
  end
end

# # This code is what is needed to run the code on LeetCode
# # @param {String} start
# # @param {String} end
# # @param {String[]} bank
# # @return {Integer}
# def min_mutation(start, end_gene, bank)
#   LeetCode::MinimumGeneticMutation.new(start, end_gene, bank).find_mininum_mutations
# end
