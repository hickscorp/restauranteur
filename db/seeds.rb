#encoding: utf-8

puts 'Creating / Updating Users...'
admin = User.find_by_email(email='admin@gmail.com') || User.create({
  email:                  email,
  first_name:             'Admin',
  last_name:              'ISTRATOR',
  password:               'Passw0rd',
  password_confirmation:  'Passw0rd',
  roles:                  [ :administrator, :dietitian, :chef ]
})

User.bulk_insert(
  values: [{
    email:                  'diet@gmail.com',
    first_name:             'Diet',
    last_name:              'TETICIEN',
    password:               'Passw0rd',
    password_confirmation:  'Passw0rd',
    roles:                  [ :dietitian ]
  }, {
    email:                  'chef@gmail.com',
    first_name:             'Chef',
    last_name:              'Chef',
    password:               'Passw0rd',
    password_confirmation:  'Passw0rd',
    roles:                  [ :chef ]
  }, {
    email:                  'user@gmail.com',
    first_name:             'User',
    last_name:              'REGULAR',
    password:               'Passw0rd',
    password_confirmation:  'Passw0rd',
    roles:                  []
  }]
)

puts 'Creating / Updating Component Types...'
sodium = ComponentType.find_by_code(code='10110') || ComponentType.create({
  name:       'Sodium',
  code:       code,
  unit:       'mg'
})
magnesium = ComponentType.find_by_code(code='10120') || ComponentType.create({
  name:       'Magnésium',
  code:       code,
  unit:       'mg'
})
phosphore = ComponentType.find_by_code(code='10150') || ComponentType.create({
  name:       'Phosphore',
  code:       code,
  unit:       'mg'
})
potassium = ComponentType.find_by_code(code='10190') || ComponentType.create({
  name:       'Potassium',
  code:       code,
  unit:       'mg'
})
calcium = ComponentType.find_by_code(code='10200') || ComponentType.create({
  name:       'Calcium',
  code:       code,
  unit:       'mg'
})
manganese = ComponentType.find_by_code(code='10251') || ComponentType.create({
  name:       'Manganèse',
  code:       code,
  unit:       'mg'
})
fer = ComponentType.find_by_code(code='10260') || ComponentType.create({
  name:       'Fer',
  code:       code,
  unit:       'mg'
})
cuivre = ComponentType.find_by_code(code='10290') || ComponentType.create({
  name:       'Cuivre',
  code:       code,
  unit:       'mg'
})
zinc = ComponentType.find_by_code(code='10300') || ComponentType.create({
  name:       'Zinc',
  code:       code,
  unit:       'mg'
})
selenium = ComponentType.find_by_code(code='10340') || ComponentType.create({
  name:       'Sélénium',
  code:       code,
  unit:       'µg'
})
iode = ComponentType.find_by_code(code='10530') || ComponentType.create({
  name:       'Iode',
  code:       code,
  unit:       'µg'
})
proteines = ComponentType.find_by_code(code='25000') || ComponentType.create({
  name:       'Protéines',
  code:       code,
  unit:       'g'
})
proteines_brutes = ComponentType.find_by_code(code='25003') || ComponentType.create({
  name:       'Protéines Brutes (N x 6.25)',
  code:       code,
  unit:       'g'
})
glucides = ComponentType.find_by_code(code='31000') || ComponentType.create({
  name:       'Glucides',
  code:       code,
  unit:       'g'
})
sucres = ComponentType.find_by_code(code='32000') || ComponentType.create({
  name:       'Sucres',
  code:       code,
  unit:       'g'
})
energie_kj = ComponentType.find_by_code(code='327') || ComponentType.create({
  name:       'Energie (UE N° 1169/2011)',
  code:       code,
  unit:       'kJ'
})
energie_kcal = ComponentType.find_by_code(code='328') || ComponentType.create({
  name:       'Energie, (UE N° 1169/2011)',
  code:       code,
  unit:       'kcal'
})
amidon = ComponentType.find_by_code(code='33110') || ComponentType.create({
  name:       'Amidon',
  code:       code,
  unit:       'g'
})
energie_dummy1 = ComponentType.find_by_code(code='332') || ComponentType.create({
  name:       'Energie (N x Facteur Jones, avec Fibres)',
  code:       code,
  unit:       'kJ'
})
energie_dummy2 = ComponentType.find_by_code(code='333') || ComponentType.create({
  name:       'Energie (N x Facteur Jones, avec Fibres)',
  code:       code,
  unit:       'kcal'
})
polyols = ComponentType.find_by_code(code='34000') || ComponentType.create({
  name:       'Polyols Totaux',
  code:       code,
  unit:       'g'
})
fibres = ComponentType.find_by_code(code='34100') || ComponentType.create({
  name:       'Fibres',
  code:       code,
  unit:       'g'
})
eau = ComponentType.find_by_code(code='400') || ComponentType.create({
  name:       'Eau',
  code:       code,
  unit:       'g'
})
lipides = ComponentType.find_by_code(code='40000') || ComponentType.create({
  name:       'Lipides',
  code:       code,
  unit:       'g'
})
ag_satures = ComponentType.find_by_code(code='40302') || ComponentType.create({
  name:       'Acides Gras Saturés',
  code:       code,
  unit:       'g'
})
ag_monoinsatures = ComponentType.find_by_code(code='40303') || ComponentType.create({
  name:       'Acides Gras Monoinsaturés',
  code:       code,
  unit:       'g'
})
ag_polyinsatures = ComponentType.find_by_code(code='40304') || ComponentType.create({
  name:       'Acides Gras Polyinsaturés',
  code:       code,
  unit:       'g'
})
ag_butyrique = ComponentType.find_by_code(code='40400') || ComponentType.create({
  name:       'Acides Gras 4:0 Butyrique',
  code:       code,
  unit:       'g'
})
ag_caproique = ComponentType.find_by_code(code='40600') || ComponentType.create({
  name:       'Acides Gras 6:0 Caproïque',
  code:       code,
  unit:       'g'
})
ag_caprylique = ComponentType.find_by_code(code='40800') || ComponentType.create({
  name:       'Acides Gras 8:0 Caprylique',
  code:       code,
  unit:       'g'
})
ag_caprique = ComponentType.find_by_code(code='41000') || ComponentType.create({
  name:       'Acides Gras 10:0 Caprique',
  code:       code,
  unit:       'g'
})
ag_laurique = ComponentType.find_by_code(code='41200') || ComponentType.create({
  name:       'Acides Gras 12:0 Laurique',
  code:       code,
  unit:       'g'
})
ag_myristique = ComponentType.find_by_code(code='41400') || ComponentType.create({
  name:       'Acides Gras 14:0 Myristique',
  code:       code,
  unit:       'g'
})
ag_palmitique = ComponentType.find_by_code(code='41600') || ComponentType.create({
  name:       'Acides Gras 16:0, Palmitique',
  code:       code,
  unit:       'g'
})
ag_stearique = ComponentType.find_by_code(code='41800') || ComponentType.create({
  name:       'Acides Gras 18:0 Stéarique',
  code:       code,
  unit:       'g'
})
ag_oleique = ComponentType.find_by_code(code='41819') || ComponentType.create({
  name:       'Acides Gras 18:1 9c (n-9), Oléique',
  code:       code,
  unit:       'g'
})
ag_linoleique = ComponentType.find_by_code(code='41826') || ComponentType.create({
  name:       'Acides Gras 18:2 9c,12c (n-6) Linoléique',
  code:       code,
  unit:       'g'
})
ag_alpha_linolenique = ComponentType.find_by_code(code='41833') || ComponentType.create({
  name:       'Acides Gras 18:3 c9,c12,c15 (n-3) Alpha-Linolénique',
  code:       code,
  unit:       'g'
})
ag_arachidonique = ComponentType.find_by_code(code='42046') || ComponentType.create({
  name:       'Acides Gras 20:4 5c,8c,11c,14c (n-6) Arachidonique',
  code:       code,
  unit:       'g'
})
ag_epa = ComponentType.find_by_code(code='42053') || ComponentType.create({
  name:       'Acides Gras 20:5 5c,8c,11c,14c,17c (n-3) EPA',
  code:       code,
  unit:       'g'
})
ag_dha = ComponentType.find_by_code(code='42263') || ComponentType.create({
  name:       'Acides Gras 22:6 4c,7c,10c,13c,16c,19c (n-3) DHA',
  code:       code,
  unit:       'g'
})
ag_retinol = ComponentType.find_by_code(code='51200') || ComponentType.create({
  name:       'Rétinol',
  code:       code,
  unit:       'µg'
})
ag_beta_carotene = ComponentType.find_by_code(code='51330') || ComponentType.create({
  name:       'Beta-Carotène',
  code:       code,
  unit:       'µg'
})
vitamine_d = ComponentType.find_by_code(code='52100') || ComponentType.create({
  name:       'Vitamine D',
  code:       code,
  unit:       'µg'
})
vitamine_e = ComponentType.find_by_code(code='53100') || ComponentType.create({
  name:       'Vitamine E',
  code:       code,
  unit:       'mg'
})
vitamine_k1 = ComponentType.find_by_code(code='54101') || ComponentType.create({
  name:       'Vitamine K1',
  code:       code,
  unit:       'µg'
})
vitamine_k2 = ComponentType.find_by_code(code='54104') || ComponentType.create({
  name:       'Vitamine K2',
  code:       code,
  unit:       'µg'
})
vitamine_c = ComponentType.find_by_code(code='55100') || ComponentType.create({
  name:       'Vitamine C',
  code:       code,
  unit:       'mg'
})
vitamine_b1 = ComponentType.find_by_code(code='56100') || ComponentType.create({
  name:       'Vitamine B1 ou Thiamine',
  code:       code,
  unit:       'mg'
})
vitamine_b2 = ComponentType.find_by_code(code='56200') || ComponentType.create({
  name:       'Vitamine B2 ou Riboflavine',
  code:       code,
  unit:       'mg'
})
vitamine_b3 = ComponentType.find_by_code(code='56310') || ComponentType.create({
  name:       'Vitamine B3 ou PP ou Niacine',
  code:       code,
  unit:       'mg'
})
vitamine_b5 = ComponentType.find_by_code(code='56400') || ComponentType.create({
  name:       'Vitamine B5 ou Acide Pantothénique',
  code:       code,
  unit:       'mg'
})
vitamine_b6 = ComponentType.find_by_code(code='56500') || ComponentType.create({
  name:       'Vitamine B6',
  code:       code,
  unit:       'mg'
})
vitamine_b12 = ComponentType.find_by_code(code='56600') || ComponentType.create({
  name:       'Vitamine B12',
  code:       code,
  unit:       'µg'
})
vitamine_b9 = ComponentType.find_by_code(code='56700') || ComponentType.create({
  name:       'Vitamine B9 ou Folates totaux',
  code:       code,
  unit:       'µg'
})
alcool = ComponentType.find_by_code(code='60000') || ComponentType.create({
  name:       'Alcool',
  code:       code,
  unit:       'g'
})
acides_organiques = ComponentType.find_by_code(code='65000') || ComponentType.create({
  name:       'Acides organiques',
  code:       code,
  unit:       'g'
})
cholesterol = ComponentType.find_by_code(code='75100') || ComponentType.create({
  name:       'Cholestérol',
  code:       code,
  unit:       'mg'
})

require 'csv'

def clean_value_string (val)
  val.gsub('-', '0').gsub(' ', '').gsub('<', '').gsub('>', '').to_f
end

unless Component.first
  isz = 0;
  puts 'Creating Foods with their Components...'
  handler     = open "#{Rails.root}/db/CSV/CIQUAL_2013.csv"
  csv_string  = handler.read.encode! 'UTF-8', 'iso-8859-1', invalid: :replace
  CSV.parse csv_string, col_sep: ';', headers: true do |row|
    # Create this food.
    if ((isz += 1) % 10 == 0)
      puts "Creating ingredient #{isz}..."
    end

    food = Food.create!({
      external_id:  row[2].to_i,
      name:         row[3].titleize
    })

    Component.bulk_insert(
      values: [{
        food:                 food,
        component_type:       sodium,
        value:                clean_value_string(row[4])
      }, {
        food:                 food,
        component_type:       magnesium,
        value:                clean_value_string(row[5])
      }, {
        food:                 food,
        component_type:       phosphore,
        value:                clean_value_string(row[6])
      }, {
        food:                 food,
        component_type:       potassium,
        value:                clean_value_string(row[7])
      }, {
        food:                 food,
        component_type:       calcium,
        value:                clean_value_string(row[8])
      }, {
        food:                 food,
        component_type:       manganese,
        value:                clean_value_string(row[9])
      }, {
        food:                 food,
        component_type:       fer,
        value:                clean_value_string(row[10])
      }, {
        food:                 food,
        component_type:       cuivre,
        value:                clean_value_string(row[11])
      }, {
        food:                 food,
        component_type:       zinc,
        value:                clean_value_string(row[12])
      }, {
        food:                 food,
        component_type:       selenium,
        value:                clean_value_string(row[13])
      }, {
        food:                 food,
        component_type:       iode,
        value:                clean_value_string(row[14])
      }, {
        food:                 food,
        component_type:       proteines,
        value:                clean_value_string(row[15])
      }, {
        food:                 food,
        component_type:       proteines_brutes,
        value:                clean_value_string(row[16])
      }, {
        food:                 food,
        component_type:       glucides,
        value:                clean_value_string(row[17])
      }, {
        food:                 food,
        component_type:       sucres,
        value:                clean_value_string(row[18])
      }, {
        food:                 food,
        component_type:       energie_kj,
        value:                clean_value_string(row[19])
      }, {
        food:                 food,
        component_type:       energie_kcal,
        value:                clean_value_string(row[20])
      }, {
        food:                 food,
        component_type:       amidon,
        value:                clean_value_string(row[21])
      }, {
        food:                 food,
        component_type:       energie_dummy1,
        value:                clean_value_string(row[22])
      }, {
        food:                 food,
        component_type:       energie_dummy2,
        value:                clean_value_string(row[23])
      }, {
        food:                 food,
        component_type:       polyols,
        value:                clean_value_string(row[24])
      }, {
        food:                 food,
        component_type:       fibres,
        value:                clean_value_string(row[25])
      }, {
        food:                 food,
        component_type:       eau,
        value:                clean_value_string(row[26])
      }, {
        food:                 food,
        component_type:       lipides,
        value:                clean_value_string(row[27])
      }, {
        food:                 food,
        component_type:       ag_satures,
        value:                clean_value_string(row[28])
      }, {
        food:                 food,
        component_type:       ag_monoinsatures,
        value:                clean_value_string(row[29])
      }, {
        food:                 food,
        component_type:       ag_polyinsatures,
        value:                clean_value_string(row[30])
      }, {
        food:                 food,
        component_type:       ag_butyrique,
        value:                clean_value_string(row[31])
      }, {
        food:                 food,
        component_type:       ag_caproique,
        value:                clean_value_string(row[32])
      }, {
        food:                 food,
        component_type:       ag_caprylique,
        value:                clean_value_string(row[33])
      }, {
        food:                 food,
        component_type:       ag_caprique,
        value:                clean_value_string(row[34])
      }, {
        food:                 food,
        component_type:       ag_laurique,
        value:                clean_value_string(row[35])
      }, {
        food:                 food,
        component_type:       ag_myristique,
        value:                clean_value_string(row[36])
      }, {
        food:                 food,
        component_type:       ag_palmitique,
        value:                clean_value_string(row[37])
      }, {
        food:                 food,
        component_type:       ag_stearique,
        value:                clean_value_string(row[38])
      }, {
        food:                 food,
        component_type:       ag_oleique,
        value:                clean_value_string(row[39])
      }, {
        food:                 food,
        component_type:       ag_linoleique,
        value:                clean_value_string(row[40])
      }, {
        food:                 food,
        component_type:       ag_alpha_linolenique,
        value:                clean_value_string(row[41])
      }, {
        food:                 food,
        component_type:       ag_arachidonique,
        value:                clean_value_string(row[42])
      }, {
        food:                 food,
        component_type:       ag_epa,
        value:                clean_value_string(row[43])
      }, {
        food:                 food,
        component_type:       ag_dha,
        value:                clean_value_string(row[44])
      }, {
        food:                 food,
        component_type:       ag_retinol,
        value:                clean_value_string(row[45])
      }, {
        food:                 food,
        component_type:       ag_beta_carotene,
        value:                clean_value_string(row[46])
      }, {
        food:                 food,
        component_type:       vitamine_d,
        value:                clean_value_string(row[47])
      }, {
        food:                 food,
        component_type:       vitamine_e,
        value:                clean_value_string(row[48])
      }, {
        food:                 food,
        component_type:       vitamine_k1,
        value:                clean_value_string(row[49])
      }, {
        food:                 food,
        component_type:       vitamine_k2,
        value:                clean_value_string(row[50])
      }, {
        food:                 food,
        component_type:       vitamine_c,
        value:                clean_value_string(row[51])
      }, {
        food:                 food,
        component_type:       vitamine_b1,
        value:                clean_value_string(row[52])
      }, {
        food:                 food,
        component_type:       vitamine_b2,
        value:                clean_value_string(row[53])
      }, {
        food:                 food,
        component_type:       vitamine_b3,
        value:                clean_value_string(row[54])
      }, {
        food:                 food,
        component_type:       vitamine_b5,
        value:                clean_value_string(row[55])
      }, {
        food:                 food,
        component_type:       vitamine_b6,
        value:                clean_value_string(row[56])
      }, {
        food:                 food,
        component_type:       vitamine_b12,
        value:                clean_value_string(row[57])
      }, {
        food:                 food,
        component_type:       vitamine_b9,
        value:                clean_value_string(row[58])
      }, {
        food:                 food,
        component_type:       alcool,
        value:                clean_value_string(row[59])
      }, {
        food:                 food,
        component_type:       acides_organiques,
        value:                clean_value_string(row[60])
      }, {
        food:                 food,
        component_type:       cholesterol,
        value:                clean_value_string(row[61])
      }]
    )
  end
end

puts 'Creating / Updating Course Types...'
entree = CourseType.find_by_name(name='Entrée') || CourseType.create({
  name:       name
})
plat = CourseType.find_by_name(name='Plat') || CourseType.create({
  name:       name
})
dessert = CourseType.find_by_name(name='Dessert') || CourseType.create({
  name:       name
})

unless Constraint.first
  puts 'Creating Diets with their Courses and Constraints...'
  diet = Diet.create!({
    user:                   admin,
    name:                   'Régime Équilibre'
  })
  # Sample course: Entrée
  course1 = Course.create!({
    course_type:            entree,
    diet:                   diet,
    name:                   'Entrée'
  })
  Constraint.create!({
    course:                 course1,
    component_type:         energie_kcal,
    minimum_value:          50,
    maximum_value:          200
  })
  Constraint.create!({
    course:                 course1,
    component_type:         lipides,
    minimum_value:          0,
    maximum_value:          10
  })
  Constraint.create!({
    course:                 course1,
    component_type:         fibres,
    minimum_value:          3,
    maximum_value:          0
  })

  # Sample course: Plat.
  course2 = Course.create!({
    course_type:            plat,
    diet:                   diet,
    name:                   'Plat'
  })
  Constraint.create!({
    course:                 course2,
    component_type:         energie_kcal,
    minimum_value:          75,
    maximum_value:          450
  })
  Constraint.create!({
    course:                 course2,
    component_type:         proteines,
    minimum_value:          30,
    maximum_value:          0
  })
  Constraint.create!({
    course:                 course2,
    component_type:         lipides,
    minimum_value:          0,
    maximum_value:          15
  })
  Constraint.create!({
    course:                 course2,
    component_type:         glucides,
    minimum_value:          35,
    maximum_value:          45
  })
  Constraint.create!({
    course:                 course2,
    component_type:         fibres,
    minimum_value:          6,
    maximum_value:          0
  })

  # Sample course: Dessert
  course3 = Course.create!({
    course_type:            dessert,
    diet:                   diet,
    name:                   'Dessert'
  })
  Constraint.create!({
    course:                 course3,
    component_type:         energie_kcal,
    minimum_value:          50,
    maximum_value:          200
  })
  Constraint.create!({
    course:                 course3,
    component_type:         lipides,
    minimum_value:          0,
    maximum_value:          8
  })
  Constraint.create!({
    course:                 course3,
    component_type:         fibres,
    minimum_value:          3,
    maximum_value:          0
  })
end

unless Plate.first
  puts    'Creating Meals with their Plates and Ingredients...'
  diet    = Diet.first
  meal1   = Meal.first || Meal.create!({
    user:                   admin,
    diet:                   diet,
    name:                   'Repas Equilibré'
  })

  # Sample plate: Entrée.
  meal1.plates[0].update({
    course:                 course1,
    meal:                   meal1,
    name:                   'Salade Niçoise'
  })
  meal1.plates[0].ingredients.create({
    food_id:                980,
    quantity:               26
  })
  meal1.plates[0].ingredients.create({
    food_id:                907,
    quantity:               50
  })
  meal1.plates[0].ingredients.create({
    food_id:                1167,
    quantity:               20
  })
  meal1.plates[0].ingredients.create({
    food_id:                936,
    quantity:               55
  })
  meal1.plates[0].ingredients.create({
    food_id:                1285,
    quantity:               15
  })
  meal1.plates[0].ingredients.create({
    food_id:                932,
    quantity:               70
  })
  meal1.plates[0].ingredients.create({
    food_id:                1325,
    quantity:               5
  })
  meal1.plates[0].ingredients.create({
    food_id:                794,
    quantity:               3
  })
  # Sample plate: Plat.
  meal1.plates[1].update({
    course:                 course2,
    meal:                   meal1,
    name:                   'Tartare de Boeuf'
  })
  # Sample plate: Dessert
  meal1.plates[2].update({
    course:                 course3,
    meal:                   meal1,
    name:                   'Tarte Tatin'
  })
end
