# frozen_string_literal: true

RSpec.describe InteractorsMindmap::TreeNode do
  it "should add child with data and specifying parent to TreeNode" do
    tree_node = InteractorsMindmap::TreeNode.new(root_data: "root")
    subject_tree_node = InteractorsMindmap::TreeNode.new(root_data: "root_2")

    tree_node.add_child(child_data: "child_data", parent: tree_node.root)
    tree_node.add_node_child(node: subject_tree_node.root, parent: tree_node.root.children.first)

    expect(tree_node.root.children.first.children.first.data).to eql("root_2")
  end

  it "should return children data" do
    child_data1 = "child 1"
    child_data2 = "child 2"

    tree_node = InteractorsMindmap::TreeNode.new(root_data: "root")
    tree_node.add_child(child_data: child_data1)
    tree_node.add_child(child_data: child_data2)

    expected_result = [child_data1, child_data2]
    expect(tree_node.root.children_data).to eql(expected_result)
  end

  it "should return children formatted data" do
    child_data1 = "child 1"
    child_data2 = "child 2"

    tree_node = InteractorsMindmap::TreeNode.new(root_data: "root")
    tree_node.add_child(child_data: child_data1)
    tree_node.add_child(child_data: child_data2)

    expected_result = ["## child 1", "## child 2"]
    expect(tree_node.root.children_formatted_data).to eql(expected_result)
  end
end
