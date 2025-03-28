# Clear existing data
ItemModifierGroup.destroy_all
SectionItem.destroy_all
MenuSection.destroy_all
Modifier.destroy_all
ModifierGroup.destroy_all
Section.destroy_all
Menu.destroy_all

# Create Menu
menu = Menu.create(
  identifier: "test_menu",
  label: "Test Menu",
  state: "active",
  start_date: Date.today,
  end_date: Date.today + 30
)

# Create Sections
section1 = Section.create(
  identifier: "specials",
  label: "Specials",
  description: "A selection of unique items that showcase our daily or seasonal offerings."
)

section2 = Section.create(
  identifier: "build_your_own",
  label: "Build Your Own",
  description: "Freedom to customize your dish exactly how you like it."
)

# Menu has many Sections via MenuSections
MenuSection.create(menu: menu, section: section1, display_order: 1)
MenuSection.create(menu: menu, section: section2, display_order: 2)

# Create 3 Non-Configurable Items in Section 1
item1 = Item.create(type: "Product", identifier: "plain_pizza", label: "Plain Pizza", description: "A simple pizza with cheese.", price: 9.00)
item2 = Item.create(type: "Product", identifier: "caesar_salad", label: "Caesar Salad", description: "Fresh salad with Caesar dressing.", price: 6.00)
item3 = Item.create(type: "Product", identifier: "garlic_bread", label: "Garlic Bread", description: "Toasted bread with garlic and herbs.", price: 4.00)

# Create 2 Configurable Items in Section 2
configurable_item1 = Item.create(type: "Component", identifier: "customizable_pizza", label: "Customizable Pizza", description: "Build your own pizza.", price: 10.00)
configurable_item2 = Item.create(type: "Component", identifier: "customizable_salad", label: "Customizable Salad", description: "Build your own salad.", price: 7.00)

# Section has many Items via SectionItems
SectionItem.create(section: section1, item: item1, display_order: 1)
SectionItem.create(section: section1, item: item2, display_order: 2)
SectionItem.create(section: section1, item: item3, display_order: 3)
SectionItem.create(section: section2, item: configurable_item1, display_order: 1)
SectionItem.create(section: section2, item: configurable_item2, display_order: 2)

# Create Modifier Groups for the Configurable Items (Pizza)
topping_group = ModifierGroup.create(
  identifier: "choose_toppings",
  label: "Choose Toppings",
  selection_required_min: 1,
  selection_required_max: 3
)

sauce_group = ModifierGroup.create(
  identifier: "choose_sauce",
  label: "Choose Sauce",
  selection_required_min: 1,
  selection_required_max: 1
)

# Create Modifiers for Toppings (Pizza)
Modifier.create(label: "Pepperoni", modifier_group: topping_group)
Modifier.create(label: "Mushrooms", modifier_group: topping_group)
Modifier.create(label: "Onions", modifier_group: topping_group)
Modifier.create(label: "Sausage", modifier_group: topping_group)

# Create Modifiers for Sauce (Pizza)
Modifier.create(label: "Tomato Sauce", modifier_group: sauce_group)
Modifier.create(label: "BBQ Sauce", modifier_group: sauce_group)

# Item has many Modifier Groups via Item Modifier Groups (Pizza)
ItemModifierGroup.create(item: configurable_item1, modifier_group: topping_group)
ItemModifierGroup.create(item: configurable_item1, modifier_group: sauce_group)

# Create Modifier Groups for the Configurable Items (Salad)
topping_group_salad = ModifierGroup.create(
  identifier: "choose_salad_toppings",
  label: "Choose Salad Toppings",
  selection_required_min: 0,
  selection_required_max: 3
)

dressing_group = ModifierGroup.create(
  identifier: "choose_dressing",
  label: "Choose Dressing",
  selection_required_min: 1,
  selection_required_max: 1
)

# Create Modifiers for Toppings (Salad)
Modifier.create(label: "Lettuce", modifier_group: topping_group_salad)
Modifier.create(label: "Tomatoes", modifier_group: topping_group_salad)
Modifier.create(label: "Cucumbers", modifier_group: topping_group_salad)
Modifier.create(label: "Olives", modifier_group: topping_group_salad)

# Create Modifiers for Dressing (Salad)
Modifier.create(label: "Ranch Dressing", modifier_group: dressing_group)
Modifier.create(label: "Italian Dressing", modifier_group: dressing_group)
Modifier.create(label: "Balsamic Vinaigrette", modifier_group: dressing_group)

# Item has many Modifier Groups via Item Modifier Groups (Salad)
ItemModifierGroup.create(item: configurable_item2, modifier_group: topping_group_salad)
ItemModifierGroup.create(item: configurable_item2, modifier_group: dressing_group)

puts "Dummy data seeded successfully!"
