Complaint.create!([
  {policy_number: "12345", name: "Javier", phone: "04122351213", email: "merchan@test.com", message: "Nunca me llamaron"},
  {policy_number: "124", name: "asdsdg", phone: "asdg", email: "asdgas", message: "asdg"},
  {policy_number: "qwrq", name: "qwrqw", phone: "qwr", email: "qwr", message: "qwr"},
  {policy_number: "123", name: "123", phone: "1231", email: "123", message: "23"},
  {policy_number: "123", name: "123", phone: "123", email: "123", message: "123"},
  {policy_number: "123", name: "123", phone: "123", email: "sas@asf", message: "123"},
  {policy_number: "1235234", name: "Javier", phone: "23512614634", email: "merchan@gmail.com", message: "No"}
])
InsuranceRequest.create!([
  {name: "Javier", insurance_type: "Vida Automóvil Incendio ", message: "Hola", contact_via: "Llamada", email: "merchan@example.com", phone: "04122362151", token: nil, token_expired: nil, rating_id: nil},
  {name: "asdg", insurance_type: "Vida ", message: "", contact_via: "llamada telefónica", email: "asdg", phone: "asdg", token: nil, token_expired: nil, rating_id: nil},
  {name: "Ja", insurance_type: "Vida ", message: "", contact_via: "llamada telefónica", email: "mer@asf.com", phone: "+50755555555", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud ", message: "Holi", contact_via: "llamada telefónica", email: "merchan@gmao.com", phone: "+1241251235235", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud ", message: "No", contact_via: "llamada telefónica", email: "merchan@gmail.com", phone: "+507124124124", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud ", message: "No", contact_via: "WhatsApp", email: "merchan1395@gmail.com", phone: "413523523523", token: nil, token_expired: nil, rating_id: nil},
  {name: "JAvier", insurance_type: "Salud ", message: "werwerwe", contact_via: "llamada telefónica", email: "wqerqetq@asfsf.com", phone: "235135135", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud ", message: "No", contact_via: "llamada telefónica", email: "merchan@gmail.com", phone: "1241523463463", token: nil, token_expired: nil, rating_id: nil},
  {name: "Nacho", insurance_type: "Salud ", message: "No", contact_via: "llamada telefónica", email: "nacho@gmail.com", phone: "2352346234161", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud ", message: "Hola probando", contact_via: "llamada telefónica", email: "merchan1395@gmail.com", phone: "04122362151", token: nil, token_expired: nil, rating_id: nil},
  {name: "Javier", insurance_type: "Salud Incendio ", message: "Probando", contact_via: "llamada telefónica", email: "merchan1395@gmail.com", phone: "64572343634", token: "bf19bf1e-cb24-42e9-b8f0-f15a6ac06bda", token_expired: true, rating_id: nil},
  {name: "Eduardo", insurance_type: "Automóvil ", message: "Prueba rate", contact_via: "WhatsApp", email: "eflorez@labequis.com", phone: "34624575473", token: "95511381-4e2f-4de7-9e44-fe506e294ac9", token_expired: true, rating_id: nil},
  {name: "Prueba", insurance_type: "Salud ", message: "Prueba request bot", contact_via: "WhatsApp", email: "merchan1395@gmail.com", phone: "14261346", token: "e4bc20f5-6092-4213-990a-67aa22aaabf9", token_expired: false, rating_id: nil}
])
Rating.create!([
  {calification: "5", message: "No", insurance_request_id: 11},
  {calification: "5", message: "Epa", insurance_request_id: 12},
  {calification: "5", message: "Asfasf", insurance_request_id: 12}
])
