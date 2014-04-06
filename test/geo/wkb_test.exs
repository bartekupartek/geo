defmodule Geo.WKB.Test do
  use ExUnit.Case, async: true

  test "Decode WKB to Point" do
    point = Geo.WKB.decode("0101000000000000000000F03F000000000000F03F")
    assert(point.type == :point)
    assert(point.coordinates == [1, 1])
  end

  test "Decode EWKB to Point" do
    point = Geo.WKB.decode("0101000020E61000009EFB613A637B4240CF2C0950D3735EC0")
    assert(point.type == :point)
    assert(point.coordinates == [36.9639657, -121.8097725])
    assert(point.srid == 4326)
  end

  test "Encode Point to WKB" do
    geom = Geo.Geometry.new(type: :point, coordinates: [1, 1])
    assert(Geo.WKB.encode(geom, :ndr) == "0101000000000000000000F03F000000000000F03F")
  end

  test "Encode Point to EWKB" do
    geom = Geo.Geometry.new(type: :point, coordinates:  [36.9639657, -121.8097725], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0101000020E61000009EFB613A637B4240CF2C0950D3735EC0")
  end

  test "Decode WKB to Line String" do
    point = Geo.WKB.decode("0102000000030000000000000000003E40000000000000244000000000000024400000000000003E4000000000000044400000000000004440")
    assert(point.type == :line_string)
    assert(point.coordinates == [[30,10], [10, 30], [40, 40]])
  end

  test "Decode EWKB to Line String" do
    point = Geo.WKB.decode("0102000020E6100000030000000000000000003E40000000000000244000000000000024400000000000003E4000000000000044400000000000004440")
    assert(point.type == :line_string)
    assert(point.coordinates == [[30,10], [10, 30], [40, 40]])
    assert(point.srid == 4326)
  end

  test "Encode Line String to WKB" do
    geom = Geo.Geometry.new(type: :line_string, coordinates: [[30,10], [10, 30], [40, 40]])
    assert(Geo.WKB.encode(geom, :ndr) == "0102000000030000000000000000003E40000000000000244000000000000024400000000000003E4000000000000044400000000000004440")
  end

  test "Encode Line String to EWKB" do
    geom = Geo.Geometry.new(type: :line_string, coordinates: [[30,10], [10, 30], [40, 40]], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0102000020E6100000030000000000000000003E40000000000000244000000000000024400000000000003E4000000000000044400000000000004440")
  end

  test "Decode WKB to Polygon" do
    point = Geo.WKB.decode("0103000000020000000500000000000000008041400000000000002440000000000080464000000000008046400000000000002E40000000000000444000000000000024400000000000003440000000000080414000000000000024400400000000000000000034400000000000003E40000000000080414000000000008041400000000000003E40000000000000344000000000000034400000000000003E40")
    assert(point.type == :polygon)
    assert(point.coordinates == [ [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]], [[20, 30], [35, 35], [30, 20], [20, 30]] ])
  end

  test "Decode EWKB to Polygon" do
    point = Geo.WKB.decode("0103000020E6100000020000000500000000000000008041400000000000002440000000000080464000000000008046400000000000002E40000000000000444000000000000024400000000000003440000000000080414000000000000024400400000000000000000034400000000000003E40000000000080414000000000008041400000000000003E40000000000000344000000000000034400000000000003E40")
    assert(point.type == :polygon)
    assert(point.coordinates == [ [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]], [[20, 30], [35, 35], [30, 20], [20, 30]] ])
    assert(point.srid == 4326)
  end

  test "Encode Polygon to WKB" do
    geom = Geo.Geometry.new(type: :polygon, coordinates: [ [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]], [[20, 30], [35, 35], [30, 20], [20, 30]] ])
    assert(Geo.WKB.encode(geom, :ndr) == "0103000000020000000500000000000000008041400000000000002440000000000080464000000000008046400000000000002E40000000000000444000000000000024400000000000003440000000000080414000000000000024400400000000000000000034400000000000003E40000000000080414000000000008041400000000000003E40000000000000344000000000000034400000000000003E40")
  end

  test "Encode Polygon to EWKB" do
    geom = Geo.Geometry.new(type: :polygon, coordinates: [ [[35, 10], [45, 45], [15, 40], [10, 20], [35, 10]], [[20, 30], [35, 35], [30, 20], [20, 30]] ], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0103000020E6100000020000000500000000000000008041400000000000002440000000000080464000000000008046400000000000002E40000000000000444000000000000024400000000000003440000000000080414000000000000024400400000000000000000034400000000000003E40000000000080414000000000008041400000000000003E40000000000000344000000000000034400000000000003E40")
  end

  test "Decode WKB to MultiPoint" do
    point = Geo.WKB.decode("01040000000300000001010000000000000000000000000000000000000001010000000000000000003440000000000000344001010000000000000000004E400000000000004E40")
    assert(point.type == :multi_point)
    assert(point.coordinates == [[0, 0], [20, 20], [60, 60]])
  end

  test "Decode EWKB to MultiPoint" do
    point = Geo.WKB.decode("0104000020E61000000300000001010000000000000000000000000000000000000001010000000000000000003440000000000000344001010000000000000000004E400000000000004E40")
    assert(point.type == :multi_point)
    assert(point.coordinates == [[0, 0], [20, 20], [60, 60]])
    assert(point.srid == 4326)
  end

  test "Encode MultiPoint to WKB" do
    geom = Geo.Geometry.new(type: :multi_point, coordinates: [[0, 0], [20, 20], [60, 60]])
    assert(Geo.WKB.encode(geom, :ndr) == "01040000000300000001010000000000000000000000000000000000000001010000000000000000003440000000000000344001010000000000000000004E400000000000004E40")
  end

  test "Encode MultiPoint to EWKB" do
    geom = Geo.Geometry.new(type: :multi_point, coordinates:  [[0, 0], [20, 20], [60, 60]], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0104000020E61000000300000001010000000000000000000000000000000000000001010000000000000000003440000000000000344001010000000000000000004E400000000000004E40")
  end

  test "Decode EWKB to MultiLineString" do
    point = Geo.WKB.decode("0105000020E61000000200000001020000000200000000000000000024400000000000002440000000000000344000000000000034400102000000020000000000000000002E400000000000002E400000000000003E400000000000002E40")
    assert(point.type == :multi_line_string)
    assert(point.coordinates == [ [[10, 10], [20, 20]], [[15, 15], [30, 15]] ])
    assert(point.srid == 4326)
  end

  test "Encode MultiLineString to WKB" do
    geom = Geo.Geometry.new(type: :multi_line_string, coordinates: [ [[10, 10], [20, 20]], [[15, 15], [30, 15]] ])
    assert(Geo.WKB.encode(geom, :ndr) == "01050000000200000001020000000200000000000000000024400000000000002440000000000000344000000000000034400102000000020000000000000000002E400000000000002E400000000000003E400000000000002E40")
  end

  test "Encode MultiLineString to EWKB" do
    geom = Geo.Geometry.new(type: :multi_line_string, coordinates:  [ [[10, 10], [20, 20]], [[15, 15], [30, 15]] ], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0105000020E61000000200000001020000000200000000000000000024400000000000002440000000000000344000000000000034400102000000020000000000000000002E400000000000002E400000000000003E400000000000002E40")
  end


  test "Decode EWKB to MultiPolygon" do
    point = Geo.WKB.decode("0106000020E61000000200000001030000000100000004000000000000000000444000000000000044400000000000003440000000000080464000000000008046400000000000003E4000000000000044400000000000004440010300000002000000060000000000000000003440000000000080414000000000000024400000000000003E40000000000000244000000000000024400000000000003E4000000000000014400000000000804640000000000000344000000000000034400000000000804140040000000000000000003E40000000000000344000000000000034400000000000002E40000000000000344000000000000039400000000000003E400000000000003440")
    assert(point.type == :multi_polygon)
    assert(point.coordinates == [ [ [[40, 40], [20, 45], [45, 30], [40, 40]] ], [ [[20, 35], [10, 30], [10, 10], [30, 5], [45, 20], [20, 35]], [[30, 20], [20, 15], [20, 25], [30, 20]] ] ])
    assert(point.srid == 4326)
  end

  test "Encode MultiPolygon to WKB" do
    geom = Geo.Geometry.new(type: :multi_polygon, coordinates: [ [ [[40, 40], [20, 45], [45, 30], [40, 40]] ], [ [[20, 35], [10, 30], [10, 10], [30, 5], [45, 20], [20, 35]], [[30, 20], [20, 15], [20, 25], [30, 20]] ] ])
    assert(Geo.WKB.encode(geom, :ndr) == "01060000000200000001030000000100000004000000000000000000444000000000000044400000000000003440000000000080464000000000008046400000000000003E4000000000000044400000000000004440010300000002000000060000000000000000003440000000000080414000000000000024400000000000003E40000000000000244000000000000024400000000000003E4000000000000014400000000000804640000000000000344000000000000034400000000000804140040000000000000000003E40000000000000344000000000000034400000000000002E40000000000000344000000000000039400000000000003E400000000000003440")
  end

  test "Encode MultiPolygon to EWKB" do
    geom = Geo.Geometry.new(type: :multi_polygon, coordinates:  [ [ [[40, 40], [20, 45], [45, 30], [40, 40]] ], [ [[20, 35], [10, 30], [10, 10], [30, 5], [45, 20], [20, 35]], [[30, 20], [20, 15], [20, 25], [30, 20]] ] ], srid: 4326)
    assert(Geo.WKB.encode(geom, :ndr) == "0106000020E61000000200000001030000000100000004000000000000000000444000000000000044400000000000003440000000000080464000000000008046400000000000003E4000000000000044400000000000004440010300000002000000060000000000000000003440000000000080414000000000000024400000000000003E40000000000000244000000000000024400000000000003E4000000000000014400000000000804640000000000000344000000000000034400000000000804140040000000000000000003E40000000000000344000000000000034400000000000002E40000000000000344000000000000039400000000000003E400000000000003440")
  end

end
