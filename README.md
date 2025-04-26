# 🍽️ Menu API with GraphQL
A Ruby on Rails app for managing restaurant menus with nested sections, items, modifier groups and modifiers. Built with GraphQL and deployed on Heroku.

Functions include CRUD operations for:
- Menus
- Sections
- Items (including modifier groups and their modifiers)

## 📌 Prerequisites
Ensure you have the following installed:

Ruby 3.3.3

Rails 7.2.2.1

PostgreSQL >= 12

Bundler (gem install bundler)

## 🔧 Installation
Clone the Repository (master branch)
```
git clone https://github.com/zianncupcake/menus_backend
cd menus_backend
```

Install Dependencies
```
bundle install
```

## 🛠 Database Setup
Create and migrate the database
```
rails db:create
rails db:migrate
rails db:seed 
```

Verify database connection
```
rails db:setup
```

## 🚀 Running the Application
Start the server 
```
rails server
```
Access the API
- Access GraphiQL IDE at: http://localhost:3000/graphiql
- endpoint: http://localhost:3000/graphql

## 🌐 Deployment
The API is deployed on Heroku
- Access the endpoint at: [🔗 Hosted endpoint](https://damp-eyrie-40872-66f66d973e5e.herokuapp.com/graphql)
