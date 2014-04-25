class Anode
  _ajax: (method, endpoint, data) ->
    $.ajax
      type: method
      url: "http://localhost:3000/api2/#{endpoint}"
      headers:
        'Accept-Version': '1.0.0'

  get: (resource) ->
    @_ajax 'get', resource

anode = window.Anode = new Anode

anode.get('products')
