module CrystalPlaygroundLinkedList
  class Node(T)
    @next_node : Node(T)?
    @previous_node : Node(T)?

    property next_node
    property previous_node
    getter element

    def initialize(@element : T)
    end
  end

  class LinkedList(T)
    @first_node : Node(T)?
    @last_node : Node(T)?
    @size : Int32 = 0

    getter size

    def add_first(element : T)
      insert_node = Node.new element
      unless old_first_node = @first_node
        @first_node = insert_node
        @last_node = insert_node
        @size += 1
      else
        @first_node = insert_node
        insert_node.next_node = old_first_node
        old_first_node.previous_node = insert_node
        @size += 1
      end
    end

    def add_last(element : T)
      insert_node = Node.new element
      unless old_last_node = @last_node
        @first_node = insert_node
        @last_node = insert_node
        @size += 1
      else
        @last_node = insert_node
        insert_node.previous_node = old_last_node
        old_last_node.next_node = insert_node
        @size += 1
      end
    end

    def add(element : T, at index : Int32)
      unless (0..@size).includes? index
        raise "out of index, size: #{@size}, index: #{index}"
      end

      if index == 0
        add_first element
      elsif index == @size
        add_last element
      else
        old_node = find_node index
        old_previous_node = old_node.previous_node if old_node
        if old_node && old_previous_node
          insert_node = Node.new element
          old_previous_node.next_node = insert_node
          insert_node.previous_node = old_previous_node
          insert_node.next_node = old_node
          old_node.previous_node = insert_node
          @size += 1
        end
      end
    end

    def last
      if last_node = @last_node
        last_node.element
      else
        nil
      end
    end

    def first
      if first_node = @first_node
        first_node.element
      else
        nil
      end
    end

    def find(at index : Int32)
      unless (0..@size).includes? index
        raise "out of index, size: #{@size}, index: #{index}"
      end
      if found_node = find_node index
        found_node.element
      else
        nil
      end
    end

    private def find_node(index)
      if current_node = @first_node
        index.times do |i|
          if next_node = current_node.next_node
            current_node = next_node
          else
            # illegal error
            raise "out range of index: #{index}"
          end
        end
      end
      current_node
    end
  end
end
