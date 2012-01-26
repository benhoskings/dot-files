#!/usr/bin/env ruby
###############

#############################
# Statistics Module for Ruby
# (C) Derrick Pallas
#
# Authors: Derrick Pallas
# Website: http://derrick.pallas.us/ruby-stats/
# License: Academic Free License 3.0
# Version: 2007-10-01b
#

class Numeric
  def square ; self * self ; end
end

class Array
  def sum ; self.inject(0){|a,x|x+a} ; end
  def mean ; self.sum.to_f/self.size ; end
  def median
    case self.size % 2
      when 0 then self.sort[self.size/2-1,2].mean
      when 1 then self.sort[self.size/2].to_f
    end if self.size > 0
  end
  def histogram ; self.sort.inject({}){|a,x|a[x]=a[x].to_i+1;a} ; end
  def mode
    map = self.histogram
    max = map.values.max
    map.keys.select{|x|map[x]==max}
  end
  def squares ; self.inject(0){|a,x|x.square+a} ; end
  def variance ; self.squares.to_f/self.size - self.mean.square; end
  def deviation ; Math::sqrt( self.variance ) ; end
  def permute ; self.dup.permute! ; end
  def permute!
    (1...self.size).each do |i| ; j=rand(i+1)
      self[i],self[j] = self[j],self[i] if i!=j
    end;self
  end
  def sample n=1 ; (0...n).collect{ self[rand(self.size)] } ; end
end

if __FILE__ == $0
  fields = []
  $stdin.each do |line|
    data = line.chomp.split("\t")
    data.each_index do |i|
      fields[i] = [] if fields[i].nil?
      fields[i] << data[i].to_f if data[i].size > 0
    end
  end

  fields.each_index do |i|
    next unless fields[i].size > 0
    puts [ i,  fields[i].mean, fields[i].deviation ] \
         .collect{|x|x.to_s}.join("\t")
  end
end

# END
######
