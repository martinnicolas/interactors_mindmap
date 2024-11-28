# frozen_string_literal: true

# InteractorsMindmap module
module InteractorsMindmap
  # Tree node data structure to manage data
  class TreeNode
    attr_reader :root

    def initialize(root_data:)
      @root = TreeNode::Node.new(data: root_data)
    end

    def add_child(child_data:, parent: nil)
      if parent.nil?
        root.add_child(child_data:)
      else
        parent.add_child(child_data:)
      end
    end

    def add_node_child(node:, parent: nil)
      if parent.nil?
        root.add_node_child(node:)
      else
        parent.add_node_child(node:)
      end
    end

    def search_node(data:)
      root.search_node(data:)
    end

    def reorder_with_recursion!
      root.children.each do |child|
        found_nodes = search_node(data: child.data)
        found_children_nodes = found_nodes.select { |node| node.level > child.level }
        found_children_nodes.map { |child_node| child_node.replace_with(node: child) }
      end
    end

    def to_formatted_array(node: root)
      array = []

      array << node.formatted_data

      if node.children.any?
        node.children.each do |child|
          array << to_formatted_array(node: child)
        end
      end

      array.flatten
    end

    # Node data structure to manage data
    class Node
      attr_reader :data
      attr_accessor :children, :level, :parent

      def initialize(data:, parent: nil)
        @data = data
        @parent = parent
        @children = []

        calculate_level
      end

      def add_child(child_data:)
        node = TreeNode::Node.new(data: child_data, parent: self)

        @children << node
      end

      def add_node_child(node:)
        clon = node.clone_node

        @children << clon

        clon.parent = self
        clon.recalculate_level
      end

      def children_data
        children.map(&:data)
      end

      def children_formatted_data
        children.map(&:formatted_data)
      end

      def root?
        parent.nil?
      end

      def formatted_data
        data_with_space = " #{data}"
        data_with_space.rjust(data_with_space.length + level, "#")
      end

      def replace_with(node:)
        return "Cant replace root_node" if root?

        index = parent.children.find_index(self)
        clon = node.clone_node
        clon.parent = parent
        parent.children[index] = clon
        clon.recalculate_level
      end

      def recalculate_level
        calculate_level

        return unless children.any?

        children.map(&:recalculate_level)
      end

      def search_node(data:)
        nodes = []

        if children.any?
          children.each do |child|
            nodes << child.search_node(data:)
          end
        elsif self.data == data
          nodes << self
        end

        nodes.flatten
      end

      def clone_node
        clon = clone

        if children.any?
          children_clones = []

          children.each do |child|
            child.parent = clon
            children_clones << child.clone_node
          end

          clon.children = children_clones
        end

        clon
      end

      private

      def calculate_level
        calculated_level = 1

        node_parent = parent
        until root? || node_parent.nil?
          node_parent = node_parent.parent
          calculated_level += 1
        end

        @level = calculated_level
      end
    end
  end
end
