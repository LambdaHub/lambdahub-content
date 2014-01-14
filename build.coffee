fs = require 'fs'
coffee_script = require 'coffee-script'


main = () ->
  fs.mkdirSync('build') if not fs.existsSync('build')
  json = JSON.stringify build_info(), null, 2
  fs.writeFileSync "build/content.json", new Buffer(json, 'utf8')
  console.log 'Built.'


build_info = () ->
  items = {}
  for path, type of find_types_by_path()
    slug = path.match(/\/([^\/]+)\.coffee$/)[1]
    coffee = fs.readFileSync(path).toString('utf8')
    js = coffee_script.compile coffee, bare: true
    info = eval(js)
    info.type = type
    items[slug] = info
  items


find_types_by_path = () ->
  filenames = {}
  types_by_path = {}
  for type in ['function']
    dir = "#{__dirname}/#{type}s"
    for filename in fs.readdirSync(dir)
      if filename.match /\.coffee$/
        if filenames[filename]
          throw new Error "duplicate name: #{filename}"
        filenames[filename] = true
        types_by_path["#{dir}/#{filename}"] = type
  types_by_path


main() if not module.parent
