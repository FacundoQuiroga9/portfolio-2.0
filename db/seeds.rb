# Clear existing data
Project.destroy_all
Technology.destroy_all

# Create Technologies
ror = Technology.create!(name: 'Ruby on Rails')
react = Technology.create!(name: 'React')

# Create Projects
Project.create!(title: 'Proyecto RoR 1', content: 'Contenido del proyecto RoR 1', technology: ror)
Project.create!(title: 'Proyecto React 1', content: 'Contenido del proyecto React 1', technology: react)
