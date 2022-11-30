process.env.NODE_ENV = process.env.NODE_ENV || 'production'
RAILS_ENV=production ,  NODE_ENV=production, 
RAKE_ENV=production 

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
