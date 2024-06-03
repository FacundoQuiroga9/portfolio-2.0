# Clear existing data
Project.destroy_all
Technology.destroy_all

# Create Technologies
ror = Technology.create!(name: 'Ruby on Rails')
react = Technology.create!(name: 'React')

# Create Projects
Project.create!(
  title: 'Fixi',
  content: '',
  technology: ror,
  github_url: 'https://github.com/elisaherre/FIXI_SERVICE',
  website_url: 'http://www.fixiservice.xyz/',
  image: { io: URI.open('https://res.cloudinary.com/dhobfoyaf/image/upload/v1717438409/wshenruc3hlrp1p4ptfv4uzfx4uz.jpg'), filename: 'your_image.jpg' }
)

Project.create!(
  title: 'OLSC Buenos Aires',
  content: '',
  technology: ror,
  github_url: 'https://github.com/FacundoQuiroga9/blog',
  website_url: '',
  image: { io: URI.open('https://res.cloudinary.com/dhobfoyaf/image/upload/v1717437913/heir7d3357miye0bh3ie364s8wtj.png'), filename: 'your_image.jpg' }
)

Project.create!(
  title: 'Ffarm Taid',
  content: '',
  technology: react,
  github_url: 'https://github.com/FacundoQuiroga9/Ffarm-Taid',
  website_url: 'https://hosteriaffarmtaid.com/',
  image: { io: URI.open('https://res.cloudinary.com/dhobfoyaf/image/upload/v1717438424/5nn1twiokb1123p989j3xmgjl7uc.jpg'), filename: 'your_image.jpg' }
)

Project.create!(
  title: 'Dynamite Fireworks',
  content: '',
  technology: react,
  github_url: 'https://github.com/FacundoQuiroga9/justice-fireworks',
  website_url: 'https://dynamitefireworks.uno/',
  image: { io: URI.open('https://res.cloudinary.com/dhobfoyaf/image/upload/v1717438435/yqxi2h9uhwife092mhrwm64dgmzr.jpg'), filename: 'your_image.jpg' }
)
