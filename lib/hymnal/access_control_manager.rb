require 'ipaddr'

class Hymnal::AccessControlManager
  attr_reader :allows, :denies

  def initialize(allows: [], denies: [])
    @allows = allows.collect { |range| IPAddr.new(range) }
    @denies = denies.collect { |range| IPAddr.new(range) }
  end

  def allow?(address)
    @allows.any? { |range| range.include?(address) } &&
      @denies.none? { |range| range.include?(address) }
  end

  def deny?(address)
    !allow?(address)
  end

end
