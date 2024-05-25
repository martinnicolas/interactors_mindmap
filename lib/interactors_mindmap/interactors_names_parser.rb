# frozen_string_literal: true

# InteractorsMindmap module
module InteractorsMindmap
  # Parse interactor file names
  class InteractorsNamesParser
    attr_reader :files_path, :inside_organize_block

    def initialize(files_path:)
      @files_path = files_path
      @inside_organize_block = false
    end

    def self.perform(files_path:)
      new(files_path: files_path).perform
    end

    def perform
      tree_node = InteractorsMindmap::TreeNode.new(root_data: "Interactors")

      Dir[files_path].sort.each do |file|
        processed_interactors_tree_node = process_interactors_file(file)

        tree_node.add_node_child(node: processed_interactors_tree_node.root)
      end

      tree_node.reorder_with_recursion!
      tree_node.to_formatted_array
    end

    private

    def process_interactors_file(file)
      tree_node = InteractorsMindmap::TreeNode.new(root_data: interactor_class_name_from_file(file))

      file_content = File.read(file)

      file_content.each_line do |line|
        if first_line_in_organize_block?(line)
          interactor_names = interactor_names_in_first_line_organize_block(line)
          interactor_names.each do |interactor_name|
            tree_node.add_child(child_data: interactor_name)
          end
        end

        next unless line_inside_organize_block?(line)

        interactor_names = interactor_name_in_organize_block(line)
        interactor_names.each do |interactor_name|
          tree_node.add_child(child_data: interactor_name)
        end
      end

      reset_inside_organize_block
      tree_node
    end

    def interactor_class_name_from_file(file)
      filename = file.split("/").last
      name_without_extension = filename.split(".").first
      name_without_extension.split("_").collect!(&:capitalize).join
    end

    def first_line_in_organize_block?(line)
      @inside_organize_block = true if line =~ /^\s{2}[^\s]/ && line.strip.start_with?("organize")
    end

    def line_inside_organize_block?(line)
      line =~ /^\s{4}[^\s]/ && inside_organize_block
    end

    def interactor_names_in_first_line_organize_block(line)
      line.strip.split(/[^[[:word:]!:]]+/).drop(1)
    end

    def interactor_name_in_organize_block(line)
      line.strip.split(/[^[[:word:]!:]]+/)
    end

    def reset_inside_organize_block
      @inside_organize_block = false
    end
  end
end
