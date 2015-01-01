class Dashing.Dumbarton extends Dashing.Widget
  ready: =>
  onData: (snapshot) =>
    departures = snapshot.data
    this.set("departures", departures)
