# frozen_string_literal: true

require './ex3/ex3'
require 'benchmark'

m = Ex3::MetaClass.new
n = Ex3::NormalClass.new
o = 10_000_000

Benchmark.bm(7) do |x|
  x.report("w/o meta") { o.times { n.add(1) } }
  x.report("w/  meta") { o.times { m.add(1) } }
end
