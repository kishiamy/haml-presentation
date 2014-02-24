console.log("realtime.js loaded")
$ ->
  console.log("realtime.js inside jQuery callback")
  wsUri = "ws://localhost:5000"
  realTimeConnection = (wsUri) ->
    console.log("realtime.js inside realTimeConnection")
    window.socket = new WebSocket(wsUri)
    socket.onmessage = (event) ->
      console.log(event.data)
      switch (event.data)
        when "left"
          Reveal.navigateLeft()
        when "right"
          Reveal.navigateRight()
        when "up"
          Reveal.navigateUp()
        when "down"
          Reveal.navigateDown()
    socket.onclose = setTimeout (-> realTimeConnection wsUri), 5000
  realTimeConnection(wsUri)

