class BaseDecorator < Draper::Decorator
  delegate :id, :to_model
end
