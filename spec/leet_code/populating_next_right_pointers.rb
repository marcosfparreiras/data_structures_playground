# problem: https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/



# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
    # p root
    PopulatingNextRightPointers.new(root).populate
end

class PopulatingNextRightPointers
    EMPTY = '#'

    # root: Node
   def initialize(root)
       @root = root
   end

   # Solution with O(n) space complexity
    # returns: Array<String>
    def populate
        return @root if @root.nil?

        next_to_visit = [@root]
        until next_to_visit.empty?
            # puts ''
            # puts 'queue before'
            # p next_to_visit.map(&:val)
            queue_size = next_to_visit.size

            helper = Node.new(nil)

            # puts "queue size: #{queue_size}"
            (0..queue_size - 1).each do |index|
                # puts "index: #{index}"
                # puts 'cleaning queue'
                # p next_to_visit.map(&:val)
                node = next_to_visit.shift

                helper.next = node
                helper = helper.next

                next_to_visit << node.left if node.left
                next_to_visit << node.right if node.right
            end
        end

        @root

    end




    # solution with O(1) space compexity
    def populate
      return @root if @root.nil?

      head = @root

      while !head.nil?
          dummy = Node.new(nil)
          temp = dummy

          # build linked list for the current level
          while !head.nil?
              if head.left
                  temp.next = head.left
                  temp = temp.next
              end
              if head.right
                  temp.next = head.right
                  temp = temp.next
              end
              head = head.next
          end
          # start from next level
          head = dummy.next
      end


      @root
  end
end
