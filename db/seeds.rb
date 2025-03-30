# Clear existing data in proper order
ItemModifierGroup.destroy_all
SectionItem.destroy_all
MenuSection.destroy_all
Modifier.destroy_all
ModifierGroup.destroy_all
Item.destroy_all
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
configurable_item1 = Item.create(type: "Product", identifier: "customizable_pizza", label: "Customizable Pizza", description: "Build your own pizza.", price: 10.00)
configurable_item2 = Item.create(type: "Product", identifier: "customizable_salad", label: "Customizable Salad", description: "Build your own salad.", price: 20.00)

# Section has many Items via SectionItems
SectionItem.create(section: section1, item: item1, display_order: 3)
SectionItem.create(section: section1, item: item2, display_order: 1)
SectionItem.create(section: section1, item: item3, display_order: 2)
SectionItem.create(section: section2, item: configurable_item1)
SectionItem.create(section: section2, item: configurable_item2)

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

# Create Modifiers + Item (Component) for Toppings (Pizza)
component1 = Item.create(type: "Component", identifier: "pepperoni", label: "Pepperoni", description: "Pepperoni for pizza topping", price: 3.00)
component2 = Item.create(type: "Component", identifier: "mushrooms", label: "Mushrooms", description: "Mushrooms for pizza topping", price: 3.00)
component3 = Item.create(type: "Component", identifier: "onions", label: "Onions", description: "Onions for pizza topping", price: 3.00)
component4 = Item.create(type: "Component", identifier: "sausages", label: "Sausages", description: "Sausages for pizza topping", price: 3.00)

Modifier.create(modifier_group: topping_group, item: component1, price_override: 0, display_order: 4)
Modifier.create(modifier_group: topping_group, item: component2, price_override: 0, display_order: 1)
Modifier.create(modifier_group: topping_group, item: component3, price_override: 0, display_order: 2)
Modifier.create(modifier_group: topping_group, item: component4, price_override: 0, display_order: 3)

# Create Modifiers for Sauce (Pizza)
component5 = Item.create(type: "Component", identifier: "tomato_sauce", label: "Tomato Sauce", description: "Tomato sauce for pizza sauce", price: 3.00)
component6 = Item.create(type: "Component", identifier: "bbq_sauce", label: "BBQ Sauce", description: "BBQ sauce for pizza sauce", price: 3.00)

Modifier.create(modifier_group: sauce_group, item: component5, price_override: 0)
Modifier.create(modifier_group: sauce_group, item: component6, price_override: 0)

# Item has many Modifier Groups via Item Modifier Groups (Pizza)
ItemModifierGroup.create(item: configurable_item1, modifier_group: topping_group)
ItemModifierGroup.create(item: configurable_item1, modifier_group: sauce_group)

# Create Modifier Groups for the Configurable Items (Salad)
dressing_group = ModifierGroup.create(
  identifier: "choose_dressing",
  label: "Choose Dressing",
  selection_required_min: 1,
  selection_required_max: 2
)

# Create Modifiers + Item (Component) for Toppings (Salad)
component7 = Item.create(type: "Component", identifier: "balsamic", label: "Balsamic", description: "Balsamic for salad dressing", price: 1.00)
component8 = Item.create(type: "Component", identifier: "ranch", label: "Ranch", description: "Ranch for salad dressing", price: 1.00)
component9 = Item.create(type: "Component", identifier: "honey", label: "Honey", description: "Honey for salad dressing", price: 1.00)

Modifier.create(modifier_group: dressing_group, item: component7, price_override: 0, display_order: 2)
Modifier.create(modifier_group: dressing_group, item: component8, price_override: 0, display_order: 1)
Modifier.create(modifier_group: dressing_group, item: component9, price_override: 0, display_order: 3)

# Item has many Modifier Groups via Item Modifier Groups (Salad)
ItemModifierGroup.create(item: configurable_item2, modifier_group: dressing_group)

puts "Dummy data seeded successfully!"
