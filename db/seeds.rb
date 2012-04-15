# This file should contain all the record creation needed to seed the
# database with its default values. The data can then be loaded with
# the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.delete_all

tm = Type.create(
            name: 'Monumento',
            description: 'Edificio de interes turistico o artistico')

tn = Type.create(
            name: 'Naturaleza',
            description: 'Lugar al aire libre de interes natural o de recreo')

tr = Type.create(
            name: 'Ruina',
            description: 'Lugar o resto de interes arquelogico')


Site.delete_all


Site.create(
            name: 'Pedriza',
            description: 'Magnifico valle al norte de Madrid en el Macizo Central',
            type_id: tn.id,
            image_url: 'pedriza.png')

Site.create(
            name: 'Catedral de Florencia',
            description: 'Catedral de la ciudad de Florencia con la que se inicia el Renacimiento',
            type_id: tm.id,
            image_url: 'florencia.png')

Site.create(
            name: 'Jardin de Lineo',
            description: 'Jardin de la ciudad sueca de Uppsala donde el famoso naturalista enia su coleccion de plantas',
            type_id: tn.id,
            image_url: 'arbol1.png')

Site.create(
            name: 'Reichstag',
            description: 'Parlamento aleman en la ciudad de Berlin',
            type_id: tm.id,
            image_url: 'reichstag.png')

Site.create(
            name: 'Pergamo',
            description: 'Puerta del mercado de la antigua ciudad griega de Pergamo del museo arquelogico de Berlin',
            type_id: tr.id,
            image_url: 'pergamo.png')

#  user_id esta protegido con "attr_protected" y debe inicializarse asi,
#  Site.create(....) levantaria una excepcipón al intentar inicializarlo
Site.all.each { |obj| obj.user_id = 1 ; obj.save }

admin = User.create! do |u|
      u.email = 'admin@planet.com'
      u.password = 'planet'
      u.password_confirmation = 'planet'
      u.name = 'admin'
end