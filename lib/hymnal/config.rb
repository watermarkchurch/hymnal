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
      @brand = "Hymnal"
      @domain = "hymnal.example.com"
      @mail_sender = "Hymnal<hymnal@example.com>"
      @mail_delivery_method = :smtp
      @mail_smtp_settings = {}
      @allow_acls = []
      @deny_acls = []
    end

    def acl
      @acl ||= Hymnal::AccessControlManager.new(
        allows: allow_acls,
        denies: deny_acls
      )
    end

  end

end
