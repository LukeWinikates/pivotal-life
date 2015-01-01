describe("Dumbarton Express widget", =>

  it("shows departure times for palo alto stop", =>
    dumbarton = new Dashing.Dumbarton()
    dumbarton.ready()
    data = [
      4, 15, 20
    ]
    setDataOnWidget(dumbarton, {data: data})
    expect(dumbarton.departures).toEqual(
      [4, 15, 20]
    )
  )
)