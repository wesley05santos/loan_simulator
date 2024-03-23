class ApplicationService
  def self.call(*args, **kwargs)
    new(*args, **kwargs).call
  end

  def call
    run
  end
end
