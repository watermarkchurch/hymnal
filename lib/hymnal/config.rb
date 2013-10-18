module Hymnal

  def self.configure
    yield config if block_given?
  end

  def self.config
    @config ||= Config.new
  end

  class Config
    attr_accessor :brand, :domain
    attr_accessor :allow_acls, :deny_acls
    attr_accessor :block_message
    attr_accessor :password
    attr_accessor :mail_sender, :mail_delivery_method, :mail_smtp_settings

    def initialize
      @brand = ENV['HYMNAL_BRAND']
      @domain = ENV['HYMNAL_DOMAIN']
      @mail_sender = ENV['HYMNAL_MAIL_SENDER']
      @mail_delivery_method = :smtp
      @mail_smtp_settings = {}
      @allow_acls = (ENV['HYMNAL_ALLOW_ACLS'] || "").split(',')
      @deny_acls = (ENV['HYMNAL_DENY_ACLS'] || "").split(',')
      @block_message = ENV['HYMNAL_BLOCK_MESSAGE']
      @password = ENV['HYMNAL_PASSWORD']
    end

    def acl
      @acl ||= Hymnal::AccessControlManager.new(
        allows: allow_acls,
        denies: deny_acls
      )
    end

  end

end
